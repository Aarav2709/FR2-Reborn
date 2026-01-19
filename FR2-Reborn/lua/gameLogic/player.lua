local M = {}
local trailHelper = require("lua.modules.trails")
local composer = require("composer")
local botModule = require("lua.gameLogic.botModule")
local basicPlayerCorpses = require("lua.gameLogic.playerCorpses")
local monsterLoader = require("spine-corona.monsterLoader")
local powerUpChance = require("lua.gameLogic.powerUpChance")
local basicPlayerEffects = require("lua.gameLogic.playerEffects")

local function new(playerId, name, accessorize, powerUp, mainPlayer, playerList, startXPos, startYPos)
  local player = display.newGroup()
  local playerGhost = display.newGroup()
  local spriteDisplay = display.newGroup()
  local bodyParts = display.newGroup()
  local screenGroup = display.newGroup()
  local playerHead = display.newGroup()
  local bot, setPlayerAliveTimer, hidePlayerTimer
  local networkGame = false
  if composer.data.gameInfo.gameType > 0 then
    networkGame = true
  end
  local monster = monsterLoader.new(accessorize, networkGame)
  monster.getGroup().xScale = 0.25
  monster.getGroup().yScale = 0.25
  spriteDisplay:insert(monster.getGroup())
  local monsterHead = monster.getHead()
  local powerUpImages = {}
  powerUpImages.bladeImage = display.newImageRect("images/game/powerups/icons/sawblade.png", 25, 25)
  powerUpImages.trapImage = display.newImageRect("images/game/powerups/icons/beartrap.png", 25, 25)
  powerUpImages.bounceTrapImage = display.newImageRect("images/game/powerups/icons/punchbox.png", 25, 25)
  powerUpImages.markPlayerImage = display.newImageRect("images/game/markIcon.png", 37, 34)
  powerUpImages.markBarImage = display.newImageRect("images/game/markIcon.png", 24, 22)
  local speeds = {}
  speeds.defaultTopSpeed = 350
  speeds.defaultAcceleration = 30
  speeds.topSpeedX = 350
  speeds.accelerateX = 25
  speeds.tempSpeedX = 350
  speeds.boostMaks = speeds.topSpeedX * 2.5
  speeds.boostMaksSlide = speeds.topSpeedX * 2
  speeds.slowMaks = speeds.topSpeedX * 0.4
  local gameTimes = {}
  gameTimes.groundTime = 0
  gameTimes.playerDeadtime = 3000
  gameTimes.goalTime = -1
  gameTimes.powerUpAtTimes = 0
  gameTimes.lastJumpTime = 1000
  gameTimes.currentGameTime = -1
  gameTimes.currentUDID = -1
  local powerUpLinks = {}
  local state = 1
  local ninjaMarkIndex = playerId
  local lastNinjaMark
  ninjaMarkIndex = ninjaMarkIndex + 1
  if ninjaMarkIndex > #playerList then
    ninjaMarkIndex = 1
  end
  local previousVelocityMaxSize = 8
  local playerPosition = -1
  local numberOfPlayers = 1
  local changeSpeedState = 0
  local powerUpAt = 0
  local lastTimePowerUp = 0
  local powerUpType = powerUp
  if composer.config.tutorial then
    powerUpType = 0
  end
  local booleanStates = {}
  booleanStates.armorActive = false
  booleanStates.shieldActive = false
  booleanStates.rocketActive = false
  booleanStates.rocketActiveHigh = false
  booleanStates.spriteIsRunning = false
  booleanStates.spriteIsInAir = false
  booleanStates.playerDead = false
  booleanStates.playerInvulnerable = false
  booleanStates.speedActive = false
  booleanStates.disconnected = false
  booleanStates.startedClean = false
  booleanStates.tutorialPause = false
  local playerCorpses = basicPlayerCorpses.newCorpsParts(bodyParts, player)
  local previousVelocity = {}
  local ninjaTimer, ninjaEffectTimer, rocketBlinkTimer, disablePreviousPowerUp, updatePowerUpImageFunction
  local reservedChannels = 5
  local channelList = {}
  for i = 1, reservedChannels do
    channelList[i] = (playerId - 1) * reservedChannels + i
  end
  local channelCounter = 1
  local currentVolume = -1
  local playSoundOnChannel, playSound, playKillMessage
  player.mainPlayer = mainPlayer
  local playerEffects = basicPlayerEffects.createEffects(player, playerCorpses, monster, booleanStates, spriteDisplay, bodyParts, screenGroup)
  local disconnectBar = display.newImageRect("images/game/avatar/disconnected.png", 18, 18)
  local headBarBackground
  if mainPlayer then
    headBarBackground = display.newImageRect("images/game/playerSelfNormal.png", 40, 40)
  else
    headBarBackground = display.newImageRect("images/game/playerOtherNormal.png", 40, 40)
  end
  
  local function radToDegree(rad)
    return rad * 180 / 3.14
  end
  
  local function hidePlayerSprite()
    spriteDisplay.alpha = 0
    monster.cleanAnimationImages()
  end
  
  local function showPlayerSprite()
    if not booleanStates.startedClean then
      monster.setBandage(false)
      booleanStates.playerInvulnerable = false
    end
  end
  
  local function partlyShowPlayerSprite()
    monster.setBandage(true)
    playerEffects.playBloodSquirt()
    spriteDisplay.alpha = 1
    local delay = gameTimes.playerDeadtime - 1000
    if composer.onboarding.reduceRespawnTime() then
      delay = 100
    end
    timer.performWithDelay(delay, showPlayerSprite, 1)
  end
  
  local deathAnimation = composer.data.monsterInMemory[monster.getMemoryIndex()]
  playerCorpses.addSpriteSet(deathAnimation)
  
  local function getLinearVelocityOnPlayer()
    if booleanStates.startedClean then
      return 1, 1
    end
    local vx, vy = player:getLinearVelocity()
    return vx, vy
  end
  
  local function getPlayerPositionInWorld()
    if booleanStates.startedClean then
      return 1, 1
    end
    return player.x, player.y
  end
  
  local function setPlayerPositionInWorld(x, y)
    player.x = x
    player.y = y
  end
  
  local function setLinearVelocityOnPlayer(vx, vy)
    player:setLinearVelocity(vx, vy)
    playerGhost:setLinearVelocity(vx, vy)
  end
  
  local function applyForceOnPlayer(vx, vy)
    player:applyForce(vx, vy, player.x, player.y)
    playerGhost:applyForce(vx, vy, playerGhost.x, playerGhost.y)
  end
  
  local function createItemEffect()
    if networkGame and accessorize.f and accessorize.f > 0 then
      trailHelper.createTrail(accessorize.f, player.x - 5, player.y - 10, bodyParts, 0.5)
    elseif accessorize[6] and 0 < tonumber(accessorize[6]) then
      trailHelper.createTrail(tonumber(accessorize[6]), player.x - 5, player.y - 10, bodyParts, 0.5)
    end
  end
  
  local function stopPowerUpSpeed(showPlayer)
    if not booleanStates.startedClean then
      if showPlayer then
        -- Güvenli animasyon çalma
        pcall(function()
          monster.playBuffAnimation("speed_end", false)
        end)
      else
        monster.setAnimation("run", true, false)
      end
      if powerUpLinks.speed then
        powerUpLinks.speed.removeObject(false, true)
        powerUpLinks.speed = nil
      end
      speeds.topSpeedX = speeds.defaultTopSpeed
      speeds.tempSpeedX = speeds.topSpeedX
      speeds.accelerateX = speeds.defaultAcceleration
      monster.cleanBuffAnimationImages()
    end
  end
  
  local function hidePowerUpArmor()
    playSound("armor_end")
    -- Güvenli animasyon çalma
    pcall(function()
      monster.playBuffAnimation("sacrifice_end", false)
    end)
    if powerUpLinks.armor then
      powerUpLinks.armor.removeObject()
      powerUpLinks.armor = nil
    end
  end
  
  local function playPowerUpArmor()
    -- Güvenli animasyon çalma - hata yakalama
    local success = pcall(function()
      monster.playBuffAnimation("sacrifice_start", true)
    end)
    if not success then
      print("WARNING: Failed to play sacrifice_start animation, using fallback")
      -- Fallback olarak normal run animasyonu kullan
      pcall(function()
        monster.setAnimation("run", true, false)
      end)
    end
  end
  
  local function hideRocketEffect(checkForKill)
    monster.setAnimation("run", true, false)
    if powerUpLinks.rocket then
      if checkForKill then
        powerUpLinks.rocket.checkForOtherPlayerKill()
      end
      powerUpLinks.rocket.removeObject()
      powerUpLinks.rocket = nil
    end
    if rocketBlinkTimer then
      timer.cancel(rocketBlinkTimer)
      rocketBlinkTimer = nil
    end
    monster.cleanBuffAnimationImages()
  end
  
  local function pauseAnimations(shouldPause)
    monster.setPaused(shouldPause)
  end
  
  local function setPlayerPosition(newPosition, newNumberOfPlayers)
    playerPosition = newPosition
    numberOfPlayers = newNumberOfPlayers
  end
  
  local function getPlayerPosition()
    return playerPosition
  end
  
  local function setUpdatePowerUpImageFunction(gamePlayFunction)
    updatePowerUpImageFunction = gamePlayFunction
  end
  
  local testTime
  
  local function removeNinjaMark()
    if not booleanStates.startedClean then
      powerUpImages.markPlayerImage.alpha = 0
      powerUpImages.markBarImage.alpha = 0
      player.ninjaMark = false
    end
  end
  
  local function addNinjaMark()
    if not booleanStates.startedClean then
      if not mainPlayer then
        powerUpImages.markPlayerImage.alpha = 1
      end
      powerUpImages.markBarImage.alpha = 1
      if ninjaTimer then
        timer.cancel(ninjaTimer)
        ninjaTimer = nil
      end
      testTime = system.getTimer()
      player.ninjaMark = true
    end
  end
  
  local function isValidNinjaPlayer(ninjaMarkIndex)
    if ninjaMarkIndex > #playerList then
      return false
    end
    if playerList[ninjaMarkIndex].isDisconnected() then
      return false
    end
    return true
  end
  
  local function playNinjaEffect()
    if (powerUpType == 59 or powerUpType == 9) and not booleanStates.startedClean and gameTimes.goalTime < 1 and mainPlayer then
      if ninjaEffectTimer == nil then
        ninjaMarkIndex = math.random(1, #playerList)
        if ninjaMarkIndex == playerId then
          ninjaMarkIndex = ninjaMarkIndex + 1
        end
      end
      local maxSearch = 8
      local foundIndex = isValidNinjaPlayer(ninjaMarkIndex)
      while not foundIndex do
        ninjaMarkIndex = ninjaMarkIndex + 1
        if ninjaMarkIndex > #playerList then
          ninjaMarkIndex = 1
        end
        foundIndex = isValidNinjaPlayer(ninjaMarkIndex)
        maxSearch = maxSearch - 1
        if maxSearch < 0 then
          break
        end
      end
      if maxSearch < 0 then
        ninjaMarkIndex = playerId
      end
      playerList[ninjaMarkIndex].addNinjaMark()
      if lastNinjaMark then
        playerList[lastNinjaMark].removeNinjaMark()
      end
      lastNinjaMark = ninjaMarkIndex
      ninjaMarkIndex = ninjaMarkIndex + 1
      ninjaEffectTimer = timer.performWithDelay(501, playNinjaEffect, 1)
    else
      local function cleanNinjaMarks()
        if not booleanStates.startedClean then
          for i = 1, #playerList do
            playerList[i].removeNinjaMark()
          end
        end
      end
      
      timer.performWithDelay(501, cleanNinjaMarks, 1)
      ninjaEffectTimer = nil
    end
  end
  
  local function setPowerUp(powerUp)
    powerUpType = powerUp
    if mainPlayer then
      updatePowerUpImageFunction(powerUpType)
    end
  end
  
  local function selectRandomPowerUp()
    powerUpAt = player.x
    powerUpType = powerUpChance.selectRandomPowerUp(player, playerPosition, numberOfPlayers, playerList)
    if mainPlayer then
      updatePowerUpImageFunction(powerUpType)
      if powerUpType == 9 or powerUpType == 59 then
        if ninjaEffectTimer then
          timer.cancel(ninjaEffectTimer)
          ninjaEffectTimer = nil
        end
        playNinjaEffect()
      end
    end
  end
  
  local function isDead()
    return booleanStates.playerDead
  end
  
  local function getPowerUp()
    if booleanStates.playerDead then
      return 0
    end
    powerUpType = powerUpChance.convertPowerUp(powerUpType)
    return powerUpType
  end
  
  local function canOtherPlayerUsePU()
    if composer.data.gameInfo.gameType == 0 then
      return true
    elseif 0 < powerUpType then
      return true
    else
      return false
    end
  end
  
  local function usedPowerUp()
    powerUpType = 0
  end
  
  local function pauseSprite()
    if booleanStates.spriteIsRunning and not booleanStates.startedClean then
      booleanStates.spriteIsRunning = false
    end
  end
  
  local function tutorialPause(isPaused)
    if isPaused == true then
      booleanStates.tutorialPause = true
      pauseSprite()
    else
      booleanStates.tutorialPause = false
    end
  end
  
  local function pauseSpriteAminationInAir()
    if not booleanStates.spriteIsInAir and not booleanStates.startedClean then
      booleanStates.spriteIsInAir = true
      if not booleanStates.rocketActive and gameTimes.goalTime < 0 then
        monster.setAnimation("jump_fall", true, true)
      end
    end
  end
  
  local function resumeSpriteAnimationOnGround()
    if booleanStates.startedClean or gameTimes.goalTime > 0 then
      return
    end
    if booleanStates.tutorialPause then
      return
    end
    if booleanStates.spriteIsInAir then
      booleanStates.spriteIsInAir = false
      if not booleanStates.rocketActive then
        monster.setAnimation("run", true, true)
      end
    end
  end
  
  local function setGround()
    if player then
      local newTime = system.getTimer()
      if newTime > gameTimes.groundTime + 300 then
        player.onGround = false
        pauseSpriteAminationInAir()
      end
    end
  end
  
  local function setSpriteSpeed(vx)
    if gameTimes.goalTime > 0 then
      return
    end
    if booleanStates.tutorialPause then
      return
    end
    if not booleanStates.spriteIsRunning and not booleanStates.startedClean then
      booleanStates.spriteIsRunning = true
      monster.setAnimation("run", true, true)
    end
    local speed = vx / speeds.topSpeedX
    if speed < 0.05 then
      speed = 0.05
    end
  end
  
  local function removeBlendEffect(object)
    if object then
      object[1].blendMode = "normal"
    end
  end
  
  local function canGetPowerUp()
    if lastTimePowerUp + 500 > system.getTimer() then
      return false
    elseif player.x > powerUpAt + 100 then
      gameTimes.powerUpAtTimes = 1
      return true
    elseif gameTimes.powerUpAtTimes < 2 then
      gameTimes.powerUpAtTimes = gameTimes.powerUpAtTimes + 1
      return true
    end
    return false
  end
  
  local function castRayAgainstMapElement(x1, y1, x2, y2)
    if booleanStates.startedClean then
      return
    end
    local rayCastHit = physics.rayCast(x1, y1, x2, y2, "closest")
    if not rayCastHit then
      return false
    end
    for key, value in ipairs(rayCastHit) do
      if value.object and value.object.bounce then
        return false
      end
      if value.object and value.object.mapElement then
        return value
      end
    end
    return false
  end
  
  local function tryToSpawnLandEffect()
    local ray = castRayAgainstMapElement(player.x, player.y + 12, player.x, player.y + 30)
    if ray then
      playerEffects.playLandEffect(ray.position.x, ray.position.y, radToDegree(math.atan2(ray.normal.y, ray.normal.x)) + 90)
    end
  end
  
  local function cannonFunction(cannonObject)
    if player and not booleanStates.startedClean then
      player.setPlayerPositionInWorld(cannonObject.x, cannonObject.y)
      player.setLinearVelocityOnPlayer(780, -490)
    end
  end
  
  local function onCollision(self, collisionEvent)
    if collisionEvent.phase == "began" then
      if collisionEvent.other.mapElement then
        player.onGround = true
        resumeSpriteAnimationOnGround()
        gameTimes.groundTime = system.getTimer()
        if not booleanStates.playerDead then
          if collisionEvent.other.bounce then
            if mainPlayer then
              playSound("bounce_tile")
            end
            changeSpeedState = 1
            local vx, vy = player:getLinearVelocity()
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
            player.onGround = false
            setLinearVelocityOnPlayer(vx, newVy)
            state = 1
            changeSpeedState = 2
          elseif collisionEvent.other.boost then
            if mainPlayer then
              playSound("speed_tile")
            end
            changeSpeedState = 1
            local vx, vy = player:getLinearVelocity()
            if vx < speeds.boostMaks then
              if vx < 0 then
                vx = vx * 0.1
              else
                if vx < speeds.defaultTopSpeed then
                  vx = speeds.defaultTopSpeed
                end
                vx = vx * 1.8
              end
              if vx > speeds.boostMaks then
                vx = speeds.boostMaks
              end
              setLinearVelocityOnPlayer(vx, vy)
            end
            state = 3
            changeSpeedState = 2
          elseif collisionEvent.other.boost2 then
            changeSpeedState = 1
            local vx, vy = player:getLinearVelocity()
            if vx < speeds.boostMaksSlide then
              if vx < 0 then
                vx = vx * 0.7
              else
                vx = vx * 1.5
              end
              if vx > speeds.boostMaksSlide then
                vx = speeds.boostMaksSlide
              end
              setLinearVelocityOnPlayer(vx, vy)
            end
            state = 3
            changeSpeedState = 2
          elseif collisionEvent.other.slow then
            changeSpeedState = 1
            local vx, vy = player:getLinearVelocity()
            if vx > speeds.slowMaks then
              vx = vx * 0.5
              if vx < speeds.slowMaks then
                vx = speeds.slowMaks
              end
              setLinearVelocityOnPlayer(vx, vy)
            end
            state = 4
            changeSpeedState = 2
          else
            state = 1
          end
          if collisionEvent.other.onCollision then
            collisionEvent.other.onCollision()
          end
        end
      elseif collisionEvent.other.powerUp then
        if mainPlayer and composer.onboarding.isActive == true then
          composer.onboarding.onCollideWithPowerBox()
        end
        if powerUpType == 0 and canGetPowerUp() then
          if mainPlayer then
            collisionEvent.other.blendMode = "add"
            local list = {
              collisionEvent.other
            }
            
            local function blendClosure(event)
              return removeBlendEffect(list)
            end
            
            timer.performWithDelay(200, blendClosure, 1)
            playSound("pickup")
            lastTimePowerUp = system.getTimer()
          end
          if composer.data.gameInfo.gameType == 0 or mainPlayer then
            selectRandomPowerUp()
          end
          if gameTimes.powerUpAtTimes == 2 and mainPlayer then
            collisionEvent.other:setFillColor(0.5450980392156862, 0.5137254901960784, 0.47058823529411764, 1)
          end
          if composer.data.gameInfo.gameType ~= 0 and mainPlayer then
            composer.tcpClient.sendPowerBoxMessage(powerUpType, player.x, player.y, math.round(collisionEvent.other.x), math.round(collisionEvent.other.y))
          end
        end
      elseif collisionEvent.other.cannon then
        if collisionEvent.otherElement == 1 then
          collisionEvent.other.onCollision(player, player.booleanStates.startedClean)
        else
          player.onGround = true
          resumeSpriteAnimationOnGround()
          gameTimes.groundTime = system.getTimer()
        end
      end
    elseif collisionEvent.phase == "ended" and collisionEvent.other.mapElement then
      timer.performWithDelay(300, setGround, 1)
    end
  end
  
  local testCounter = 1
  
  local function calculateRotation()
    local vx, vy = player:getLinearVelocity()
    if vy < -400 then
      vy = vy / 2
    end
    if 50 < vx then
      if #previousVelocity > previousVelocityMaxSize then
        table.remove(previousVelocity)
        table.remove(previousVelocity)
      end
      table.insert(previousVelocity, 1, vx)
      table.insert(previousVelocity, 2, vy)
      local weightedVelX = 0
      local weightedVelY = 0
      for i = 1, #previousVelocity, 2 do
        weightedVelX = weightedVelX + previousVelocity[i]
        weightedVelY = weightedVelY + previousVelocity[i + 1]
      end
      weightedVelX = weightedVelX / previousVelocityMaxSize
      weightedVelY = weightedVelY / previousVelocityMaxSize
      local radians = math.atan(weightedVelY / weightedVelX)
      local degrees = math.deg(radians)
      if 35 < degrees then
        degrees = 34
      elseif degrees < -35 then
        degrees = -34
      end
      if not player.onGround and 10 < degrees then
        degrees = 9
      end
      spriteDisplay.rotation = degrees
    end
    if 5 < testCounter then
      testCounter = 0
      createItemEffect()
    end
    testCounter = testCounter + 1
  end
  
  local lastAccelerateTime = 0
  local runOnceAccelerate = true
  
  local function accelerate()
    if not booleanStates.startedClean and not booleanStates.disconnected then
      if runOnceAccelerate then
        runOnceAccelerate = false
        lastAccelerateTime = system.getTimer()
        player.bodyType = "dynamic"
        monster.setAnimation("run", true, false)
      end
      local vx, vy = player:getLinearVelocity()
      if changeSpeedState == 1 then
        lastAccelerateTime = system.getTimer()
      else
        changeSpeedState = 0
        local startVx = vx
        local acceleration = speeds.accelerateX
        local newTime = system.getTimer()
        local multiplier = (newTime - lastAccelerateTime) * 0.01
        lastAccelerateTime = newTime
        acceleration = acceleration * multiplier
        if vx < speeds.topSpeedX * 0.2 then
          acceleration = acceleration * 4
        elseif vx < speeds.topSpeedX * 0.5 then
          acceleration = acceleration * 2
        end
        if player.onGround or booleanStates.rocketActive then
          vx = vx + acceleration
        else
          vx = vx + acceleration * 0.4
        end
        if vx > speeds.topSpeedX and vy <= 20 then
          if vx - speeds.topSpeedX < acceleration * 1.5 then
            vx = speeds.topSpeedX
          else
            vx = vx * 0.9
          end
        elseif vx > speeds.topSpeedX * 1.5 and 0 < vy then
          if vx - speeds.topSpeedX < acceleration * 1.5 then
            vx = speeds.topSpeedX * 1.5
          else
            vx = vx * 0.9
          end
        end
        if booleanStates.playerDead then
          vx = 0
          setLinearVelocityOnPlayer(vx, vy)
        elseif changeSpeedState == 0 and state == 1 then
          setLinearVelocityOnPlayer(vx, vy)
        elseif changeSpeedState == 0 and state == 3 and vx < speeds.topSpeedX then
          setLinearVelocityOnPlayer(vx, vy)
        elseif changeSpeedState == 0 and startVx < speeds.topSpeedX * 0.4 then
          setLinearVelocityOnPlayer(vx, vy)
        end
      end
      setSpriteSpeed(vx)
      monster.updateSpeed(vx / speeds.defaultTopSpeed)
    end
  end
  
  local function castRayAgainstMapElementWithDecal(x1, y1, x2, y2)
    if booleanStates.startedClean then
      return
    end
    local rayCastHit = physics.rayCast(x1, y1, x2, y2, "closest")
    if not rayCastHit then
      return false
    end
    for key, value in ipairs(rayCastHit) do
      if value.object and value.object.mapElement and value.object.canTileHaveDecal == true then
        return value
      end
    end
    return false
  end
  
  local function canJump()
    if booleanStates.startedClean or player == nil then
      return false
    elseif composer.onboarding.physicsPaused then
      return false
    elseif booleanStates.playerDead then
      return false
    elseif booleanStates.rocketActive then
      if booleanStates.rocketActiveHigh then
        return false
      else
        return true
      end
    elseif player.onGround then
      return true
    elseif castRayAgainstMapElement(player.x, player.y + 12, player.x, player.y + 30) then
      return true
    else
      return false
    end
  end
  
  local function tryToSpawnJumpEffect()
    local ray = castRayAgainstMapElement(player.x, player.y + 12, player.x, player.y + 30)
    if ray then
      local vx, vy = getLinearVelocityOnPlayer()
      local vxPercentage = vx / speeds.topSpeedX
      if vxPercentage < 0 then
        vxPercentage = 0
      elseif 1 < vxPercentage then
        vxPercentage = 1
      end
      vxPercentage = 1 - vxPercentage - 0.4
      playerEffects.playJumpEffect(ray.position.x, ray.position.y, radToDegree(math.atan2(ray.normal.y, ray.normal.x)) + 90, vxPercentage)
    end
  end
  
  local function jump()
    gameTimes.lastJumpTime = system.getTimer()
    changeSpeedState = 1
    local vx, vy = player:getLinearVelocity()
    local jumpForce = -350 -- Daha güçlü zıplama! (önceden -200)
    if booleanStates.rocketActive then
      jumpForce = -300 -- Rocket modda da daha güçlü (önceden -200)
      if vy < -300 then
        jumpForce = -10
      end
      if mainPlayer then
        playSound("rocket_jump")
      end
    else
      if vx > speeds.topSpeedX * 0.2 then
        if state == 4 then
          vx = vx * 0.8
        else
          vx = vx * 0.7
        end
      end
      vy = 0
      if mainPlayer then
        playSound("jump")
      end
    end
    setLinearVelocityOnPlayer(vx, vy)
    applyForceOnPlayer(0, jumpForce)
    player.onGround = false
    state = 1
    changeSpeedState = 2
    monster.setAnimation("jump_start", true, true)
    booleanStates.spriteIsInAir = true
    tryToSpawnJumpEffect()
  end
  
  local function stopPlayer()
    if not booleanStates.startedClean then
      if booleanStates.rocketActive then
        hideRocketEffect()
      end
      local vx, vy = player:getLinearVelocity()
      if player.onGround or castRayAgainstMapElement(player.x, player.y + 12, player.x, player.y + 30) then
        if vx <= 60 then
          pauseSprite()
          setLinearVelocityOnPlayer(0, vy)
          monster.setAnimation("idle", true, true)
        else
          vx = vx * 0.5
          setSpriteSpeed(vx)
          setLinearVelocityOnPlayer(vx, vy)
          monster.setAnimation("slide", true, true)
        end
      end
      if bot then
        bot.inGoal()
      end
    end
  end
  
  local function getPlayerGoalTime()
    return gameTimes.goalTime
  end
  
  local function setPlayerGoalTime(newTime)
    gameTimes.goalTime = newTime
  end
  
  local function getUsername()
    return name
  end
  
  local function getPlayerHead()
    return playerHead
  end
  
  local function trimNumber(number)
    number = number * 100
    number = math.floor(number)
    number = number * 0.01
    return number
  end
  
  local function createStatusList(finish)
    local vx, vy = player:getLinearVelocity()
    local x = player.x
    local y = player.y
    vx = trimNumber(vx)
    vy = trimNumber(vy)
    x = trimNumber(x)
    y = trimNumber(y)
    local list = {
      x = x,
      y = y,
      vX = vx,
      vY = vy
    }
    if finish then
      list.s = gameTimes.currentGameTime
    end
    return list
  end
  
  local function getPlayerStatus()
    local list = createStatusList(false)
    return list
  end
  
  local function getPlayerFinish()
    local list = createStatusList(true)
    return list
  end
  
  local function getCurrentGameTime()
    return gameTimes.currentGameTime
  end
  
  local function setCurrentGameTime(newTime)
    gameTimes.currentGameTime = newTime
  end
  
  local function getBodyPartsGroup()
    return bodyParts
  end
  
  local function getScreenGroup()
    return screenGroup
  end
  
  local function getGhostGroup()
    return playerGhost
  end
  
  local function shieldPowerUp()
    disablePreviousPowerUp()
    playerEffects.playPowerUpShieldStart()
  end
  
  local function armorPowerUp()
    disablePreviousPowerUp()
    playPowerUpArmor()
  end
  
  local function speedPowerUp()
    disablePreviousPowerUp()
    speeds.topSpeedX = speeds.topSpeedX * 1.5
    speeds.accelerateX = speeds.accelerateX * 1.5
    applyForceOnPlayer(300, 0)
    -- Güvenli animasyon çalma
    pcall(function()
      monster.playBuffAnimation("speed_start", false)
    end)
  end
  
  local function rocketPowerUp()
    disablePreviousPowerUp()
    -- Güvenli animasyon çalma
    pcall(function()
      monster.playBuffAnimation("rocket_start", false)
    end)
    
    local function startBlink()
      pcall(function()
        monster.playBuffAnimation("rocket_end", true)
      end)
    end
    
    rocketBlinkTimer = timer.performWithDelay(3500, startBlink, 1)
  end
  
  local function magnetPowerUp(killer)
    playSound("magnet_hit")
    local dirRight
    if playerList[playerId].x < playerList[killer].x then
      applyForceOnPlayer(100, 0)
      dirRight = false
    else
      setLinearVelocityOnPlayer(0, 0)
      applyForceOnPlayer(-400, 0)
      dirRight = true
    end
    playerEffects.playMagnetEffect(dirRight)
  end
  
  local function bounceTrapPowerUp()
    setLinearVelocityOnPlayer(0, 0)
    applyForceOnPlayer(-300, -150)
  end
  
  function disablePreviousPowerUp()
    if booleanStates.shieldActive then
      playerEffects.hidePowerUpShield()
    end
    if booleanStates.armorActive then
      hidePowerUpArmor()
    end
    if booleanStates.rocketActive then
      hideRocketEffect()
    end
    if booleanStates.speedActive then
      stopPowerUpSpeed(false)
    end
    monster.setAnimation("run", true, false)
  end
  
  local function createLightning()
    playerEffects.playLightningStrike()
  end
  
  local function removeBladeAnimation()
    powerUpImages.bladeImage.alpha = 0
  end
  
  local function createBladeAnimation()
    powerUpImages.bladeImage.alpha = 1
    transition.to(powerUpImages.bladeImage, {time = 200, rotation = 355})
  end
  
  local function removeTrapAnimation()
    powerUpImages.trapImage.alpha = 0
  end
  
  local function createTrapAnimation()
    powerUpImages.trapImage.alpha = 1
  end
  
  local function removeBounceTrapAnimation()
    powerUpImages.bounceTrapImage.alpha = 0
  end
  
  local function createBounceTrapAnimation()
    powerUpImages.bounceTrapImage.alpha = 1
  end
  
  local function createHuntersMarkAnimation()
    monster.playUseAnimation("mark_active", false)
  end
  
  local function createMagnetAnimation()
    monster.playUseAnimation("magnet_start", false)
    playKillMessage(playerId, 7, playerId)
  end
  
  local function isMainPlayerCloseEnough()
    if mainPlayer then
      return true
    end
    local mainPlayerObject = composer.mainPlayer
    if mainPlayerObject then
      local dx = player.x - mainPlayerObject.x
      if -300 <= dx then
        return true
      end
    end
    return false
  end
  
  local function tryToSpawnBloodDecal()
    if booleanStates.startedClean then
      return
    end
    local ray1 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x - 30, player.y + 50)
    local ray2 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x, player.y + 50)
    local ray3 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x + 30, player.y + 50)
    if ray1 and ray2 and ray3 then
      local add = ""
      if math.random() < 0.5 then
        add = "2"
      end
      local decal = display.newImageRect("images/game/powerups/decal_blood" .. add .. ".png", 160, 100)
      local imageRotation = radToDegree(math.atan2(ray2.normal.y, ray2.normal.x)) + 90
      decal:scale(0.35, 0.35)
      decal.yScale = 0.01
      transition.to(decal, {
        time = 85,
        yScale = 0.3 + math.random() * 0.05
      })
      decal.rotation = imageRotation
      decal.anchorX = 0.5
      decal.anchorY = 0
      if math.random() < 0.5 then
        decal.xScale = -0.35
      end
      decal.x = ray2.position.x
      decal.y = ray2.position.y
      bodyParts:insert(decal)
    end
  end
  
  local function tryToSpawnBurntDecal()
    local ray1 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x - 30, player.y + 50)
    local ray2 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x, player.y + 50)
    local ray3 = castRayAgainstMapElementWithDecal(player.x, player.y + 12, player.x + 30, player.y + 50)
    if ray1 and ray2 and ray3 then
      local decal = display.newImageRect("images/game/powerups/decal_burnt.png", 160, 100)
      local imageRotation = radToDegree(math.atan2(ray2.normal.y, ray2.normal.x)) + 90
      decal:scale(0.35, 0.35)
      decal.yScale = 0.01
      transition.to(decal, {time = 85, yScale = 0.35})
      decal.rotation = imageRotation
      decal.anchorX = 0.5
      decal.anchorY = 0
      decal.x = ray2.position.x
      decal.y = ray2.position.y
      bodyParts:insert(decal)
    end
  end
  
  local function returnToPreviousSpeed()
    if not booleanStates.playerDead and player then
      speeds.topSpeedX = speeds.tempSpeedX
      player.alpha = 1
    end
  end
  
  local function hidePlayer()
    if player then
      player.alpha = 0
    end
  end
  
  local function setPlayerAlive()
    booleanStates.playerDead = false
    partlyShowPlayerSprite()
    returnToPreviousSpeed()
    if booleanStates.speedActive then
      stopPowerUpSpeed(false)
    end
  end
  
  local function setKillMessageFunction(newFunction)
    playKillMessage = newFunction
  end
  
  local function isFarAhead()
    local diff = 5000
    for i = 1, #playerList do
      if i ~= playerId and diff > player.x - playerList[i].x then
        diff = player.x - playerList[i].x
      end
      if playerList[i].x + 2000 > player.x and i ~= playerId then
        return 0
      end
    end
    if diff < 2500 then
      return 1
    end
    return 2
  end
  
  local function changeBody()
    if player then
      player.bodyType = "static"
    end
  end
  
  local function stopPlayerSafe()
    if player then
      setLinearVelocityOnPlayer(0, 0)
    end
  end
  
  local function setDisconnected()
    if player and not booleanStates.startedClean then
      pcall(stopPlayerSafe)
      booleanStates.disconnected = true
      booleanStates.playerInvulnerable = true
      player.alpha = 0.5
      disconnectBar.alpha = 1
      timer.performWithDelay(10, changeBody, 1)
    end
  end
  
  local function isDisconnected()
    return booleanStates.disconnected
  end
  
  local function playBloodScreen(override)
    playSound("blood")
    playerEffects.runBloodScreen(override)
  end
  
  local function playHitAnimation(puType, hitType, killer)
    if puType == 1 then
      playSound("blade_hit")
    elseif puType == 2 then
      playSound("trap_hit")
    elseif puType == 3 then
      createLightning()
      playSound("lightning_hit")
    elseif puType == 9 then
      playSound("hunter_hit")
    elseif puType == 10 then
      playSound("rocket_hit")
    end
    if hitType == 1 then
      playKillMessage(killer, puType, playerId)
      local baseDeadTime = 1000
      if playerPosition == 1 then
        local aheadState = isFarAhead()
        if aheadState == 1 then
          baseDeadTime = 1500
        elseif aheadState == 2 then
          baseDeadTime = 2000
        end
      end
      booleanStates.playerDead = true
      booleanStates.playerInvulnerable = true
      if bot then
        bot.botDied()
      end
      local shouldHidePlayer = true
      local vx, vy = getLinearVelocityOnPlayer()
      if puType == 1 then
        playBloodScreen(false)
        if composer.database.getViolence() == 1 and isMainPlayerCloseEnough() then
          tryToSpawnBloodDecal()
          timer.performWithDelay(10, function()
            playerCorpses.dropSawbladeGibs(vx * 0.5, vy * 0.5)
          end, 1)
        end
        timer.performWithDelay(600, function()
          playerCorpses.dropBrain(vx * 0.5, vy * 0.5)
        end, 1)
        timer.performWithDelay(1500, playerCorpses.readyBrain, 1)
        setPlayerAliveTimer = timer.performWithDelay(baseDeadTime, setPlayerAlive, 1)
      elseif puType == 2 then
        playerEffects.playTrapEffect()
        playBloodScreen(false)
        if composer.database.getViolence() == 1 and isMainPlayerCloseEnough() then
          tryToSpawnBloodDecal()
        end
        timer.performWithDelay(10, function()
          playerCorpses.dropHead(vx * 0.1, vy * 0.1)
        end, 1)
        timer.performWithDelay(1500, playerCorpses.readyHead, 1)
        setPlayerAliveTimer = timer.performWithDelay(baseDeadTime, setPlayerAlive, 1)
      elseif puType == 3 then
        playerEffects.playLightningEffect()
        tryToSpawnBurntDecal()
        hidePlayerTimer = timer.performWithDelay(600, hidePlayer, 1)
        timer.performWithDelay(600, function()
          playerCorpses.dropSkull(0, 0)
        end, 1)
        timer.performWithDelay(1500, playerCorpses.readySkull, 1)
        setPlayerAliveTimer = timer.performWithDelay(baseDeadTime, setPlayerAlive, 1)
      elseif puType == 9 then
        playBloodScreen(false)
        shouldHidePlayer = false
        playerEffects.createCannonBall()
        if composer.database.getViolence() == 1 and isMainPlayerCloseEnough() then
          timer.performWithDelay(180, function()
            playerCorpses.dropHunterGibs(vx * 0.5, vy * 0.5)
          end, 1)
          timer.performWithDelay(180, tryToSpawnBloodDecal, 1)
        end
        timer.performWithDelay(180, function()
          playerCorpses.dropHeadShot(vx * 0.1, vy * 0.1)
        end, 1)
        hidePlayerTimer = timer.performWithDelay(180, hidePlayerSprite, 1)
        timer.performWithDelay(1500, playerCorpses.readyHuntersMarkHead, 1)
        setPlayerAliveTimer = timer.performWithDelay(baseDeadTime, setPlayerAlive, 1)
      elseif puType == 10 then
        playBloodScreen(false)
        if killer == playerId then
          playerEffects.playRocketDeathEffect()
          timer.performWithDelay(50, function()
            playerCorpses.dropRocketParts(vx * 0.25, vy * 0.25)
          end, 1)
          timer.performWithDelay(1500, playerCorpses.readyRocketParts, 1)
        end
        if composer.database.getViolence() == 1 and isMainPlayerCloseEnough() then
          tryToSpawnBloodDecal()
          timer.performWithDelay(50, function()
            playerCorpses.dropSawbladeGibs(vx * 0.5, vy * 0.5)
          end, 1)
        end
        setPlayerAliveTimer = timer.performWithDelay(baseDeadTime, setPlayerAlive, 1)
        hideRocketEffect(true)
      end
      if shouldHidePlayer then
        hidePlayerSprite()
      end
      disablePreviousPowerUp()
      setLinearVelocityOnPlayer(0, 0)
      if 0 < speeds.topSpeedX then
        speeds.tempSpeedX = speeds.topSpeedX
        speeds.topSpeedX = 0
      end
    elseif hitType == 2 then
      hidePowerUpArmor()
    elseif hitType == 3 then
    elseif hitType == 4 then
      if puType == 7 then
        magnetPowerUp(killer)
      elseif puType == 8 then
        playSound("bounce_hit")
        bounceTrapPowerUp(killer)
        playKillMessage(killer, puType, playerId)
      end
    end
  end
  
  local function playAnimation(animation, loop, override)
    monster.setAnimation(animation, loop, override)
  end
  
  local function resetBones()
    monster.resetBones()
  end
  
  local function onCollisionPowerUp(killer, puType)
    if booleanStates.startedClean then
    elseif gameTimes.goalTime == -1 and not booleanStates.playerInvulnerable then
      local hitType = 0
      local list = {}
      if booleanStates.shieldActive then
        hitType = 3
        playerEffects.playShieldAbsorb()
      elseif booleanStates.armorActive then
        hitType = 2
      elseif puType == 7 or puType == 8 then
        hitType = 4
      else
        hitType = 1
      end
      playHitAnimation(puType, hitType, killer)
      list = {
        k = killer,
        p = puType,
        h = hitType
      }
      if 0 < composer.data.gameInfo.gameType then
        composer.tcpClient.sendPlayerHitByPowerUp(killer, puType, 0, hitType, 0)
      end
      return hitType
    end
  end
  
  local function forcePlayer()
    if mainPlayer or composer.data.gameInfo.gameType == 0 then
      return
    end
    if not booleanStates.startedClean then
      local vx, vy = playerGhost:getLinearVelocity()
      setLinearVelocityOnPlayer(vx, vy)
      player.x = playerGhost.x
      player.y = playerGhost.y
    end
  end
  
  local function interpolation()
    if mainPlayer then
      return
    end
    if gameTimes.goalTime > 0 or composer.data.gameInfo.gameType == 0 then
      return
    end
    local x, y = player.x, player.y
    local gx, gy = playerGhost.x, playerGhost.y
    local deltaX = x - gx
    local deltaY = y - gy
    local xBuffer = 20
    if booleanStates.playerDead then
      if math.abs(deltaX) < 2 then
        x = gx
      elseif deltaX < 0 then
        x = x - 1
      else
        x = x + 1
      end
      player.x = x
      return
    end
    if math.abs(deltaY) > 50 or math.abs(deltaX) > 100 then
      forcePlayer()
    elseif x < gx + xBuffer then
      player:applyForce(3, 0, player.x, player.y)
    elseif x > gx + xBuffer then
      player:applyForce(-3, 0, player.x, player.y)
    end
  end
  
  local function corrigateOtherPlayers(newPosX, newPosY, newVelX, newVelY)
    if not booleanStates.startedClean then
      playerGhost:setLinearVelocity(newVelX, newVelY)
      playerGhost.x = newPosX
      playerGhost.y = newPosY
      player:setLinearVelocity(newVelX, newVelY)
    end
  end
  
  local function addPlaySoundFunction(playSoundFunction)
    playSoundOnChannel = playSoundFunction
  end
  
  function playSound(sound)
    playSoundOnChannel(sound, channelList[channelCounter])
    channelCounter = channelCounter + 1
    if channelCounter > reservedChannels then
      channelCounter = 1
    end
  end
  
  local function setSoundVolume(volume)
    if volume == currentVolume then
      return 1
    end
    currentVolume = volume
    for i = 1, reservedChannels do
      local index = channelList[i]
      local didSetVolume = audio.setVolume(volume, {channel = index})
    end
  end
  
  local function stopTimers()
    if rocketBlinkTimer then
      timer.cancel(rocketBlinkTimer)
      rocketBlinkTimer = nil
    end
    if setPlayerAliveTimer then
      timer.cancel(setPlayerAliveTimer)
      setPlayerAliveTimer = nil
    end
    if hidePlayerTimer then
      timer.cancel(hidePlayerTimer)
      hidePlayerTimer = nil
    end
  end
  
  local function clean()
    booleanStates.startedClean = true
    playerCorpses.startedCleanNow()
    monster.clean()
    player:removeEventListener("collision", player)
    transition.cancel("ninjaTrans")
    stopTimers()
    if bot then
      bot.cleanBot()
    end
    playerEffects.clean()
    playerGhost:removeSelf()
    playerGhost = nil
    player:removeSelf()
    player = nil
  end
  
  player:insert(spriteDisplay)
  player:insert(powerUpImages.bladeImage)
  player:insert(powerUpImages.trapImage)
  player:insert(powerUpImages.bounceTrapImage)
  player:insert(powerUpImages.markPlayerImage)
  playerEffects.updateDisplayGroup()
  playerHead:insert(headBarBackground)
  playerHead:insert(monsterHead)
  playerHead:insert(powerUpImages.markBarImage)
  playerHead.anchorChildren = true
  playerHead.anchorX = 0.5
  playerHead.anchorY = 1
  monsterHead.y = 30
  monsterHead.x = 2
  playerHead:insert(disconnectBar)
  disconnectBar.alpha = 0
  disconnectBar.y = 5
  disconnectBar.x = 1
  powerUpImages.markBarImage.alpha = 0
  powerUpImages.markBarImage.y = -20
  local buttomShape = {
    12,
    12,
    9,
    15,
    4,
    17,
    -4,
    17,
    -9,
    15,
    -12,
    12,
    -15,
    7,
    15,
    7
  }
  local playerShape = {
    15,
    -9,
    15,
    7,
    -15,
    7,
    -15,
    -9
  }
  local topShape = {
    -15,
    -9,
    -4,
    -18,
    4,
    -18,
    15,
    -9
  }
  if mainPlayer or composer.data.gameInfo.gameType == 0 then
    physics.addBody(player, {
      density = 1.27,
      friction = 0,
      shape = playerShape,
      bounce = 0.1,
      filter = remotePlayerCollisionFilter
    }, {
      density = 0,
      friction = 0,
      shape = buttomShape,
      bounce = 0.1,
      filter = localPlayerCollisionFilter
    }, {
      density = 0,
      friction = 0,
      shape = topShape,
      bounce = 0.1,
      filter = remotePlayerCollisionFilter
    })
  else
    physics.addBody(player, {
      density = 1.27,
      friction = 0,
      shape = playerShape,
      bounce = 0.1,
      filter = remotePlayerCollisionFilter
    }, {
      density = 0,
      friction = 0,
      shape = buttomShape,
      bounce = 0.1,
      filter = remotePlayerCollisionFilter
    }, {
      density = 0,
      friction = 0,
      shape = topShape,
      bounce = 0.1,
      filter = remotePlayerCollisionFilter
    })
  end
  physics.addBody(playerGhost, {
    density = 1.27,
    friction = 0,
    shape = playerShape,
    bounce = 0.1,
    filter = remotePlayerCollisionFilter
  }, {
    density = 0,
    friction = 0,
    shape = buttomShape,
    bounce = 0.1,
    filter = remotePlayerCollisionFilter
  }, {
    density = 0,
    friction = 0,
    shape = topShape,
    bounce = 0.1,
    filter = remotePlayerCollisionFilter
  })
  timer.performWithDelay(10, changeBody, 1)
  player.isSleepingAllowed = false
  player.x = startXPos
  player.y = startYPos + 4
  player.id = playerId
  player.player = true
  player.onGround = true
  player.isFixedRotation = true
  player.mobileUser = false
  player.ninjaMark = false
  playerGhost.x = player.x
  playerGhost.y = player.y
  playerGhost.isFixedRotation = true
  playerGhost.isSleepingAllowed = false
  powerUpImages.bladeImage.alpha = 0
  powerUpImages.trapImage.alpha = 0
  powerUpImages.bounceTrapImage.alpha = 0
  powerUpImages.markPlayerImage.alpha = 0
  powerUpImages.markPlayerImage.y = -43
  
  local function startBot()
    bot = botModule.new(player)
    local botSpeed = math.random(335, 345)
    speeds.defaultTopSpeed = botSpeed
    speeds.topSpeedX = botSpeed
    speeds.tempSpeedX = botSpeed
  end
  
  if isSimulator and composer.config.bot and mainPlayer then
    startBot()
  elseif composer.data.gameInfo.gameType == 0 and not mainPlayer then
    startBot()
  end
  
  local function setBotModuleFunction(newFunction, systemStartTime, puBtn)
    if bot then
      bot.setGameFunction(newFunction, systemStartTime, puBtn)
    end
  end
  
  player.collision = onCollision
  player.onCollisionPowerUp = onCollisionPowerUp
  player.stopPlayer = stopPlayer
  player.accelerate = accelerate
  player.getPowerUp = getPowerUp
  player.booleanStates = booleanStates
  player.usedPowerUp = usedPowerUp
  player.setPlayerPosition = setPlayerPosition
  player.getPlayerPosition = getPlayerPosition
  player.getUsername = getUsername
  player.jump = jump
  player.canJump = canJump
  player.speedPowerUp = speedPowerUp
  player.stopPowerUpSpeed = stopPowerUpSpeed
  player.shieldPowerUp = shieldPowerUp
  player.armorPowerUp = armorPowerUp
  player.rocketPowerUp = rocketPowerUp
  player.playTeleportPowerUp = playerEffects.playTeleportPowerUp
  player.createBladeAnimation = createBladeAnimation
  player.removeBladeAnimation = removeBladeAnimation
  player.createTrapAnimation = createTrapAnimation
  player.removeTrapAnimation = removeTrapAnimation
  player.createBounceTrapAnimation = createBounceTrapAnimation
  player.removeBounceTrapAnimation = removeBounceTrapAnimation
  player.createHuntersMarkAnimation = createHuntersMarkAnimation
  player.createMagnetAnimation = createMagnetAnimation
  player.corrigateOtherPlayers = corrigateOtherPlayers
  player.calculateRotation = calculateRotation
  player.getPlayerGoalTime = getPlayerGoalTime
  player.setPlayerGoalTime = setPlayerGoalTime
  player.getCurrentGameTime = getCurrentGameTime
  player.setCurrentGameTime = setCurrentGameTime
  player.getPlayerHead = getPlayerHead
  player.playHitAnimation = playHitAnimation
  player.playAnimation = playAnimation
  player.playBloodScreen = playBloodScreen
  player.resetBones = resetBones
  player.getPlayerStatus = getPlayerStatus
  player.getPlayerFinish = getPlayerFinish
  player.getBodyPartsGroup = getBodyPartsGroup
  player.pauseSprite = pauseSprite
  player.addPlaySoundFunction = addPlaySoundFunction
  player.playSound = playSound
  player.setSoundVolume = setSoundVolume
  player.setUpdatePowerUpImageFunction = setUpdatePowerUpImageFunction
  player.setPowerUp = setPowerUp
  player.getScreenGroup = getScreenGroup
  player.showCloud = playerEffects.showCloud
  player.setKillMessageFunction = setKillMessageFunction
  player.clean = clean
  player.setDisconnected = setDisconnected
  player.isDisconnected = isDisconnected
  player.setBotModuleFunction = setBotModuleFunction
  player.addNinjaMark = addNinjaMark
  player.removeNinjaMark = removeNinjaMark
  player.playNinjaEffect = playNinjaEffect
  player.interpolation = interpolation
  player.getGhostGroup = getGhostGroup
  player.forcePlayer = forcePlayer
  player.tutorialPause = tutorialPause
  player.canOtherPlayerUsePU = canOtherPlayerUsePU
  player.getLinearVelocityOnPlayer = getLinearVelocityOnPlayer
  player.setLinearVelocityOnPlayer = setLinearVelocityOnPlayer
  player.getPlayerPositionInWorld = getPlayerPositionInWorld
  player.setPlayerPositionInWorld = setPlayerPositionInWorld
  player.cannonFunction = cannonFunction
  player.applyForceOnPlayer = applyForceOnPlayer
  player.powerUpLinks = powerUpLinks
  player.isDead = isDead
  player.pauseAnimations = pauseAnimations
  player:addEventListener("collision", player)
  playerEffects.addEventListeners()
  playerCorpses.readySkull()
  playerCorpses.readyHead()
  playerCorpses.readyHeadShot()
  playerCorpses.readyBrain()
  playerCorpses.readyHuntersMarkHead()
  playerCorpses.readyRocketParts()
  return player
end

M.new = new
return M
