-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = {}
Logger.__index = Logger

function Logger:create(tag, color)
  local obj = {}
  setmetatable(obj, Logger)
  obj.tag = tag
  obj.color = color
  obj.enabled = false
  return obj
end

function Logger:setState(enabled)
  self.enabled = enabled
  logStyle(self.tag.."_ERROR", "Red", "---", "---")
  if self.enabled then
    logStyle(self.tag, self.color, "---", "---")
  end
  return self
end

function Logger:error(element, label)
  log(element, self.tag..":"..label, self.tag.."_ERROR")
  return self
end

function Logger:debug(element, label)
  if self.enabled then
    log(element, self.tag..":"..label, self.tag)
  end
  return self
end

return Logger
