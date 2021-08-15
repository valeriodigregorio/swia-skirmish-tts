-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
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

-- DICE ATTRIBUTES
m.DAMAGE = "Damage"
m.SURGE = "Surge"
m.ACCURACY = "Accuracy"
m.BLOCK = "Block"
m.EVADE = "Evade"
m.DODGE = "Dodge"

m.DICE_ATTRIBUTES = {
    m.DAMAGE,
    m.SURGE,
    m.ACCURACY,
    m.BLOCK,
    m.EVADE,
    m.DODGE
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

return m
