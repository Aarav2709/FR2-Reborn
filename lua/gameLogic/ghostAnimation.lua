-- the blue skull ghost that rises from a runner when they die, as in fun run 2
local composer = require("composer")
local physics = require("physics")
local M = {}

local SCALE = 0.47
local RISE = -0.5
local MAX_SPEED_X = 150
local MIN_RISE_SPEED = -60
local LIFETIME = 7500

function M.create(parentGroup)
  local ghost = {}
  local sprite = display.newSprite(parentGroup, composer.ghostImageSheet, composer.data.animations.ghost)
  sprite.xScale, sprite.yScale = SCALE, SCALE
  sprite.alpha = 0
  physics.addBody(sprite, "dynamic", { density = 1, friction = 0, bounce = 0, isSensor = true, radius = 10 })
  sprite.gravityScale = RISE
  sprite.isFixedRotation = true
  sprite.isBodyActive = false
  local showTimer, hideTimer
  local flying = false

  local function faceMovement()
    if not flying or not sprite.getLinearVelocity then
      return
    end
    local vx, vy = sprite:getLinearVelocity()
    if vx ~= 0 or vy ~= 0 then
      sprite.rotation = 90 + math.deg(math.atan2(vy, vx))
    end
  end

  local function cancelTimers()
    if showTimer then
      timer.cancel(showTimer)
      showTimer = nil
    end
    if hideTimer then
      timer.cancel(hideTimer)
      hideTimer = nil
    end
  end

  function ghost.hide()
    hideTimer = nil
    flying = false
    Runtime:removeEventListener("enterFrame", faceMovement)
    if sprite.removeSelf then
      sprite.alpha = 0
      sprite:pause()
      sprite.isBodyActive = false
    end
  end

  function ghost.show(body, vx, vy, delay)
    cancelTimers()
    showTimer = timer.performWithDelay(math.max(10, delay or 0), function()
      showTimer = nil
      if not sprite.removeSelf or not body or not body.x then
        return
      end
      sprite.isBodyActive = true
      sprite.x, sprite.y = body.x, body.y - 10
      local speedX = math.max(-MAX_SPEED_X, math.min(MAX_SPEED_X, (vx or 0) * 0.3))
      local speedY = math.min(MIN_RISE_SPEED, (vy or 0) * 0.3)
      sprite:setLinearVelocity(speedX, speedY)
      sprite.alpha = 1
      sprite:toFront()
      sprite:setSequence("normal")
      sprite:play()
      flying = true
      faceMovement()
      Runtime:addEventListener("enterFrame", faceMovement)
      hideTimer = timer.performWithDelay(LIFETIME, ghost.hide)
    end)
  end

  function ghost.clean()
    cancelTimers()
    flying = false
    Runtime:removeEventListener("enterFrame", faceMovement)
  end

  return ghost
end

return M
