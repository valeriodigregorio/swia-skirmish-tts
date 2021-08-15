-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DeploymentCard = require("swia-skirmish-tts/modules/common/deployment_card")
local Name = require("swia-skirmish-tts/modules/global/name")
local Health = require("swia-skirmish-tts/modules/global/health")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("card", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Card
-- -----------------------------------------------------------------------------

local Card = {}
Card.__index = Card

function Card:create(card, player, group)
  logger:debug({card, player, group}, "Card:create")
  local obj = {}
  setmetatable(obj, Card)
  obj.card = card
  obj.player = player
  obj.group = group
  obj.name = nil
  obj:reset()
  return obj
end

function Card:cleanup()
  logger:debug({self}, "Card:cleanup")
  local n = self.card:getNumberOfFigures() or 0
  for i=n+1, Health.MAX_FIGURES do
    local health = Health:create(self.player, self.group, i, self.card)
    health:disable()
  end
end

function Card:reset()
  logger:debug({self}, "Card:reset")
  self.name = Name:create(self.player, self.group, self.card)
  self.health = {}
  local n = self.card:getNumberOfFigures() or 0
  if n > 0 then
    for i=1, n do
      self.health[i] = Health:create(self.player, self.group, i, self.card)
    end
  end
  self:cleanup()
end

function Card:setGroup(group)
  logger:debug({self, group}, "Card:setGroup")
  self.group = group
  self.name:setGroup(group)
  for i, health in pairs(self.health) do
    health:setGroup(group)
  end
  self:cleanup()
end

function Card:deploy()
  logger:debug({self}, "Card:deploy")
  self.name:deploy()
  for i, health in pairs(self.health) do
    health:deploy()
  end
  return self
end

function Card:deplete()
  logger:debug({self}, "Card:deplete")
  self.name:deplete()
  for i, health in pairs(self.health) do
    health:deplete()
  end
  return self
end

function Card:ready()
  logger:debug({self}, "Card:ready")
  self.name:ready()
  return self
end

function Card:exhaust()
  logger:debug({self}, "Card:exhaust")
  self.name:exhaust()
  return self
end

function Card:deployCardGui()
  logger:debug({self}, "Card:deployCardGui")
  self.card:setFaceUp(true)
  return self
end

function Card:depleteCardGui()
  logger:debug({self}, "Card:depleteCardGui")
  self.card:setFaceUp(false)
  return self
end

function Card:readyCardGui()
  logger:debug({self}, "Card:readyCardGui")
  self.card:setExhausted(self.player, false)
  return self
end

function Card:exhaustCardGui()
  logger:debug({self}, "Card:exhaustCardGui")
  self.card:setExhausted(self.player, true)
  return self
end

function Card:getMaxHealthPoints()
  logger:debug({self}, "Card:getMaxHealthPoints")
  return self.card:getHealthPoints()
end

function Card:getTotalHealthPoints()
  logger:debug({self}, "Card:getTotalHealthPoints")
  local hp = 0
  for i, health in pairs(self.health) do
    hp = hp + health:getHealthPoints()
  end
  return hp
end

function Card:getHealthPoints(figure)
  logger:debug({self, figure}, "Card:getHealthPoints")
  return self.health[figure]:getHealthPoints()
end

function Card:setHealthPoints(figure, hp)
  logger:debug({self, figure, hp}, "Card:setHealthPoints")
  self.health[figure]:setHealthPoints(hp)
end

function Card:changeColor(figure)
  logger:debug({self, figure}, "Card:changeColor")
  local health = self.health[figure]
  if health ~= nil then
    health:changeColor()
  end
  return self
end

function Card:setColor(figure, color)
  logger:debug({self, figure, color}, "Card:setColor")
  self.health[figure]:setColor(color)
  return self
end

function Card:disable()
  logger:debug({self}, "Card:disable")
  self.name:disable()
  for i, health in pairs(self.health) do
    health:disable()
  end
end

function Card:compare(card)
  logger:debug({self, card}, "Card:compare")
  local hp1 = self:getMaxHealthPoints() or -1
  if hp1 >= 0 then
    hp1 = 0
  end
  local hp2 = card:getMaxHealthPoints() or -1
  if hp2 >= 0 then
    hp2 = 0
  end
  if hp1 == hp2 then
    return self.card:getId() < card.card:getId()
  end
  return hp1 > hp2
end

return Card
