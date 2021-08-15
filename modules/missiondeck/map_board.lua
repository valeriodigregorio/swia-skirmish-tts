-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local UTILS = require("swia-skirmish-tts/modules/common/utils")
local MAP = require("swia-skirmish-tts/modules/missiondeck/map")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("map_board", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
--  Map Board
-- -----------------------------------------------------------------------------

local MapBoard = {}
MapBoard.__index = MapBoard

function MapBoard:create(uuid)
  logger:debug({uuid}, "MapBoard:create")
  local obj = {}
  setmetatable(obj, MapBoard)
  obj.uuid = uuid
  obj.state = {}
  for i, map in pairs(MAP) do
    obj.state[map.guid] = i
  end
  return obj
end

function MapBoard:getState(map)
  return self.state[map.getGUID()]
end

function MapBoard:getCurrentMap()
  for _, object in pairs(getAllObjects()) do
    local state = self.state[object.getGUID()]
    if state ~= nil then
      logger:debug({state, object}, "MapBoard:getCurrentMap")
      return state, object
    end
  end
  logger:debug({}, "MapBoard:getCurrentMap")
  return nil, nil
end

function MapBoard:getMapByCard(card)
  for i, map in pairs(MAP) do
    for j, name in pairs(map.cards) do
      local card_name = UTILS.safeGetName(card)
      if (card_name == name) then
        logger:debug({i, map, j}, "MapBoard:getMapByCard")
        return i, map, j
      end
    end
  end
  logger:debug({}, "MapBoard:getMapByCard")
  return nil, nil, nil
end

function MapBoard:getCurrentMission()
  local zone = getObjectFromGUID(self.uuid)
  for _, object in ipairs(zone.getObjects()) do
    logger:debug({object}, "MapBoard:getCurrentMission")
    if object.tag == "Card" then
      local i, map, mission
      i, map, mission = self:getMapByCard(object)
      if mission ~= nil then
        logger:debug({i, map, mission}, "MapBoard:getCurrentMission")
        return i, map, mission
      end
    end
  end
  logger:debug({}, "MapBoard:getCurrentMission")
  return nil, nil, nil
end

return MapBoard
