local M = {}
local composer = require("composer")

function M.play(soundNameString, options)
  if composer.database.getSound() == 1 then
    local channel
    if options then
      channel = audio.play(composer.data.sounds[soundNameString], options)
    else
      channel = audio.play(composer.data.sounds[soundNameString])
    end
    composer.debugger.debugPrint("audio", "Playing sound " .. soundNameString)
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
