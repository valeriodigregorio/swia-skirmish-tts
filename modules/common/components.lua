-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")
local STRING = require("swia-skirmish-tts/modules/common/string")

local m = {}

-- -----------------------------------------------------------------------------
--  Utilities
-- -----------------------------------------------------------------------------

local function cleanupCodes(str)
  return str:gsub("%[[%a%d/]*%]", "")
end

local function handleLukeSkywalkerCard(name, description)
  if string.match(name, "Luke Skywalker") then
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

local CardHandles = {
  handleLukeSkywalkerCard,
  handleTemporaryAllianceCard
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

local FigureHandles = {
  handleEliteFigure,
  handleLukeSkywalkerFigure
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
      return line
    end
    break
  end
end

function m.getCardId(object)
  local name = UTILS.safeGetName(object)
  name = cleanupCodes(name)
  local description = m.getCardDescription(object)
  description = cleanupCodes(description)
  for _, handle in ipairs(CardHandles) do
    name = handle(name, description)
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
  local name = UTILS.safeGetName(object)
  local description = UTILS.safeGetDescription(object)
  for _, handle in ipairs(FigureHandles) do
    name = handle(name, description)
  end
  return name
end

-- -----------------------------------------------------------------------------
--  Dice
-- -----------------------------------------------------------------------------

function m.isDie(object)
  return string.match(UTILS.safeGetDescription(object), "Dice") ~= nil
end

function m.getDieResults(object)
  local results = {
    ['Damage'] = 0,
    ['Surge'] = 0,
    ['Accuracy'] = 0,
    ['Block'] = 0,
    ['Evade'] = 0,
    ['Dodge'] = 0,
  }
  local side = object.getValue()
  local result = object.getRotationValues()[side].value
  for n, attribute in string.gmatch(result, '(%d)%s(%a*)') do
    results[attribute] = results[attribute] + n
  end
  return results
end

-- -----------------------------------------------------------------------------
--  Tokens
-- -----------------------------------------------------------------------------

function m.isHiddenCondition(object)
  return UTILS.safeGetName(object) == "Hidden"
end

function m.isWeakenedCondition(object)
  return UTILS.safeGetName(object) == "Weakened"
end

function m.isPowerToken(object)
  local name = UTILS.safeGetName(object)
  return string.match(name, "Power Token") ~= nil
end

return m
