-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("name", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Event History
-- -----------------------------------------------------------------------------

local EventHistory = {}
EventHistory.__index = EventHistory

EventHistory.ENTER = "ENTER"
EventHistory.LEAVE = "LEAVE"
EventHistory.PICKUP = "PICKUP"
EventHistory.DROP = "DROP"

function EventHistory:create(router)
  logger:debug({}, "EventHistory:create")
  local obj = {}
  setmetatable(obj, EventHistory)
  obj.router = router
  obj:reset()
  return obj
end

function EventHistory:reset()
  logger:debug({self}, "EventHistory:reset")
  self.area = nil
  self.first = nil
  self.second = nil
  self.faceUp = {nil, nil}
  self.exhausted = nil
end

function EventHistory:log(eventType, card, area)
  logger:debug({self, eventType, card, area}, "EventHistory:log")
  self.area = area or self.area
  if eventType == EventHistory.LEAVE then
    self.faceUp[1] = self.faceUp[2]
    self.faceUp[2] = card:isFaceUp()
    self.exhausted = card:isExhausted()
  end
  if self.first == nil then
    self.first = eventType
  elseif self.second == nil then
    self.second = eventType
  else
    self.first = self.second
    self.second = eventType
  end
  self:update(card)
end

function EventHistory:isCardAdded()
  return ((self.first == EventHistory.ENTER or self.first == EventHistory.DROP)
     and (self.second == EventHistory.ENTER or self.second == EventHistory.DROP))
      or (self.first == EventHistory.PICKUP and self.second == EventHistory.ENTER)
end

function EventHistory:isCardRemoved()
  return (self.first == EventHistory.LEAVE or self.first == EventHistory.PICKUP)
     and (self.second == EventHistory.LEAVE or self.second == EventHistory.PICKUP)
end

function EventHistory:isCardRotated()
  return self.first == EventHistory.LEAVE and self.second == EventHistory.ENTER
end

function EventHistory:update(card)
  logger:debug({self, card}, "EventHistory:update")
  if self:isCardAdded() and self.area ~= nil then
    self.router:onCardEnterPlayArea(card, self.area)
  elseif self:isCardRemoved() and self.area ~= nil then
    self.router:onCardLeavePlayArea(card, self.area)
  elseif self:isCardRotated() then
    local exhausted = card:isExhausted()
    logger:debug({self.faceUp}, "EventHistory:update")
    if self.faceUp[1] ~= nil and self.faceUp[2] ~= nil and
       self.faceUp[1] ~= self.faceUp[2] and self.area ~= nil then
      if self.faceUp[2] then
        self.router:onCardDeploy(card, self.area)
      else
        self.router:onCardDeplete(card, self.area)
      end
    elseif self.exhausted ~= exhausted and self.area ~= nil then
      if exhausted then
        self.router:onCardExhaust(card, self.area)
      else
        self.router:onCardReady(card, self.area)
      end
    else
      return
    end
  else
    return
  end
  self:reset()
end

return EventHistory
