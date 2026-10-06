local M = {}
local composer = require("composer")

function M.play(soundNameString, options)
  if composer.database.getSound() == 1 then
    local handle = composer.data.sounds and composer.data.sounds[soundNameString]
    if not handle then
      return nil
    end
    local channel
    if options then
      channel = audio.play(handle, options)
    else
      channel = audio.play(handle)
    end
    return channel
  end
end

function M.stop(channel)
  if composer.database.getSound() == 1 then
    audio.stop(channel)
  end
end

function M.playWheelSpin()
  local channel = 29
  if not audio.isChannelPlaying(channel) then
    M.play("spin_wheel", {channel = channel})
  end
end

composer.audio = M
