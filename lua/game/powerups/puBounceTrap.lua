local M = {}
local composer = require("composer")
local physics = require("physics")
local assetLoader = require("lua.modules.assetLoader")

local function new(id, player, x, y, displayGroup, playerList)
  local trapSprite
  local trapClosed = false
  local hitOnce = true
  local hitOneBot = true
  local cantHitOwner = true

  local function canHitOwnerAgain()
    cantHitOwner = false
  end

  local function update()
  end

  local function playSprite()
    trapSprite:setSequence("play")
    trapSprite:play()
    trapClosed = true
  end

  local function playSpriteReset()
    trapSprite:setSequence("reset")
    trapSprite:play()
    trapClosed = false
  end

  local function nextEffect(event)
    if event.phase == "ended" and trapClosed then
      playSpriteReset()
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

  local function onCollision(self, collisionEvent)
    if collisionEvent.phase == "began" then
      local playAnimation = true
      if collisionEvent.other.id == id and cantHitOwner then
        playAnimation = false
      elseif collisionEvent.other.mobileUser then
        if hitOnce then
          hitOnce = false
          collisionEvent.other.onCollisionPowerUp(id, 8)
        end
      elseif composer.data.gameInfo.gameType == 0 and collisionEvent.other.onCollisionPowerUp and hitOneBot then
        hitOneBot = false
        collisionEvent.other.onCollisionPowerUp(id, 8)
      end
      if collisionEvent.other.player and playAnimation then
        playSprite()
      end
    end
  end

  local function createTrap()
    playerList[id].removeBounceTrapAnimation()
    -- Determine bounce trap skin from player's customPowerUpSkins
    local skinId = 2001
    if playerList[id] and playerList[id].customPowerUpSkins then
      for i = 1, #playerList[id].customPowerUpSkins do
        local itemId = tonumber(playerList[id].customPowerUpSkins[i])
        if itemId and composer.storeConfig.getItemCategory(itemId) == "punchbox" then
          if composer.storeConfig.canDrawItem(itemId) then
            skinId = itemId
          end
        end
      end
    end
    trapSprite = display.newSprite(composer.powerUpImageSheet, assetLoader.getBounceTrapAnimation(skinId))
    local newShape = {
      30,
      -10,
      30,
      10,
      10,
      10,
      10,
      -10
    }
    local sensorShape = {
      15.5,
      -10,
      15.5,
      10,
      6.5,
      10,
      6.5,
      -10
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
    trapSprite.collision = onCollision
    trapSprite:addEventListener("collision", trapSprite)
    trapSprite.xScale = 0.5
    trapSprite.yScale = 0.5
    trapSprite.update = update
    trapSprite.removeObject = removeObject
    trapSprite:addEventListener("sprite", nextEffect)
    if player then
      trapSprite.x = player.x - 15
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
