-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("clock", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
--  Clock
-- -----------------------------------------------------------------------------

local Clock = {}
Clock.__index = Clock

function Clock:create(uuid)
  logger:debug({uuid}, "Clock:create")
  local obj = {}
  setmetatable(obj, Clock)
  obj.uuid = uuid
  return obj
end

function Clock:start(seconds)
  logger:debug({self.uuid, seconds}, "Clock:start")
  local timer = getObjectFromGUID(self.uuid)
  timer.Clock.setValue(seconds + 1)
  timer.Clock.pauseStart()
end

function Clock:show()
  logger:debug({self.uuid}, "Clock:show")
  local timer = getObjectFromGUID(self.uuid)
  timer.Clock.showCurrentTime()
end

return Clock
