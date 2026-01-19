local M = {}
local physics = require("physics")
local composer = require("composer")

local function new(id, playerList, displayGroup)
  local rocket = {1}
  rocket.x = 1
  rocket.y = 1
  local player = playerList[id]
  local killTimer
  local startedClean = false
  local hitDistance = 250
  local beam
  local stuckCounter = 0
  local prevY = 0
  local prevX = 0
  local isStuckNow = false
  
  local function isStuck()
    if isStuckNow then
      stuckCounter = stuckCounter - 1
      if stuckCounter < -30 then
        isStuckNow = false
        stuckCounter = 0
      end
      return true
    end
    local posDiffX = player.x - prevX
    local posDiffY = player.y - prevY
    local distance = math.sqrt(posDiffX * posDiffX + posDiffY * posDiffY)
    if distance < 20 then
      stuckCounter = stuckCounter + 1
    else
      prevX = player.x
      prevY = player.y
      stuckCounter = 0
    end
    if 10 < stuckCounter then
      isStuckNow = true
      print("rocket stuck")
      return true
    end
    return false
  end
  
  local function rocketAcceleration()
    if player and player.getPlayerGoalTime() < 1 and not isStuck() then
      local ySpeed = 10
      local xSpeed = 3
      local hitsDown = physics.rayCast(player.x + 12, player.y + 20, player.x + 90, player.y + 100, "closest")
      local hitsUp = physics.rayCast(player.x + 10, player.y - 20, player.x + 10, player.y - 50, "closest")
      local vx, vy = player:getLinearVelocity()
      if hitsUp then
        local posDiffX = player.x - hitsUp[1].position.x
        local posDiffY = player.y - hitsUp[1].position.y
        local distance = math.sqrt(posDiffX * posDiffX + posDiffY * posDiffY)
        if distance < 50 then
          if vy < 0 then
            ySpeed = 50
          end
        elseif distance < 100 then
          ySpeed = 0
        end
        player.booleanStates.rocketActiveHigh = false
      elseif hitsDown then
        local posDiffX = player.x - hitsDown[1].position.x
        local posDiffY = player.y - hitsDown[1].position.y
        local distance = math.sqrt(posDiffX * posDiffX + posDiffY * posDiffY)
        if distance < 50 then
          if 0 < vy then
            player.setLinearVelocityOnPlayer(vx, 0)
            if distance < 20 then
              ySpeed = -70
            else
              ySpeed = -50
            end
          else
            ySpeed = -20
          end
        elseif distance < 100 then
          ySpeed = -10
        else
          ySpeed = -5
        end
        player.booleanStates.rocketActiveHigh = false
      else
        if vy < 0 then
          ySpeed = 20
        else
          ySpeed = 0
        end
        player.booleanStates.rocketActiveHigh = true
      end
      player.applyForceOnPlayer(xSpeed, ySpeed)
    end
  end
  
  local function removeObject()
    if startedClean or player == nil then
      return
    end
    startedClean = true
    Runtime:removeEventListener("enterFrame", rocketAcceleration)
    player.booleanStates.rocketActive = false
    player.booleanStates.rocketActiveHigh = false
    if player.rocketBlinkTimer then
      timer.cancel(player.rocketBlinkTimer)
      player.rocketBlinkTimer = nil
    end
    if killTimer then
      timer.cancel(killTimer)
      killTimer = nil
    end
    if beam then
      beam:removeSelf()
      beam = nil
    end
  end
  
  local function isPlayerClose(otherPlayer)
    local posDiffX = player.x - otherPlayer.x
    local posDiffY = player.y - otherPlayer.y
    local distance = math.sqrt(posDiffX * posDiffX + posDiffY * posDiffY)
    if distance < hitDistance then
      return true
    end
    return false
  end
  
  local function checkForOtherPlayerKill()
    if startedClean then
      return
    end
    for i = 1, #playerList do
      if playerList[i].id ~= id and isPlayerClose(playerList[i]) and (playerList[i].mainPlayer or composer.data.gameInfo.gameType == 0) then
        playerList[i].onCollisionPowerUp(id, 10)
      end
    end
  end
  
  local function killPlayer()
    if startedClean then
      return
    end
    if player.mainPlayer or composer.data.gameInfo.gameType == 0 then
      player.onCollisionPowerUp(id, 10)
    end
    checkForOtherPlayerKill()
    removeObject()
  end
  
  local function init()
    if player then
      player.rocketPowerUp()
      player.booleanStates.rocketActive = true
      player.applyForceOnPlayer(100, -150)
      Runtime:addEventListener("enterFrame", rocketAcceleration)
      player.powerUpLinks.rocket = rocket
    end
  end
  
  init()
  killTimer = timer.performWithDelay(5000, killPlayer, 1)
  rocket.removeObject = removeObject
  rocket.checkForOtherPlayerKill = checkForOtherPlayerKill
  return rocket
end

M.new = new
return M
