-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")
local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local COMP = require("swia-skirmish-tts/modules/common/components")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("figure", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- Utilities
-- -----------------------------------------------------------------------------

local ReservedColors = {}
for _, player in pairs(DEFS.PLAYERS) do
  ReservedColors[player] = {}
end

local function reserveColorTint(name, player)
  logger:debug({name, player}, "reserveColorTint")
  local color = ReservedColors[player][name]
  color = DEFS.cycleColor(color) or DEFS.getPlayerColor(player)
  ReservedColors[player][name] = color
  return color
end

-- -----------------------------------------------------------------------------
-- Figure
-- -----------------------------------------------------------------------------

local Figure = {}
Figure.__index = Figure

function Figure:create(object, player)
  logger:debug({object, player}, "Figure:create")
  local obj = {}
  setmetatable(obj, Figure)
  obj.id = COMP.getFigureId(object)
  obj.object = object
  obj.player = player
  return obj
end

function Figure:matchCard(card)
  logger:debug({self, card}, "Figure:matchCard")
  if card == nil then
    return false
  end
  local id = card:getFigureId()
  return id == self.id
end

function Figure:setColor(color)
  logger:debug({self, color}, "Figure:setColor")
  color =  color or reserveColorTint(self.id, self.player)
  if self.object.setColorTint ~= nil then
    self.object.setColorTint(color)
    return color
  end
  return nil
end

return Figure
