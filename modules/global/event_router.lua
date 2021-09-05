-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("name", "Blue"):setState(false)


-- -----------------------------------------------------------------------------
-- Event Router
-- -----------------------------------------------------------------------------

local EventRouter = {}
EventRouter.__index = EventRouter

function EventRouter:create(name)
  logger:debug({}, "EventRouter:create")
  local obj = {}
  obj.name = name
  setmetatable(obj, EventRouter)
  return obj
end

function EventRouter:onCardEnterPlayArea(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardEnterPlayArea")
  card = area:addCard(card)
  if card ~= nil then
    if card:isExhausted() then
      self:onCardExhaust(card, area)
    else
      self:onCardReady(card, area)
    end
    if card:isFaceUp() then
      self:onCardDeploy(card, area)
    else
      self:onCardDeplete(card, area)
    end
  end
end

function EventRouter:onCardLeavePlayArea(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardLeavePlayArea")
  area:removeCard(card)
end

function EventRouter:onCardDeploy(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardDeploy")
  local c = area:getCard(card.object.getGUID())
  if c ~= nil then
    c:deploy()
  end
end

function EventRouter:onCardDeplete(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardDeplete")
  local c = area:getCard(card.object.getGUID())
  if c ~= nil then
    c:deplete()
  end
end

function EventRouter:onCardReady(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardReady")
  local c = area:getCard(card.object.getGUID())
  if c ~= nil then
    c:ready()
  end
end

function EventRouter:onCardExhaust(card, area)
  logger:debug({self, card, area}, "EventRouter:onCardExhaust")
  local c = area:getCard(card.object.getGUID())
  if c ~= nil then
    c:exhaust()
  end
end

function EventRouter:onButtonReady(area, group)
  logger:debug({self, area, group}, "EventRouter:onButtonReady")
  local gui = area:readyCardGui(group)
  self:onCardReady(gui.card, area)
end

function EventRouter:onButtonExhaust(area, group)
  logger:debug({self, area, group}, "EventRouter:onButtonExhaust")
  local gui = area:exhaustCardGui(group)
  self:onCardExhaust(gui.card, area)
end

function EventRouter:onButtonRecover(area, group, figure)
  logger:debug({self, area, group, figure}, "EventRouter:onButtonRecover")
  local hp = area:getHealthPoints(group, figure)
  if hp ~= nil and hp < area:getMaxHealthPoints(group) then
    hp = hp + 1
    area:setHealthPoints(group, figure, hp)
    if hp == 1 then
      local gui = area:deployCardGui(group)
      self:onCardDeploy(gui.card, area)
    end
  end
end

function EventRouter:onButtonDamage(area, group, figure)
  logger:debug({self, area, group, figure}, "EventRouter:onButtonDamage")
  local hp = area:getHealthPoints(group, figure)
  if hp ~= nil and hp > 0 then
    hp = hp - 1
    area:setHealthPoints(group, figure, hp)
    if hp == 0 and area:getTotalHealthPoints(group) == 0 then
      local gui = area:depleteCardGui(group)
      self:onCardDeplete(gui.card, area)
    end
  end
end

function EventRouter:onButtonColorChange(area, group, figure)
  logger:debug({self, area, group, figure}, "EventRouter:onButtonColorChange")
  area:changeColor(group, figure)
end

function EventRouter:onDiceResultsUpdate(area, results)
  logger:debug({self, area, results}, "EventRouter:onDiceResultsUpdate")
  area:setDiceResults(results)
end

function EventRouter:onColorTintChange(area, object, figure, color)
  logger:debug({self, area, object, figure, color}, "EventRouter:onColorTintChange")
  area:setColor(object, figure, color)
end

return EventRouter
