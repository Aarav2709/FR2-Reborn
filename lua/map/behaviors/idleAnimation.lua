local M = {}
local composer = require("composer")

local function addBehavior(block)
  local playing = true
  local animateTimer
  local animationInterval = block.image.idleAnimationInterval
  
  local function stop()
    if block and block.image then
      block.image:pause()
      playing = false
    end
  end
  
  local function play()
    if block and block.image then
      block.image:setSequence("idleAnimation")
      block.image:play()
      playing = true
    end
  end
  
  local function shouldPlay()
    if composer.isOnScreen(block.image.x, block.image.y) then
      if not playing or animationInterval then
        play()
      end
    elseif playing then
      stop()
    end
  end
  
  local function clean()
    if animateTimer then
      timer.cancel(animateTimer)
      animateTimer = nil
    end
  end
  
  local checkForAnimation = 1000
  if animationInterval then
    checkForAnimation = animationInterval
  end
  animateTimer = timer.performWithDelay(checkForAnimation, shouldPlay, 0)
  play()
  block.behaviors.idleAnimation = {}
  block.behaviors.idleAnimation.play = play
  block.behaviors.idleAnimation.stop = stop
  block.behaviors.idleAnimation.clean = clean
end

M.addBehavior = addBehavior
return M
