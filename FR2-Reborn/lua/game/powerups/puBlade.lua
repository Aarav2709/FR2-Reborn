local M = {}
local composer = require("composer")
local physics = require("physics")
local bladeImagePath = composer.powerUpImageSheetInfo:getFrameIndex("sawblade")
local bladeBloodImagePath = composer.powerUpImageSheetInfo:getFrameIndex("sawbladeBloody")

local function new(id, player, x, y, displayGroup, playerList)
  local blade = display.newGroup()
  local cleaning = false
  local bladeImage, bladeBloodImage
  local speed = 610
  local maxSpeedBoost = 1000
  local newShape = {
    7,
    17,
    -7,
    17,
    -17,
    7,
    -17,
    -7,
    -7,
    -17,
    7,
    -17,
    17,
    -7,
    17,
    7
  }
  local cantHitOwner = true
  
  local function canHitOwnerAgain()
    cantHitOwner = false
  end
  
  local function rotateBlades()
    if blade and not cleaning then
      local vx, vy = blade:getLinearVelocity()
      bladeImage:rotate(vx * 0.05)
      bladeBloodImage:rotate(vx * 0.05)
    end
  end
  
  local function update()
    if blade and not cleaning then
      local vx, vy = blade:getLinearVelocity()
      if vx < 0 and vx > -speed then
        vx = vx - 40
      elseif 0 < vx and vx < speed then
        vx = vx + 40
      end
      blade:setLinearVelocity(vx, vy)
    end
  end
  
  local function removeObject()
    cleaning = true
    if blade then
      Runtime:removeEventListener("enterFrame", rotateBlades)
      blade:removeEventListener("collision", blade)
      blade:removeSelf()
      blade = nil
    end
  end
  
  local function changeImage()
    bladeBloodImage.alpha = 1
    bladeImage.alpha = 0
  end
  
  blade.changeImage = changeImage
  
  local function cannonFunction(cannonObject)
    if blade and not cleaning then
      blade.x = cannonObject.x
      blade.y = cannonObject.y
      blade:setLinearVelocity(2000, -1700)
    end
  end
  
  blade.cannonFunction = cannonFunction
  
  local function onCollision(self, collisionEvent)
    if collisionEvent.phase == "began" then
      if collisionEvent.other.bounce then
        local vx, vy = blade:getLinearVelocity()
        if math.abs(vy) > 100 then
          vx = vx * 0.7
        end
        local newVy = -math.abs(vy * 1.3)
        if newVy < -700 then
          newVy = -700
        end
        if -500 < newVy then
          newVy = -500
        end
        blade:setLinearVelocity(vx, newVy)
      elseif collisionEvent.other.cannon then
        if collisionEvent.otherElement == 1 then
          collisionEvent.other.onCollision(blade, cleaning)
        end
      elseif collisionEvent.other.boost then
        local vx, vy = blade:getLinearVelocity()
        local boost = maxSpeedBoost / vx
        if 1.6 < boost then
          boost = 1.6
        elseif boost < 1 then
          boost = 1
        end
        blade:setLinearVelocity(vx * boost, vy)
      elseif collisionEvent.other.id == id and cantHitOwner then
      elseif collisionEvent.other.onCollisionPowerUp then
        local hitType = collisionEvent.other.onCollisionPowerUp(id, 1)
        if hitType == 1 then
          changeImage()
        end
      end
    end
  end
  
  local function createBlade()
    bladeImage = display.newImage(composer.powerUpImageSheet, bladeImagePath)
    bladeImage.xScale = 0.5
    bladeImage.yScale = 0.5
    bladeBloodImage = display.newImage(composer.powerUpImageSheet, bladeBloodImagePath)
    bladeBloodImage.xScale = 0.5
    bladeBloodImage.yScale = 0.5
    bladeBloodImage.alpha = 0
    blade:insert(bladeImage)
    blade:insert(bladeBloodImage)
    physics.addBody(blade, {
      density = 0.6,
      friction = 0.1,
      bounce = 0.5,
      shape = newShape,
      filter = powerUpFilter
    }, {
      isSensor = true,
      radius = 18,
      filter = sensorFilter
    })
    blade.collision = onCollision
    blade:addEventListener("collision", blade)
    blade.isFixedRotation = true
    blade.update = update
    blade.removeObject = removeObject
    blade.id = "blade"
    if id then
      blade.id = blade.id .. id
    end
    displayGroup:insert(blade)
    Runtime:addEventListener("enterFrame", rotateBlades)
  end
  
  local function shootBlade()
    playerList[id].removeBladeAnimation()
    blade:setLinearVelocity(speed * 1, 5, 0)
    blade:applyForce(50, 0, 0, -20)
    blade:applyForce(-50, 0, 0, 20)
    if player then
      blade.x = player.x
      blade.y = player.y - 2
    else
      blade.x = x
      blade.y = y
    end
  end
  
  createBlade()
  shootBlade()
  timer.performWithDelay(500, canHitOwnerAgain, 1)
  timer.performWithDelay(6000, removeObject, 1)
  return blade
end

M.new = new
return M
