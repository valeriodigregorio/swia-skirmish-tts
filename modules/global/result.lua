-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local GLOBAL_UI = require("swia-skirmish-tts/modules/global/global_ui")

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("result", "Blue"):setState(false)

-- -----------------------------------------------------------------------------
-- Result
-- -----------------------------------------------------------------------------

local Result = {}
Result.__index = Result

function Result:create(player, type)
  local obj = {}
  setmetatable(obj, Result)

  obj.id = GLOBAL_UI.getResultButtonId(player, type)
  if obj.id == nil then
    logger:error({"ERROR: Invalid result ID.", player, type}, "Result:create")
    return nil
  end

  obj.player = player
  obj.type = type
  obj:setResult(0)

  logger:debug({obj, player, type}, "Result:create")
  return obj
end

function Result:setResult(value)
  logger:debug({self, value}, "Result:setResult")
  if self.type == nil then
    UI.setAttribute(self.id, "text", nil)
    UI.setAttribute(self.id, "icon", nil)
    UI.setAttribute(self.id, "color", "#00000000")
    UI.setAttribute(self.id, "active", "false")
  else
    UI.setAttribute(self.id, "active", "true")
    UI.setAttribute(self.id, "outline", "black")
    UI.setAttribute(self.id, "color", "black")
    UI.setAttribute(self.id, "icon", string.lower(self.type))
    UI.setAttribute(self.id, "iconAlignment", "Right")
    UI.setAttribute(self.id, "iconWidth", 12)
    UI.setAttribute(self.id, "text", tostring(value or 0))
    UI.setAttribute(self.id, "fontStyle", "Bold")
    UI.setAttribute(self.id, "resizeTextForBestFit", "true")
    UI.setAttribute(self.id, "textAlignment", "MiddleRight")
    UI.setAttribute(self.id, "textOutline", "black")
    UI.setAttribute(self.id, "textColor", "white")
  end
end

return Result
