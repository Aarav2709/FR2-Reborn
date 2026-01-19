local M = {}

local function new(player)
  local composer = require("composer")
  local botPlayer = {}
  local botTimer, roofDontJump, prevY, prevX, noJumpTimer, gameFunction, gameState, counter, systemStartTime, btnPowerUpPress
  
  local function checkIfStuck()
    if 10 < #prevX then
      local lastPosition = prevX[1]
      local stuck = true
      for i = 2, #prevX do
        if math.abs(lastPosition - prevX[i]) > 30 then
          stuck = false
          break
        end
      end
      if stuck then
        print("stuck")
        botPlayer:applyForce(-400, -200, botPlayer.x, botPlayer.y)
      end
    end
  end
  
  local function jumpAgain()
    roofDontJump = false
    prevY = 999999
  end
  
  local function jump(wall)
    if botPlayer.canJump() then
      if botPlayer.y > prevY - 20 then
        roofDontJump = true
        timer.performWithDelay(1800, jumpAgain, 1)
      else
        botPlayer.jump()
        if wall then
          prevY = botPlayer.y
        end
      end
    end
  end
  
  local function createPowerUpList(pType)
    if gameFunction then
      local data = {}
      data[1] = "11"
      data[2] = botPlayer.id
      data[3] = {}
      data[4] = pType
      data[5] = botPlayer.x
      data[6] = botPlayer.y
      gameFunction(data)
    end
  end
  
  local function usePowerUp(secTime)
    if composer.data.gameInfo.gameType == 0 then
      local pType = botPlayer.getPowerUp()
      if 0 < pType then
        if 50 < pType then
          createPowerUpList(pType)
          
          local function myclosure(event)
            return createPowerUpList(pType - 50)
          end
          
          timer.performWithDelay(200, myclosure, 1)
        else
          createPowerUpList(pType)
        end
        botPlayer.usedPowerUp()
      end
    elseif btnPowerUpPress then
      local event = {}
      event.phase = "began"
      btnPowerUpPress(nil, event)
    end
  end
  
  local function updateBot(event)
    if composer.onboarding.isActive == true and composer.onboarding.overrideAI() then
      return
    end
    if botPlayer then
      local vx, vy = botPlayer:getLinearVelocity()
      
      -- BOT'A SÜREKLI GÜÇLÜ İLERİ HIZ VER (Oyuncu gibi ama daha hızlı)
      if gameState == 1 and vx < 800 then
        botPlayer:setLinearVelocity(math.max(vx + 100, 500), vy)
      end
      if 0 < vx and gameState == 0 then
        gameState = 1
      end
      if vx < 200 and gameState == 1 and not roofDontJump then
        jump(true)
        noJumpTimer = 0
      elseif math.random() > 0.92 and gameState == 1 and not roofDontJump then
        jump()
        noJumpTimer = 0
      else
        noJumpTimer = noJumpTimer + 1
      end
      if noJumpTimer == 3 then
        prevY = 999999
      end
      if 12 < #prevX then
        table.remove(prevX)
      end
      if gameState == 1 and 5 < counter then
        if botPlayer.canJump() then
          table.insert(prevX, 1, botPlayer.x)
        end
        counter = 0
        usePowerUp()
      end
      counter = counter + 1
      checkIfStuck()
    else
      timer.cancel(event.source)
    end
  end
  
  local function startBotModule(player)
    if player then
      botPlayer = player
      roofDontJump = false
      prevY = 999999
      prevX = {}
      noJumpTimer = 0
      gameState = 0
      counter = 0
      botTimer = timer.performWithDelay(200, updateBot, 0)
    end
  end
  
  startBotModule(player)
  
  local function setGameFunction(powerUpFunction, startTime, powerUpBtn)
    gameFunction = powerUpFunction
    systemStartTime = startTime
    btnPowerUpPress = powerUpBtn
  end
  
  botPlayer.setGameFunction = setGameFunction
  
  local function botDied()
    jumpAgain()
  end
  
  botPlayer.botDied = botDied
  
  local function cleanBot()
    if botTimer then
      timer.cancel(botTimer)
      botTimer = nil
    end
  end
  
  botPlayer.cleanBot = cleanBot
  
  local function inGoal()
    if gameFunction and botPlayer and gameState == 1 and composer.data.gameInfo.gameType == 0 then
      local event = {}
      event[1] = "15"
      event[2] = botPlayer.id
      event[3] = ""
      event[4] = system.getTimer() - systemStartTime
      gameFunction(event)
    end
    gameState = 2
    if botTimer then
      timer.cancel(botTimer)
      botTimer = nil
    end
  end
  
  local function forceInGoal(time)
    local event = {}
    event[1] = "15"
    event[2] = botPlayer.id
    event[3] = ""
    event[4] = time
    gameFunction(event)
    gameState = 2
    if botTimer then
      timer.cancel(botTimer)
      botTimer = nil
    end
  end
  
  botPlayer.inGoal = inGoal
  botPlayer.forceInGoal = forceInGoal
  return botPlayer
end

M.new = new
return M
