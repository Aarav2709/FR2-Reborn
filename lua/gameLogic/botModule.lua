local M = {}

local function new(player)
  local composer = require("composer")
  local botPlayer = {}
  local botTimer, roofDontJump, prevY, prevX, noJumpTimer, gameFunction, gameState, counter, systemStartTime, btnPowerUpPress
  local speedFactor = 1

  -- Offline races: a bot that falls behind you runs a little faster (up to 12%), one far
  -- ahead eases off a little (up to 5%), so races stay close like against real players.
  local function updateCatchUp()
    local me = composer.mainPlayer
    if not botPlayer.setBotSpeedFactor or composer.data.gameInfo.gameType ~= 0 then
      return
    end
    local target = 1
    if me and me ~= botPlayer and me.x and botPlayer.x then
      local behind = me.x - botPlayer.x
      if behind > 100 then
        target = 1 + math.min(0.12, (behind - 100) / 2500)
      elseif behind < -400 then
        target = 1 - math.min(0.05, (-behind - 400) / 4000)
      end
    end
    speedFactor = speedFactor + (target - speedFactor) * 0.2
    botPlayer.setBotSpeedFactor(speedFactor)
  end

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
        -- Back off and hop (a one-step push of the original 30 fps game).
        botPlayer:applyLinearImpulse(-400 / 30, -200 / 30, botPlayer.x, botPlayer.y)
      end
    end
  end

  local function jumpAgain()
    roofDontJump = false
    prevY = 999999
  end

  local function jump(wall)
    if botPlayer.canJump() then
      -- A wall jump that didn't gain height means a roof is overhead: wait a bit.
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
      if 0 < vx and gameState == 0 then
        gameState = 1
      end
      -- Slowed by a wall or a step: jump it before stopping. Otherwise hop now and then.
      if vx < 120 then
        if gameState == 1 and not roofDontJump then
          jump(true)
          noJumpTimer = 0
        end
      elseif math.random() > 0.975 then
        if gameState == 1 and not roofDontJump then
          jump()
          noJumpTimer = 0
        end
      else
        noJumpTimer = noJumpTimer + 1
      end
      if noJumpTimer == 6 then
        prevY = 999999
      end
      if 12 < #prevX then
        table.remove(prevX)
      end
      if gameState == 1 then
        updateCatchUp()
      end
      if gameState == 1 and 10 < counter then
        if botPlayer.canJump() then
          table.insert(prevX, 1, botPlayer.x)
        end
        counter = 0
        usePowerUp()
      end
      counter = counter + 1
      if counter % 2 == 0 then
        checkIfStuck()
      end
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
      -- Ten checks a second (the original's five let bots run into every wall).
      botTimer = timer.performWithDelay(100, updateBot, 0)
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
