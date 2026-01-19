local M = {}
local composer = require("composer")
local physics = require("physics")

local function new(id, player, x, y, displayGroup, playerList)
  local trapSprite
  local trapClosed = false
  local canHit = true
  local cantHitOwner = true
  local haveHitSomeone = false
  
  local function canHitOwnerAgain()
    cantHitOwner = false
  end
  
  local function update()
  end
  
  local function playSpriteCloseEffect()
    if haveHitSomeone then
      trapSprite:setSequence("closeBlood")
    else
      trapSprite:setSequence("closeNormal")
    end
    trapSprite:play()
    trapClosed = true
    haveHitSomeone = true
  end
  
  local function playSpriteOpenEffect()
    trapSprite:setSequence("openBlood")
    trapSprite:play()
    trapClosed = false
  end
  
  local function nextEffect(event)
    if event.phase == "ended" and trapClosed then
      playSpriteOpenEffect()
    end
  end
  
  local function removeObject()
    if trapSprite then
      trapSprite:removeEventListener("sprite", nextEffect)
      trapSprite:removeEventListener("collision", trapSprite)
      trapSprite:removeSelf()
      trapSprite = nil
    end
  end
  
  local function canHitAgain()
    canHit = true
  end
  
  local function onCollision(self, collisionEvent)
    if collisionEvent.phase == "began" then
      local playAnimation = true
      if collisionEvent.other.id == id and cantHitOwner then
        playAnimation = false
      elseif collisionEvent.other.mobileUser and canHit then
        canHit = false
        collisionEvent.other.onCollisionPowerUp(id, 2)
        timer.performWithDelay(1000, canHitAgain, 1)
      elseif composer.data.gameInfo.gameType == 0 and canHit and collisionEvent.other.onCollisionPowerUp then
        canHit = false
        collisionEvent.other.onCollisionPowerUp(id, 2)
        timer.performWithDelay(1000, canHitAgain, 1)
      end
      if collisionEvent.other.player and playAnimation then
        playSpriteCloseEffect()
      end
    end
  end
  
  local function createTrap()
    playerList[id].removeTrapAnimation()
    trapSprite = display.newSprite(composer.powerUpImageSheet, composer.data.animations.trapSet)
    local newShape = {
      20,
      0,
      20,
      18,
      -20,
      18,
      -20,
      0
    }
    local sensorShape = {
      26,
      0,
      26,
      18,
      15,
      18,
      15,
      0
    }
    physics.addBody(trapSprite, {
      density = 0.6,
      friction = 1,
      bounce = 0.3,
      shape = newShape,
      filter = powerUpFilter
    }, {
      isSensor = true,
      shape = sensorShape,
      filter = obstacleFilter
    })
    trapSprite.xScale = 0.5
    trapSprite.yScale = 0.5
    trapSprite.update = update
    trapSprite.removeObject = removeObject
    trapSprite.collision = onCollision
    trapSprite:addEventListener("collision", trapSprite)
    trapSprite:addEventListener("sprite", nextEffect)
    if player then
      trapSprite.x = player.x
      trapSprite.y = player.y
    else
      trapSprite.x = x
      trapSprite.y = y
    end
    displayGroup:insert(trapSprite)
  end
  
  createTrap()
  timer.performWithDelay(500, canHitOwnerAgain, 1)
  if not composer.onboarding.isActive == true then
    timer.performWithDelay(30000, removeObject, 1)
  end
  return trapSprite
end

M.new = new
return M
