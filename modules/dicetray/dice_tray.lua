-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")
local COMP = require("swia-skirmish-tts/modules/common/components")
local DEFS = require("swia-skirmish-tts/modules/common/definitions")


local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("dice_tray", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
--  Dice Results
-- -----------------------------------------------------------------------------

local function isAllowed(object)
  return COMP.isDie(object)
      or DEFS.isPowerToken(object)
      or DEFS.isCondition(object, DEFS.HIDDEN)
      or DEFS.isCondition(object, DEFS.WEAKENED)
end

local function sumResults(r1, r2)
  for k, v in pairs(r2) do
    r1[k] = (r1[k] or 0) + v
  end
  return r1
end

local function calculateResults(objects)
  local results = {}
  for _, object in pairs(objects) do
    logger:debug({object}, "DiceTray:calculateResults")
    if COMP.isDie(object) then
      local r = COMP.getDieResults(object)
      results = sumResults(results, r)
    elseif DEFS.isCondition(object, DEFS.HIDDEN) then
      results[DEFS.ACCURACY] = (results[DEFS.ACCURACY] or 0) - 2
    elseif DEFS.isCondition(object, DEFS.WEAKENED) then
      results[DEFS.SURGE] = (results[DEFS.SURGE] or 0) - 1
      results[DEFS.EVADE] = (results[DEFS.EVADE] or 0) - 1
    elseif DEFS.isPowerToken(object) then
      local description = UTILS.safeGetDescription(object)
      results[description] = (results[description] or 0) + 1
    end
  end
  return results
end

-- -----------------------------------------------------------------------------
--  Dice Tray
-- -----------------------------------------------------------------------------

local DiceTray = {}
DiceTray.__index = DiceTray

function DiceTray:create(color, tray, zone)
  logger:debug({color, tray, zone}, "DiceTray:create")
  local obj = {}
  setmetatable(obj, DiceTray)
  obj.color = color
  obj.tray = tray
  obj.zone = zone
  return obj
end

function DiceTray:updateResults()
  logger:debug({self.color}, "DiceTray:updateResults")
  local results = calculateResults(self.zone.getObjects())
  Global.call('onDiceResultsUpdate', {self.color, results})
end

function DiceTray:removeObject(object)
  if isAllowed(object) then
    logger:debug({self.color, object}, "DiceTray:removeObject")
    self:updateResults()
  end
end

function DiceTray:addObject(object)
  if isAllowed(object) then
    if COMP.isDie(object) then
      self:waitObjectRollEnd(object.getGUID())
    else
      logger:debug({self.color, object, self.zone, self.zone.getObjects()}, "DiceTray:addObject")
      self:updateResults()
    end
  end
end

function DiceTray:waitObjectRollEnd(object_guid)
  logger:debug({object_guid}, "DiceTray:waitObjectRollEnd")
  local rollWatch = function()
    local obj = getObjectFromGUID(object_guid)
    if obj ~= nil then
      return obj.resting
    end
    return true
  end
  local rollEnd = function()
    local obj = getObjectFromGUID(object_guid)
    if obj ~= nil then
      self:onObjectRollEnd(obj)
    end
  end
  Wait.condition(rollEnd, rollWatch)
end

function DiceTray:onObjectRollEnd(object)
  logger:debug({self.color, object}, "DiceTray:onObjectRollEnd")
  self:updateResults()
end

return DiceTray
