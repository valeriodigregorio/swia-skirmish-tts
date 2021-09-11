-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")
local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local STRING = require("swia-skirmish-tts/modules/common/string")

local m = {}

local IACP_CARD_TAG = "IACP"

-- -----------------------------------------------------------------------------
--  Utilities
-- -----------------------------------------------------------------------------

local function handleLukeSkywalkerCard(name, description)
  if string.match(name, "Luke Skywalker") then
    return name..", "..description
  end
  return name
end

local function handleTheMandalorianCard(name, description)
  if string.match(name, "The Mandalorian") then
    return name..", "..description
  end
  return name
end

local function handleTemporaryAllianceCard(name, description)
  if string.match(name, "Temporary Alliance") then
    return name..", "..description
  end
  return name
end

local function handleIACPCard(name, description)
  if string.match(description or "", IACP_CARD_TAG) then
    name = name:gsub(" %- "..IACP_CARD_TAG, "")
    return name.." - "..IACP_CARD_TAG
  end
  return name
end

local DeploymentCardHandles = {
  handleLukeSkywalkerCard,
  handleTheMandalorianCard,
  handleTemporaryAllianceCard,
  handleIACPCard
}

local CommandCardHandles = {
  handleIACPCard
}

local function handleEliteFigure(name, _)
  if name == nil then
    return name
  end
  return name:gsub("Elite ", "")
end

local function handleLukeSkywalkerFigure(name, description)
  if string.match(name, "Luke Skywalker") and string.match(description, "Jedi Knight") then
    return name.." (Jedi)"
  end
  return name
end

local function handleTheMandalorianFigure(name, description)
  if string.match(name, "The Mandalorian") and string.match(description, "Rising Phoenix") then
    return name -- TODO: special mini -- .." (Phoenix)"
  end
  return name
end

local FigureHandles = {
  handleEliteFigure,
  handleLukeSkywalkerFigure,
  handleTheMandalorianFigure
}

-- -----------------------------------------------------------------------------
--  Cards
-- -----------------------------------------------------------------------------

function m.isCard(object)
  return object ~= nil and object.tag == "Card"
end

function m.getCardDescription(object)
  local description = UTILS.safeGetDescription(object)
  local lines = STRING.splitChr(description, "\n")
  for _, line in ipairs(lines) do
    local n = string.match(line, "(%d*) HP")
    if n == nil then
      return line or ""
    end
    break
  end
  return ""
end

function m.getDeploymentCardId(object)
  local name = STRING.cleanupCodes(UTILS.safeGetName(object))
  local description = STRING.cleanupCodes(m.getCardDescription(object))
  for _, handle in ipairs(DeploymentCardHandles) do
    name = handle(name, description or "")
  end
  return name
end

function m.getCommandCardId(object)
  local name = STRING.cleanupCodes(UTILS.safeGetName(object))
  local description = STRING.cleanupCodes(m.getCardDescription(object))
  for _, handle in ipairs(CommandCardHandles) do
    name = handle(name, description or "")
  end
  return name
end

-- -----------------------------------------------------------------------------
--  Figures
-- -----------------------------------------------------------------------------

function m.isElite(object)
  local name = UTILS.safeGetName(object)
  return name:match("%[DA1917%]") ~= nil
end

function m.isCompanion(object)
  local name = UTILS.safeGetName(object)
  return name:match("%[E6E42B%]") ~= nil
end

function m.getFigureId(object)
  local name = STRING.cleanupCodes(UTILS.safeGetName(object))
  local description = STRING.cleanupCodes(UTILS.safeGetDescription(object))
  for _, handle in ipairs(FigureHandles) do
    name = handle(name, description)
  end
  return name
end

function m.isFigure(object)
  return object.type == "Figurine"
     and UTILS.safeGetName(object):match("Crate") == nil
     and UTILS.safeGetName(object):match("Terminal") == nil
     and UTILS.safeGetName(object):match("Door") == nil
end

-- -----------------------------------------------------------------------------
--  Dice
-- -----------------------------------------------------------------------------

function m.isDie(object)
  return string.match(UTILS.safeGetDescription(object), "Dice") ~= nil
end

function m.getDieResults(object)
  local results = {}
  for _, result in pairs(DEFS.DICE_RESULTS) do
    results[result] = 0
  end
  local side = object.getValue()
  local result = object.getRotationValues()[side].value
  for n, attribute in string.gmatch(result, '(%d)%s(%a*)') do
    results[attribute] = results[attribute] + n
  end
  return results
end

return m
