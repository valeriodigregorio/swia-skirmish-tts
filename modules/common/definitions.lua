-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")

-- -----------------------------------------------------------------------------
--  Definitions
-- -----------------------------------------------------------------------------

local m = {}

-- PLAYERS
m.FIRST_PLAYER = "Player1"
m.SECOND_PLAYER = "Player2"

m.PLAYERS = {
    m.FIRST_PLAYER,
    m.SECOND_PLAYER
}

-- PLAYER COLORS
m.FIRST_PLAYER_COLOR = "Blue"
m.SECOND_PLAYER_COLOR = "Red"

m.PLAYER_COLORS = {
    m.FIRST_PLAYER_COLOR,
    m.SECOND_PLAYER_COLOR
}

local playerColors = {
    [m.FIRST_PLAYER] = m.FIRST_PLAYER_COLOR,
    [m.SECOND_PLAYER] = m.SECOND_PLAYER_COLOR
}

local playerByColor = {
    [m.FIRST_PLAYER_COLOR] = m.FIRST_PLAYER,
    [m.SECOND_PLAYER_COLOR] = m.SECOND_PLAYER
}

local ColorsSequence = {
    ["Blue"] = "Teal",
    ["Teal"] = "Green",
    ["Green"] = "Black",
    ["Black"] = "Grey",
    ["Grey"] = "White",
    ["White"] = "Red",
    ["Red"] = "Orange",
    ["Orange"] = "Yellow",
    ["Yellow"] = "Purple",
    ["Purple"] = "Pink",
    ["Pink"] = "Brown",
    ["Brown"] = "Blue",
}

m.DisabledColor = "rgb(0.25, 0.25, 0.25)"

function m.getPlayerColor(player)
    return playerColors[player]
end

function m.getPlayerByColor(color)
    return playerByColor[color]
end

function m.cycleColor(color)
    if color == nil then
        return nil
    end
    return ColorsSequence[color]
end

-- CARD SYSTEMS
m.FFG = "FFG"
m.IACP = "IACP"

m.CARD_SYSTEMS = {
    m.FFG,
    m.IACP
}

-- CARD TYPES
m.DEPLOYMENT_CARD = "deployment"
m.COMMAND_CARD = "command"

m.CARD_TYPES = {
    m.DEPLOYMENT_CARD,
    m.COMMAND_CARD
}

-- AFFILIATIONS/FACTIONS
m.REBEL = "REBEL"
m.IMPERIAL = "IMPERIAL"
m.MERCENARY = "MERCENARY"
m.NEUTRAL = "NEUTRAL"

m.AFFILIATIONS = {
    m.REBEL,
    m.IMPERIAL,
    m.MERCENARY,
    m.NEUTRAL
}

m.FACTIONS = {
    m.REBEL,
    m.IMPERIAL,
    m.MERCENARY
}

-- DICE RESULTS
m.DAMAGE = "Damage"
m.SURGE = "Surge"
m.ACCURACY = "Accuracy"
m.BLOCK = "Block"
m.EVADE = "Evade"
m.DODGE = "Dodge"

m.DICE_RESULTS = {
    m.DAMAGE,
    m.SURGE,
    m.ACCURACY,
    m.BLOCK,
    m.EVADE,
    m.DODGE
}

m.ATTACK_RESULTS = {
    m.DAMAGE,
    m.SURGE,
    m.ACCURACY,
}

m.DEFENSE_RESULTS = {
    m.BLOCK,
    m.EVADE,
    m.DODGE
}

function m.isAttack(results)
    results = results or {}
    local attack = false
    for _, result in pairs(m.ATTACK_RESULTS) do
        attack = attack or ((results[result] or -1) > 0)
    end
    return attack
end

function m.isDefense(results)
    results = results or {}
    local defense = false
    for _, result in pairs(m.DEFENSE_RESULTS) do
        defense = defense or ((results[result] or -1) >= 0)
    end
    return defense
end

function m.sanitizeResults(results)
    results = results or {}
    local dice_results = {}
    if m.isAttack(results) then
      for _, result in pairs(m.ATTACK_RESULTS) do
        dice_results[result] = results[result] or 0
      end
      return dice_results
    end
    for _, result in pairs(m.DEFENSE_RESULTS) do
      dice_results[result] = results[result] or 0
    end
    return dice_results
end

-- CONDITIONS
m.FOCUSED = "Focused"
m.HIDDEN = "Hidden"
m.STUNNED = "Stunned"
m.BLEEDING = "Bleeding"
m.WEAKENED = "Weakened"

m.CONDITIONS = {
    m.FOCUSED,
    m.HIDDEN,
    m.STUNNED,
    m.BLEEDING,
    m.WEAKENED
}

local CONDITIONS_LOOKUP = {}
for _, condition in pairs(m.CONDITIONS) do
    CONDITIONS_LOOKUP[condition] = condition
end

function m.isCondition(object, condition)
    local cond = m.getCondition(object)
    return (condition == nil and cond ~= condition)
        or (condition ~= nil and cond == condition)
end

function m.getCondition(object)
    local name = UTILS.safeGetName(object)
    return CONDITIONS_LOOKUP[name]
end

-- POWER TOKENS
m.POWER_TOKENS = {
    m.DAMAGE,
    m.SURGE,
    m.BLOCK,
    m.EVADE,
}

local POWER_TOKENS_LOOKUP = {}
for _, token in pairs(m.POWER_TOKENS) do
    POWER_TOKENS_LOOKUP[token] = token
end

function m.isPowerToken(object, token_type)
    local token = m.getPowerToken(object)
    return (token_type == nil and token ~= token_type)
        or (token_type ~= nil and token == token_type)
end

function m.getPowerToken(object)
    local name = UTILS.safeGetName(object)
    if string.match(name, " Power Token") == nil then
        return nil
    end
    name = name:gsub(" Power Token", "")
    return POWER_TOKENS_LOOKUP[name]
end

-- OTHER COMPONENTS
function m.isReconToken(object)
    local name = UTILS.safeGetName(object)
    return string.match(name, "Recon Token") ~= nil
end

function m.isCrate(object)
    local name = UTILS.safeGetName(object)
    return string.match(name, "Crate") ~= nil
end

return m
