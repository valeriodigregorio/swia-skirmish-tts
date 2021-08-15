-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local UTILS = require("swia-skirmish-tts/modules/common/utils")

local Card = require("swia-skirmish-tts/modules/global/card")
local Result = require("swia-skirmish-tts/modules/global/result")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("name", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Play Area
-- -----------------------------------------------------------------------------

local PlayArea = {}
PlayArea.__index = PlayArea
PlayArea.MAX_CARDS = 14

function PlayArea:create(player)
  logger:debug({player}, "PlayArea:create")
  local obj = {}
  setmetatable(obj, PlayArea)
  obj.player = player
  obj.cards = {}
  obj.cards_list = {}
  obj.count = 0
  self.results = {}
  for _, attribute in DEFS.DICE_ATTRIBUTES do
    self.results[attribute] = Result:create(self.player, attribute)
  end
  return obj
end

function PlayArea:update()
  logger:debug({self}, "PlayArea:update")
  table.sort(self.cards_list, function(c1, c2)
    return c1:compare(c2)
  end)
  for i, card in ipairs(self.cards_list) do
    card:setGroup(i)
  end
end

function PlayArea:hasCard(object)
  logger:debug({self, object}, "PlayArea:hasCard")
  return self.cards[object.getGUID()] ~= nil
end

function PlayArea:addCard(card)
  logger:debug({self, card}, "PlayArea:addCard")
  if self.count >= PlayArea.MAX_CARDS then
    logger:error({"ERROR: Too many card in play area.", card, self}, "PlayArea:addCard")
    return nil
  end
  self.count = self.count + 1
  local gui = Card:create(card, self.player, self.count)
  table.insert(self.cards_list, gui)
  self.cards[card.object.getGUID()] = gui
  self:update()
  return card
end

function PlayArea:removeCard(card)
  logger:debug({self, card}, "PlayArea:removeCard")
  return UTILS.getOrDefault(self.cards, card.object.getGUID(), nil, function(c)
    for i=1, #self.cards_list do
      self.cards_list[i]:disable()
    end
    table.remove(self.cards_list, card.group)
    self.cards[card.object.getGUID()] = nil
    self.count = self.count - 1
    self:update()
    return c
  end)
end

function PlayArea:getHealthPoints(group, figure)
  logger:debug({self, group, figure}, "PlayArea:getHealthPoints")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:getHealthPoints(figure)
  end)
end

function PlayArea:getMaxHealthPoints(group)
  logger:debug({self, group}, "PlayArea:getMaxHealthPoints")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:getMaxHealthPoints()
  end)
end

function PlayArea:getTotalHealthPoints(group)
  logger:debug({self, group}, "PlayArea:getTotalHealthPoints")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:getTotalHealthPoints()
  end)
end

function PlayArea:setHealthPoints(group, figure, value)
  logger:debug({self, group, figure, value}, "PlayArea:setHealthPoints")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:setHealthPoints(figure, value)
  end)
end

function PlayArea:changeColor(group, figure)
  logger:debug({self, group, figure}, "PlayArea:changeColor")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:changeColor(figure)
  end)
end

function PlayArea:setColor(object, figure, color)
  logger:debug({self, object, figure, color}, "PlayArea:setColor")
  return UTILS.getOrDefault(self.cards, object.getGUID(), nil, function(card)
    return card:setColor(figure, color)
  end)
end

function PlayArea:deployCardGui(group)
  logger:debug({self, group}, "PlayArea:deployCardGui")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:deployCardGui()
  end)
end

function PlayArea:depleteCardGui(group)
  logger:debug({self, group}, "PlayArea:depleteCardGui")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:depleteCardGui()
  end)
end

function PlayArea:readyCardGui(group)
  logger:debug({self, group}, "PlayArea:readyCardGui")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:readyCardGui()
  end)
end

function PlayArea:exhaustCardGui(group)
  logger:debug({self, group}, "PlayArea:exhaustCardGui")
  return UTILS.getOrDefault(self.cards_list, group, nil, function(card)
    return card:exhaustCardGui()
  end)
end

function PlayArea:setDiceResults(results)
  logger:debug({self, results}, "PlayArea:setDiceResults")
  if results == nil then
    for _, result in pairs(self.results) do
      result:setResult(0)
    end
  else
    for attribute, value in pairs(results) do
      if value >= 0 then
        self.results[attribute]:setResult(value)
      end
    end
  end
end

return PlayArea
