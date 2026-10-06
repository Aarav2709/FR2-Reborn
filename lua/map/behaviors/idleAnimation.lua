-- idle animation for animated tiles such as powerup boxes
local util = require("lua.map.behaviors.behaviorUtil")

local M = {}

function M.addBehavior(block)
  local image = block.image
  if not image or not image.setSequence then
    return
  end
  local playing = false
  local interval = image.idleAnimationInterval

  local function play()
    if image and image.setSequence then
      image:setSequence("idleAnimation")
      image:play()
      playing = true
    end
  end

  local function stop()
    if image and image.pause then
      image:pause()
      playing = false
    end
  end

  local function update()
    if not image or not image.x then
      return
    end
    if util.isOnScreen(image.x, image.y) then
      if not playing or interval then
        play()
      end
    elseif playing then
      stop()
    end
  end

  local animateTimer = timer.performWithDelay(interval or 1000, update, 0)
  play()

  local function clean()
    if animateTimer then
      timer.cancel(animateTimer)
      animateTimer = nil
    end
    image = nil
  end

  block.behaviors.idleAnimation = { play = play, stop = stop, clean = clean }
end

return M
