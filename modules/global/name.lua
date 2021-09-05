-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local DEFS = require("swia-skirmish-tts/modules/common/definitions")
local GLOBAL_UI = require("swia-skirmish-tts/modules/global/global_ui")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("name", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Name
-- -----------------------------------------------------------------------------

local Name = {}
Name.__index = Name

function Name:create(player, group, card)
  logger:debug({player, group, card}, "Name:create")
  local obj = {}
  setmetatable(obj, Name)
  obj.card = card
  obj.player = player
  obj:setGroup(group)
  return obj
end

function Name:setGroup(group)
  logger:debug({self, group}, "Name:setGroup")
  self.group = group
  self.id = GLOBAL_UI.getGroupButtonId(self.player, self.group)
  self:update()
end

function Name:update()
  logger:debug({self}, "Name:update")
  if self.card:isExhausted() then
    self:exhaust()
  else
    self:ready()
  end
  if self.card:isFaceUp() then
    self:deploy()
  else
    self:deplete()
  end
end

function Name:getName()
  local text = UI.getAttribute(self.id, "text") or ""
  logger:debug({self, text}, "Name:getName")
  return text
end

function Name:setUI(text, color, enabled)
  logger:debug({self, text, color, enabled}, "Name:setUI")
  if enabled then
    UI.setAttribute(self.id, "interactable", "true")
  else
    UI.setAttribute(self.id, "interactable", "false")
  end
  UI.setAttribute(self.id, "text", text)
  UI.setAttribute(self.id, "color", color)
  UI.setAttribute(self.id, "outline", "black")
  UI.setAttribute(self.id, "fontStyle", "Bold")
  UI.setAttribute(self.id, "resizeTextForBestFit", "true")
  UI.setAttribute(self.id, "textOutline", "black")
  UI.setAttribute(self.id, "textColor", "white")
end

function Name:toggleButton(state)
  if state then
    state = "True"
  else
    state = "False"
  end
  UI.setAttribute(self.id, "isOn", state)
  UI.setAttribute(self.id, "textColor", "white")
end

function Name:exhaust()
  logger:debug({self.id}, "Name:exhaust")
  self:toggleButton(true)
end

function Name:ready()
  logger:debug({self.id}, "Name:ready")
  self:toggleButton(false)
end

function Name:deploy()
  logger:debug({self.id}, "Name:deploy")
  local text = self.card:getName()
  local color = DEFS.getPlayerColor(self.player)
  self:setUI(text, color, true)
end

function Name:deplete()
  logger:debug({self.id}, "Name:deplete")
  local text = self.card:getName()
  self:setUI(text, DEFS.DisabledColor, false)
end

function Name:disable()
  logger:debug({self.id}, "Name:disable")
  self:setUI("", "#00000000", false)
end

return Name
