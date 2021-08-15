-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Figure = require("swia-skirmish-tts/modules/common/figure")
local DeploymentCard = require("swia-skirmish-tts/modules/common/deployment_card")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("figure_bag", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
-- Globals
-- -----------------------------------------------------------------------------

local Y = 2
local Z = 3

-- -----------------------------------------------------------------------------
-- Figures
-- -----------------------------------------------------------------------------

local FigureBag = {}
FigureBag.__index = FigureBag

local Y_DISPLACEMENT = 2.00
local Z_DISPLACEMENT = 1.55

function FigureBag:create(guids)
  logger:debug({guids}, "FigureBag:create")
  local obj = {}
  setmetatable(obj, FigureBag)
  obj.guids = guids
  obj.counter = {}
  return obj
end

function FigureBag:_notifyColorTintChange(player, card, color)
  logger:debug({self, player, card, color}, "FigureBag:_notifyColorTintChange")
  local index = self.counter[card.getGUID()] or 0
  index = index + 1
  local deployment = DeploymentCard:create(card)
  if deployment ~= nil then
    Global.call('onColorTintChange', {player, card, index, color})
    local numOfFigures = deployment:getNumberOfFigures()
    if index >= numOfFigures then
      self.counter[card.getGUID()] = nil
    else
      self.counter[card.getGUID()] = index
    end
  end
end

function FigureBag:_search(card)
  logger:debug({self, card}, "FigureBag:search")
  for _, guid in ipairs(self.guids) do
    local bag = getObjectFromGUID(guid)
    local state = 0
    local object = bag.takeObject()
    if Figure:create(object):matchCard(card) then
      state = 1
    else
      for _, st in pairs(object.getStates()) do
        if Figure:create(st):matchCard(card) then
          state = st.id
        end
      end
    end
    object.destruct()
    if state ~= 0 then
      return bag, state
    end
  end
  return nil, nil
end

function FigureBag:take(card, player)
  logger:debug({self, card, player}, "FigureBag:take")

  local deployment = DeploymentCard:create(card)
  if deployment == nil then
    return
  end

  local numOfFigures = deployment:getNumberOfFigures()
  if numOfFigures <= 0 then
    return
  end

  local bag, state = self:_search(card)
  if bag == nil then
    return
  end
  logger:debug({bag, state}, "FigureBag:take")

  local position = card.getPosition()
  local rotation = card.getRotation()

  position[Y] = position[Y] + Y_DISPLACEMENT
  if numOfFigures == 2 then
    position[Z] = position[Z] - (Z_DISPLACEMENT/2)
  elseif numOfFigures == 3 then
    position[Z] = position[Z] - Z_DISPLACEMENT
  end

  local figuresLeft = numOfFigures
  while figuresLeft > 0 do
    logger:debug({figuresLeft, numOfFigures}, "FigureBag:take")
    bag.takeObject({
      position = position,
      rotation = rotation,
      smooth = false,
      callback_function = function(obj)
        if state ~= 1 then
          obj = obj.setState(state)
        end
        local figure = Figure:create(obj, player)
        local color = figure:setColor()
        self:_notifyColorTintChange(player, card, color)
      end
    })
    position[Z] = position[Z] + Z_DISPLACEMENT
    figuresLeft = figuresLeft - 1
  end
end

return FigureBag
