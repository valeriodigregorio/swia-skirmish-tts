-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local UTILS = require("swia-skirmish-tts/modules/common/utils")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("play_area", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- Globals
-- -----------------------------------------------------------------------------

local X = 1
local Y = 2
local Z = 3

-- -----------------------------------------------------------------------------
-- Play Area
-- -----------------------------------------------------------------------------

local PlayArea = {}
PlayArea.__index = PlayArea

local BASE_POSITION = {-17.50, 2.00, -26.50}
local BASE_ROTATION = {0.00, 180.00, 0.00}
local X_OFFSET = 5.00
local Z_OFFSET = -5.00
local CARDS_PER_ROW = 8
local COMMAND_DECK_INDEX = 16
local MAX_DEPLOYMENT_CARD_INDEX = 15
local MAX_COMMAND_CARD_INDEX = 15

function PlayArea:create(player)
  logger:debug({player}, "PlayArea:create")
  local obj = {}
  setmetatable(obj, PlayArea)
  obj.player = player
  return obj
end

function PlayArea:getCardPosition(cardType, index)
  logger:debug({self.player, index}, "PlayArea:getCardPosition")
  if cardType == DEFS.DEPLOYMENT_CARD and index > MAX_DEPLOYMENT_CARD_INDEX then
    return nil
  end
  if cardType == DEFS.COMMAND_CARD and index > MAX_COMMAND_CARD_INDEX then
    return nil
  end
  if cardType == DEFS.COMMAND_CARD then
    index = COMMAND_DECK_INDEX
  end
  local position = UTILS.clone_array(BASE_POSITION)
  position[X] = position[X] + X_OFFSET * ((index-1) % CARDS_PER_ROW)
  if index > CARDS_PER_ROW then
    position[Z] = position[Z] + Z_OFFSET
  end
  if self.player == DEFS.SECOND_PLAYER then
    position[X] = position[X] * -1
    position[Z] = position[Z] * -1
  end
  return position
end

function PlayArea:getCardRotation(cardType, index)
  logger:debug({self.player, index}, "PlayArea:getCardRotation")
  if cardType == DEFS.DEPLOYMENT_CARD and index > MAX_DEPLOYMENT_CARD_INDEX then
    return nil
  end
  if cardType == DEFS.COMMAND_CARD and index > MAX_COMMAND_CARD_INDEX then
    return nil
  end
  local rotation = UTILS.clone_array(BASE_ROTATION)
  if self.player == DEFS.SECOND_PLAYER then
    rotation[Y] = 0.00
  else
    rotation[Y] = 180.00
  end
  if cardType == DEFS.COMMAND_CARD then
    rotation[X] = 180.00
    rotation[Y] = rotation[Y] + 180.00
  end
  return rotation
end

return PlayArea
