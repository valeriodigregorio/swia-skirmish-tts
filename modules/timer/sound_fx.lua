-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Logger = require("swia-skirmish-tts/modules/common/logger")
local logger = Logger:create("sound_fx", "Pink"):setState(false)

-- -----------------------------------------------------------------------------
--  SoundFx
-- -----------------------------------------------------------------------------

local SoundFx = {}
SoundFx.__index = SoundFx

function SoundFx:create(uuid, clock_obj, countdown, stopDelay)
  logger:debug({uuid, clock_obj, countdown, stopDelay}, "SoundFx:create")
  local obj = {}
  setmetatable(obj, SoundFx)
  obj.soundFx = getObjectFromGUID(uuid)
  obj.clock = clock_obj
  obj.countdown = countdown
  obj.stopDelay = stopDelay
  obj.lastValue = nil
  obj.end_time = nil
  return obj
end

function SoundFx:start()
  logger:debug({self.soundFx}, "SoundFx:start")
  self.soundFx.AssetBundle.playTriggerEffect(0)
end

function SoundFx:stop()
  logger:debug({self.soundFx}, "SoundFx:stop")
  self.soundFx.AssetBundle.playLoopingEffect(6)
end

function SoundFx:stopDelayed()
  logger:debug({self.soundFx}, "SoundFx:stopDelayed")
  self.soundFx.AssetBundle.playLoopingEffect(0)
end

function SoundFx:tick()
  if self.end_time ~= nil and os.difftime(os.time(), self.end_time) > self.stopDelay then
    self.end_time = nil
    self.lastValue = nil
    self:stopDelayed()
  end
  logger:debug({self}, "SoundFx:tick")
  local value = self.clock.getValue()
  if self.lastValue == nil then
    self.lastValue = value
  elseif value ~= self.lastValue then
    if value > self.lastValue then
      broadcastToAll("Game started!")
      self:start()
    end
    if value == 0 then
      broadcastToAll("Time is up!")
      self.end_time = os.time()
      self:stop()
    elseif value <= self.countdown then
      broadcastToAll(value)
      debug({value}, "SoundFx:tick")
    end
    self.lastValue = value
  end
end

return SoundFx
