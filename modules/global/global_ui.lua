-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("global_ui", "Blue"):setState(false)

local indexes = {
    [DEFS.DAMAGE] = 1,
    [DEFS.SURGE] = 2,
    [DEFS.ACCURACY] = 3,
    [DEFS.BLOCK] = 1,
    [DEFS.EVADE] = 2,
    [DEFS.DODGE] = 3
  }

-- -----------------------------------------------------------------------------
-- Global UI
-- -----------------------------------------------------------------------------

local m = {}

function m.splitId(id)
    local player, group, figure = string.match(id, "(Player%d+)%p(%d+)%p*(%d*)")
    group = tonumber(group)
    if figure ~= "" then
        figure = tonumber(figure)
    end
    logger:debug({id, player, group, figure}, "splitId")
    return player, group, figure
end

function m.getGroupButtonId(player, group, figure)
    local id = nil
    if figure == nil then
        id = string.format("%s.%d", player, group)
    else
        id = string.format("%s.%d.%d", player, group, figure)
    end
    logger:debug({player, group, figure, id}, "getGroupButtonId")
    return id
end

function m.getResultButtonId(player, type)
    local index = indexes[type]
    local id = nil
    if index ~= nil then
        id = string.format("%s.Result%d", player, index)
    end
    logger:debug({player, type, index, id}, "getResultButtonId")
    return id
end

return m
