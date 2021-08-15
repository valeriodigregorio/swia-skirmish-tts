-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local GLOBAL_UI = require("swia-skirmish-tts/modules/global/global_ui")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("health", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Health
-- -----------------------------------------------------------------------------

local Health = {}
Health.__index = Health
Health.MAX_FIGURES = 3

function Health:create(player, group, figure, card)
  logger:debug({player, group, figure, card}, "Health:create")
  local obj = {}
  setmetatable(obj, Health)
  obj.card = card
  obj.player = player
  obj.group = group
  obj.figure = figure
  obj.id = GLOBAL_UI.getGroupButtonId(player, group, figure)
  if obj.card:isFaceUp() then
    obj:deploy()
  else
    obj:deplete()
  end
  return obj
end

function Health:getColor()
  logger:debug({self}, "Health:getColor")
  local info = self.card:getInfo(self.figure)
  return info.color or DEFS.getPlayerColor(self.player)
end

function Health:setColor(color)
  logger:debug({self, color}, "Health:setColor")
  local n = self:getHealthPoints()
  self.card:setInfo(self.figure, n, color)
  self:update()
end

function Health:changeColor()
  local color = self:getColor()
  logger:debug({self, color}, "Health:changeColor")
  color = DEFS.cycleColor(color)
  self:setColor(color)
end

function Health:getMaxHealthPoints()
  local n = self.card:getHealthPoints()
  logger:debug({self, n}, "Health:getMaxHealthPoints")
  return n
end

function Health:getHealthPoints()
  logger:debug({self}, "Health:getHealthPoints")
  local info = self.card:getInfo(self.figure)
  return info.points or self:getMaxHealthPoints()
end

function Health:setHealthPoints(n)
  logger:debug({self, n}, "Health:setHealthPoints")
  local text = ""
  local color = self:getColor()
  local enabled = true
  if n == nil then
    if not self.card:isFaceUp() then
      color = DEFS.DisabledColor
    end
    enabled = false
  elseif n <= 0 then
    n = 0
    text = "☠"
    color = DEFS.DisabledColor
  else
    local max = self:getMaxHealthPoints()
    if n > max then
      n = max
    end
    text = tostring(n)
  end
  if enabled then
    self.card:setInfo(self.figure, n, self:getColor())
  else
    self.card:setInfo(self.figure, nil, nil)
  end
  self:setUI(text, color, enabled)
end

function Health:setGroup(group)
  logger:debug({self, group}, "Health:setGroup")
  self.group = group
  self.id = GLOBAL_UI.getGroupButtonId(self.player, self.group, self.figure)
  self:update()
end

function Health:deploy()
  logger:debug({self}, "Health:deploy")
  self:update()
end

function Health:deplete()
  logger:debug({self}, "Health:deplete")
  local hp = self:getMaxHealthPoints()
  if hp ~= nil then
    hp = 0
  end
  self:setHealthPoints(hp)
end

function Health:update()
  self:setHealthPoints(self:getHealthPoints())
end

function Health:setUI(text, color, enabled)
  logger:debug({self, text, color, enabled}, "Health:setUI")
  if enabled then
    UI.setAttribute(self.id, "interactable", "true")
    UI.setAttribute(self.id, "active", "true")
  else
    UI.setAttribute(self.id, "interactable", "false")
    UI.setAttribute(self.id, "active", "false")
  end
  UI.setAttribute(self.id, "text", text)
  UI.setAttribute(self.id, "color", color)
  UI.setAttribute(self.id, "outline", "black")
  UI.setAttribute(self.id, "fontStyle", "Bold")
  UI.setAttribute(self.id, "resizeTextForBestFit", "true")
  UI.setAttribute(self.id, "textOutline", "black")
  UI.setAttribute(self.id, "textColor", "white")
end

function Health:disable()
  logger:debug({self}, "Health:disable")
  self:setUI("", "#00000000", false)
end

return Health