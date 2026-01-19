local composer = require("composer")
local friendlyHelper = require("lua.modules.friendlyHelper")
local random = math.random
local powerUps
local exitButtonAlpha = 0.3
local onboardingSteps
local helperMonsterData = {
  101,
  0,
  0,
  0,
  0,
  0,
  0
}
local helperMonsterWithGlassesData = {
  101,
  0,
  0,
  402,
  0,
  0,
  0
}
local timer1, timer2, timer3, timer4, timer5, timer6, timer7, timer8, timer9, timer10
composer.onboarding = {}
composer.onboarding.settingsOverride = false
composer.contextualOnboarding = {}
local greenArrow = "images/game/arrow.png"
local redArrow = "images/game/skull.png"

function composer.onboarding.checkOnboardingStatus()
  local onboardingIntroActive = composer.database.introOnboardingIsActive()
  onboardingIntroActive = false
  if onboardingIntroActive then
    composer.onboarding.activate()
    composer.contextualOnboarding.activate()
    local introStep = composer.database.getOnboardingIntroPart()
    composer.onboarding.setStep(composer.onboarding.getNextStep(introStep))
  end
  if composer.onboarding.settingsOverride then
    composer.onboarding.activate()
  end
end

function composer.onboarding.init()
  composer.onboarding.createOnboardingSteps()
  composer.onboarding.botnames = {
    [105] = {
      [0] = "Sheep",
      [214] = "Wolf"
    },
    [104] = {
      [0] = "Tiger"
    }
  }
  composer.onboarding.isActive = false
  composer.onboarding.isPaused = false
  composer.onboarding.stepData = {
    ["1"] = {
      powerUpTutorial = false,
      endAtTileX = 81,
      fadeOut = false,
      hasJumped = false
    },
    ["3"] = {
      endAtTileX = 70,
      fadeOut = false,
      usedSawblade = false
    },
    ["5"] = {endAtTileX = 93, fadeOut = false},
    ["7"] = {endAtTileX = 58, fadeOut = false},
    ["9"] = {
      shieldPowerUpTutorial = false,
      balloonPowerUpTutorial = false,
      botUsedShield = false,
      movedBots = false,
      endAtTileX = 106,
      fadeOut = false,
      placedTrap1 = false,
      placedTrap2 = false,
      placedTrap3 = false,
      placedTrap4 = false,
      placedTrap5 = false,
      placedTrap6 = false
    },
    ["11"] = {endAtTileX = 93, fadeOut = false},
    ["13"] = {
      usedShieldOnce = false,
      usedShieldTwice = false,
      endAtTileX = 119,
      fadeOut = false,
      resetPU = false,
      usedHunter = false,
      usedJetpack = false
    },
    ["15"] = {endAtTileX = 123, fadeOut = false},
    ["17"] = {endAtTileX = 68, fadeOut = false},
    ["21"] = {
      usedShieldOnce = false,
      usedShieldTwice = false,
      endAtTileX = 81,
      fadeOut = false,
      usedMagnet = false,
      usedLightning = false
    },
    ["25"] = {
      categoryArrow = nil,
      iconArrow = nil,
      homeArrow = nil
    }
  }
  composer.onboarding.guiReferences = {}
  composer.onboarding.ingameTextArray = {}
  composer.contextualOnboarding.isActive = false
  composer.contextualOnboarding.stepData = {
    ["2"] = {
      description = "Display arrow on play buttons, until reached 3 games",
      numberOfGamesBeforeStore = 3,
      playArrow = nil,
      quickPlayArrow = nil
    },
    ["3"] = {
      description = "After first game, show friendly helper explaining gold"
    }
  }
end

function composer.contextualOnboarding.isPartActive(part)
  return composer.database.onboardingPartIsActive(part)
end

function composer.contextualOnboarding.setPartDone(part)
  return composer.database.setOnboardingPartDone(part)
end

function composer.contextualOnboarding.firstGameCompleted(screenGroup)
  friendlyHelper.createMessage("You've just completed your first online race. Look, you won coins! The better you play, the more coins you get!", screenGroup, helperMonsterData, false)
end

function composer.contextualOnboarding.onGotSomeCoins(screenGroup)
  friendlyHelper.createMessage("You're getting some serious coinage. Go to the shop to check out what you can buy!", screenGroup, helperMonsterData, false)
end

local function getTileXPos(xTile)
  return xTile * 160 * 0.5
end

local function getTileYPos(yTile)
  return yTile * 100 * 0.5
end

local function usePowerUp(player, id, powerUpId)
  if not powerUps then
    powerUps = require("lua.gameLogic.powerUps")
  end
  powerUps.usePowerUp(powerUpId, id, nil, player, 0, 0, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
end

local function createArrowImage(arrowPath)
  local arrowTutorialImage = display.newImageRect(arrowPath, 140, 210)
  arrowTutorialImage.anchorX = 1
  arrowTutorialImage.anchorY = 1
  arrowTutorialImage.xScale = 0.5
  arrowTutorialImage.yScale = 0.5
  arrowTutorialImage.x = 480
  arrowTutorialImage.y = 240
  arrowTutorialImage.alpha = 0
  composer.onboarding.arrowTutorialImage = arrowTutorialImage
  return arrowTutorialImage
end

local function animateArrow(arrowTutorialImage, down, dy)
  if arrowTutorialImage then
    dy = -dy
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition",
      delta = true,
      y = dy,
      time = 750,
      onComplete = function()
        animateArrow(arrowTutorialImage, not down, dy)
      end
    })
  end
end

local function animateSkull(fadeIn, skullImage)
  local function nextStep()
    animateSkull(not fadeIn, skullImage)
  end
  
  if skullImage.trapAttachedTo then
    skullImage.x = skullImage.x
    skullImage.y = skullImage.y
  end
  local targetAlpha = 1
  if not fadeIn then
    targetAlpha = 0
  end
  transition.to(skullImage, {
    tag = "tutorialTransition",
    alpha = targetAlpha,
    time = 100,
    onComplete = nextStep
  })
end

local function createSkullImage(dx, dy, trapAttachedTo)
  local skullImage = display.newImageRect("images/game/skull.png", 140, 210)
  skullImage.anchorX = 0.5
  skullImage.anchorY = 0.5
  skullImage.xScale = 0.25
  skullImage.yScale = 0.25
  skullImage.x = trapAttachedTo.x + dx
  skullImage.y = trapAttachedTo.y + dy
  skullImage.alpha = 0
  skullImage.trapAttachedTo = trapAttachedTo
  animateSkull(true, skullImage)
  composer.onboarding.ingameDisplayGroup:insert(skullImage)
  return skullImage
end

local function getLastPowerUpCreated()
  local powerUpList = powerUps.getPowerUps()
  local powerUp = powerUpList[#powerUpList]
  return powerUp
end

local function blackFadeOut(group, onComplete)
  local blackImage = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  blackImage.anchorX = 0
  blackImage.anchorY = 0
  blackImage:setFillColor(0, 0, 0, 1)
  blackImage.x = 0
  blackImage.y = 0
  blackImage.alpha = 0
  group:insert(blackImage)
  transition.to(blackImage, {
    tag = "tutorialTransition" .. composer.onboarding.activatedPart,
    alpha = 1,
    time = 250,
    onComplete = onComplete
  })
end

local function blackFadeIn(group, onComplete)
  local blackImage = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  blackImage.anchorX = 0
  blackImage.anchorY = 0
  blackImage:setFillColor(0, 0, 0, 1)
  blackImage.x = 0
  blackImage.y = 0
  blackImage.alpha = 1
  group:insert(blackImage)
  transition.to(blackImage, {
    tag = "tutorialTransition2" .. composer.onboarding.activatedPart,
    alpha = 0,
    time = 250,
    onComplete = onComplete
  })
end

local function moveCharacterIn(player, startX, startY, endX, endY, time)
  local function doneMovingIn()
    composer.onboarding.doneMovingIn = true
    
    if player.id == 5 then
      player.playAnimation("sad", true, false)
    else
      player.playAnimation("idle", true, true)
      player.resetBones()
    end
  end
  
  player.playAnimation("run", true, true)
  player.x = startX
  player.y = startY
  transition.to(player, {
    tag = "tutorialTransition",
    x = endX,
    y = endY,
    time = time,
    onComplete = doneMovingIn
  })
end

local function addTutorialText(xTile, yTile, text, delay, size)
  local jumpText = composer.onboarding.ingameTextArray
  jumpText[#jumpText + 1] = composer.onboarding.insertTextIntoWorld(xTile, yTile, text, delay, size)
end

local function showJumpArrowOnce(step, delay)
  local arrowTutorialImage = composer.onboarding.arrowTutorialImage
  arrowTutorialImage = arrowTutorialImage or createArrowImage(greenArrow)
  if arrowTutorialImage then
    arrowTutorialImage.anchorX = 1
    arrowTutorialImage.anchorY = 1
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      x = 480,
      y = 240,
      alpha = 0,
      time = 1,
      delay = delay
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      alpha = 1,
      time = 100,
      delay = delay + 1
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      y = 260,
      transition = easing.outBounce,
      time = 350,
      delay = delay + 100
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      alpha = 0,
      time = 150,
      delay = delay + 450
    })
  end
end

local function showJumpArrowContinuous()
  local arrowTutorialImage = createArrowImage(greenArrow)
  arrowTutorialImage.anchorX = 1
  arrowTutorialImage.anchorY = 1
  arrowTutorialImage.alpha = 1
  arrowTutorialImage.x = 480
  animateArrow(arrowTutorialImage, true, -30)
end

local function showPowerUpArrowOnce(step, delay)
  local arrowTutorialImage = composer.onboarding.arrowTutorialImage
  arrowTutorialImage = arrowTutorialImage or createArrowImage(greenArrow)
  if arrowTutorialImage then
    arrowTutorialImage.anchorX = 1
    arrowTutorialImage.anchorY = 1
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      x = 70,
      y = 240,
      alpha = 0,
      time = 1,
      delay = delay
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      alpha = 1,
      time = 100,
      delay = delay + 1
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      y = 260,
      transition = easing.outBounce,
      time = 350,
      delay = delay + 100
    })
    transition.to(arrowTutorialImage, {
      tag = "tutorialTransition" .. step,
      alpha = 0,
      time = 150,
      delay = delay + 450
    })
  end
end

local function showPowerUpArrowContinuous()
  local arrowTutorialImage = createArrowImage(greenArrow)
  arrowTutorialImage.anchorX = 1
  arrowTutorialImage.anchorY = 1
  arrowTutorialImage.alpha = 1
  arrowTutorialImage.x = 70
  animateArrow(arrowTutorialImage, true, -30)
end

function composer.onboarding.insertArrow(reference, x, y, scaleX, scaleY, arrowPath)
  composer.onboarding.clean()
  local arrowTutorialImage = createArrowImage(arrowPath)
  arrowTutorialImage.x = x
  arrowTutorialImage.y = y
  arrowTutorialImage.anchorX = 0.5
  arrowTutorialImage.anchorY = 1
  arrowTutorialImage.alpha = 1
  if reference and 0 < #reference then
    for i = 1, #reference do
      if reference[i] and reference[i].insert then
        reference[i]:insert(arrowTutorialImage)
      end
    end
  end
  arrowTutorialImage.xScale = 0.01
  arrowTutorialImage.yScale = 0.01
  transition.to(arrowTutorialImage, {
    tag = "tutorialTransition",
    xScale = scaleX * 0.5,
    yScale = scaleY * 0.5,
    time = 500,
    transition = easing.outBounce,
    delay = 0
  })
  animateArrow(arrowTutorialImage, true, -20)
  return arrowTutorialImage
end

function composer.onboarding.showMarketArrow()
  composer.onboarding.stepData["25"].categoryArrow = composer.onboarding.insertArrow(composer.onboarding.guiReferences.market_glasses, 45, 0, 1, 1, greenArrow)
end

function composer.onboarding.removeCategoryArrow()
  if composer.onboarding.stepData["25"].categoryArrow then
    composer.onboarding.stepData["25"].categoryArrow:removeSelf()
    composer.onboarding.stepData["25"].categoryArrow = nil
  end
end

function composer.onboarding.showMarketHomeArrow()
  composer.onboarding.showReferences("marketplace_back")
  composer.onboarding.stepData["25"].homeArrow = composer.onboarding.insertArrow(composer.onboarding.guiReferences.marketplace_back, 50, 250, 1, 1, greenArrow)
end

function composer.onboarding.showGlassesArrow()
  composer.onboarding.stepData["25"].iconArrow = composer.onboarding.insertArrow(composer.onboarding.guiReferences.market_glasses_icon, 45, 30, 0.45, 0.45, redArrow)
end

function composer.onboarding.removeIconArrow()
  local arrow = composer.onboarding.stepData["25"].iconArrow
  if arrow and arrow.removeSelf then
    arrow:removeSelf()
    arrow = nil
    friendlyHelper.createMessage("Man I look good! Let's race some more with the new glasses!", composer.onboarding.screenDisplayGroup, helperMonsterWithGlassesData, false)
    friendlyHelper.setOnCloseFunction(composer.onboarding.showMarketHomeArrow)
  end
end

function composer.contextualOnboarding.showPlayArrow()
  composer.contextualOnboarding.stepData["2"].playArrow = composer.onboarding.insertArrow(composer.onboarding.guiReferences.mainMenu_playButton, 240, 152, 1, 1, greenArrow)
end

function composer.contextualOnboarding.hidePlayArrow()
  if composer.contextualOnboarding.stepData["2"].playArrow and composer.contextualOnboarding.stepData["2"].playArrow.removeSelf then
    composer.contextualOnboarding.stepData["2"].playArrow:removeSelf()
    composer.contextualOnboarding.stepData["2"].playArrow = nil
  end
end

function composer.contextualOnboarding.showQuickPlayArrow()
  composer.contextualOnboarding.stepData["2"].quickPlayArrow = composer.onboarding.insertArrow(composer.onboarding.guiReferences.playMenu_quickPlay, 240, 122, 1, 1, greenArrow)
end

function composer.contextualOnboarding.hideQuickPlayArrow()
  if composer.contextualOnboarding.stepData["2"].quickPlayArrow and composer.contextualOnboarding.stepData["2"].quickPlayArrow.removeSelf then
    composer.contextualOnboarding.stepData["2"].quickPlayArrow:removeSelf()
    composer.contextualOnboarding.stepData["2"].quickPlayArrow = nil
  end
end

local function onboardStepChecker(step, x, xRequirement, text, delay, tileX, tileY, size)
  if xRequirement <= x then
    if text == "JUMP!" then
      if composer.onboarding.activatedPart == "7" then
        if composer.onboarding.playerReferences[1].y > getTileYPos(7) then
          showJumpArrowOnce(step, delay)
        end
      else
        showJumpArrowOnce(step, delay)
      end
    end
    addTutorialText(tileX, tileY, text, delay, size)
    return true
  end
  return false
end

local function sawbladeChallengeBotAI(livePlayer, bot, index)
  local botIsInactive = bot.booleanStates.playerDead or bot.booleanStates.playerInvulnerable
  local vx, vy = bot.getLinearVelocityOnPlayer()
  local x, y = bot.getPlayerPositionInWorld()
  local liveX, liveY = livePlayer.getPlayerPositionInWorld()
  if botIsInactive then
    bot.setLinearVelocityOnPlayer(0, vy)
    return
  end
  if vx < 0 then
    return
  end
  local xDiff = liveX - x
  if xDiff < 0 then
    local minDist = -50 - index * 50
    if xDiff < minDist then
      local maxDist = -400
      if xDiff < maxDist then
        xDiff = maxDist
      end
      local speedFactor = 1 - (xDiff - minDist) / (maxDist - minDist)
      bot.setLinearVelocityOnPlayer(60 + 300 * speedFactor, vy)
    else
      bot.setLinearVelocityOnPlayer(350, vy)
    end
  else
    local spawnMaxX = getTileXPos(64)
    if composer.onboarding.activatedPart == "21" then
      spawnMaxX = getTileXPos(68)
    elseif composer.onboarding.activatedPart == "13" then
      spawnMaxX = getTileXPos(58)
    end
    if 225 < xDiff and liveX <= spawnMaxX then
      local newX = liveX + 300 + random(100, 200)
      if composer.onboarding.activatedPart == "13" then
        bot.setPlayerPositionInWorld(newX, getTileYPos(21))
      else
        bot.setPlayerPositionInWorld(newX, 25)
      end
    else
      bot.setLinearVelocityOnPlayer(0, vy)
    end
  end
end

local function trapperBotAI(livePlayer, bot, index)
  local botIsInactive = bot.booleanStates.playerDead or bot.booleanStates.playerInvulnerable
  local vx, vy = bot.getLinearVelocityOnPlayer()
  local x, y = bot.getPlayerPositionInWorld()
  local liveX, liveY = livePlayer.getPlayerPositionInWorld()
  if vx < 0 then
    return
  end
  if botIsInactive then
    bot.setLinearVelocityOnPlayer(0, vy)
    return
  end
  local xDiff = liveX - x
  if xDiff < 0 then
    local minDist = -50 - index * 50
    if xDiff < minDist then
      local maxDist = -400
      if xDiff < maxDist then
        xDiff = maxDist
      end
      local speedFactor = 1 - (xDiff - minDist) / (maxDist - minDist)
      bot.setLinearVelocityOnPlayer(60 + 300 * speedFactor, vy)
    else
      bot.setLinearVelocityOnPlayer(350, vy)
    end
  else
    local spawnMaxX = getTileXPos(64)
    if composer.onboarding.activatedPart == "21" then
      spawnMaxX = getTileXPos(123)
    end
    if 200 < xDiff and liveX <= spawnMaxX then
      local newX = liveX + 300 + random(100, 200)
      if composer.onboarding.activatedPart == "13" then
        bot.setPlayerPositionInWorld(newX, getTileYPos(22))
      else
        bot.setPlayerPositionInWorld(newX, 50)
      end
    else
      bot.setLinearVelocityOnPlayer(0, vy)
    end
  end
  if livePlayer.x > getTileXPos(65) and not composer.onboarding.stepData["9"].placedTrap1 then
    powerUps.usePowerUp(8, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(20, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap1 = true
  elseif livePlayer.x > getTileXPos(70) and not composer.onboarding.stepData["9"].placedTrap2 then
    powerUps.usePowerUp(8, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(20, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap2 = true
  elseif livePlayer.x > getTileXPos(75) and not composer.onboarding.stepData["9"].placedTrap3 then
    powerUps.usePowerUp(8, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(20, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap3 = true
  elseif livePlayer.x > getTileXPos(80) and not composer.onboarding.stepData["9"].placedTrap4 then
    powerUps.usePowerUp(2, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(0, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap4 = true
  elseif livePlayer.x > getTileXPos(85) and not composer.onboarding.stepData["9"].placedTrap5 then
    powerUps.usePowerUp(2, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(0, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap5 = true
  elseif livePlayer.x > getTileXPos(89) and not composer.onboarding.stepData["9"].placedTrap6 then
    powerUps.usePowerUp(2, bot.id, nil, nil, x, y, composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
    createSkullImage(0, -40, getLastPowerUpCreated())
    composer.onboarding.stepData["9"].placedTrap6 = true
  end
end

local function shieldChallengeBotAI(livePlayer, bot, index)
  if not livePlayer or not bot then
    return
  end
  local botIsInactive = bot.booleanStates.playerDead or bot.booleanStates.playerInvulnerable
  if botIsInactive then
    return
  end
  local liveX, liveY = livePlayer.getPlayerPositionInWorld()
  local x, y = bot.getPlayerPositionInWorld()
  if x > getTileXPos(16) and index == 1 and not composer.onboarding.stepData["9"].botUsedShield then
    usePowerUp(bot, bot.id, 5)
    composer.onboarding.stepData["9"].botUsedShield = true
  end
  if x > getTileXPos(23) then
    bot.setLinearVelocityOnPlayer(0, 0)
    return
  end
  local diff = liveX - x
  if liveX < getTileXPos(40) and math.abs(diff) <= 200 then
    local vx, vy = bot.getLinearVelocityOnPlayer()
    local targetX = liveX + (index - 2) * 80
    local xDiff = targetX - x
    if 0 < xDiff then
      local maxDist = 250
      if xDiff > maxDist then
        xDiff = maxDist
      end
      local speedFactor = xDiff / maxDist
      local extraSpeed = 50 * speedFactor
      bot.setLinearVelocityOnPlayer(vx + extraSpeed, vy)
    end
  else
    bot.setLinearVelocityOnPlayer(0, 0)
  end
end

local function trapChallengeBotAI(livePlayer, bot, index)
  local botIsInactive = bot.booleanStates.playerDead or bot.booleanStates.playerInvulnerable
  if botIsInactive then
    return
  end
  local liveX, liveY = livePlayer.getPlayerPositionInWorld()
  local x, y = bot.getPlayerPositionInWorld()
  local diff = liveX - x
  local targetX = liveX - index * 25
  local xDiff = targetX - x
  local vx, vy = bot.getLinearVelocityOnPlayer()
  if 0 < xDiff then
    local maxDist = 300
    if xDiff > maxDist then
      xDiff = maxDist
    end
    local speedFactor = xDiff / maxDist
    local extraSpeed = 30 * speedFactor
    if vx + extraSpeed < 450 then
      bot.setLinearVelocityOnPlayer(vx + extraSpeed, vy)
    end
  else
    bot.setLinearVelocityOnPlayer(vx - 1, vy)
  end
  bot.setPowerUp(0)
  if bot.canJump() then
    local vx, vy = bot.getLinearVelocityOnPlayer()
    if random() < 0.05 or math.abs(vx) < 10 then
      bot.jump()
    end
  end
end

local function rubberbandBotAI(livePlayer, bot, index)
  local botIsInactive = bot.booleanStates.playerDead or bot.booleanStates.playerInvulnerable
  if botIsInactive then
    return
  end
  local vx, vy = bot.getLinearVelocityOnPlayer()
  local x, y = bot.getPlayerPositionInWorld()
  local liveX, liveY = livePlayer.getPlayerPositionInWorld()
  local xDiff = x - (liveX + 200)
  local maxDist = 500
  if 0 < xDiff then
    if xDiff > maxDist then
      xDiff = maxDist
    end
    local speedFactor = xDiff / maxDist
    local speedToHave = 50 + 300 * speedFactor
    local newSpeedX = vx - (vx - speedToHave) * 0.1
    bot.setLinearVelocityOnPlayer(newSpeedX, vy)
  elseif liveX <= getTileXPos(composer.onboarding.stepData[composer.onboarding.activatedPart].endAtTileX) * 0.9 then
    xDiff = liveX - x
    if maxDist < xDiff then
      xDiff = maxDist
    end
    local speedFactor = xDiff / maxDist
    local speedToAdd = 50 * speedFactor
    local newSpeedX = vx + speedToAdd * 0.1
    bot.setLinearVelocityOnPlayer(newSpeedX, vy)
  end
end

local function getBotName(charID, skinID)
  local name = composer.onboarding.botnames[charID][skinID]
  name = name or ""
  return name
end

function composer.onboarding.createOnboardingSteps()
  onboardingSteps = {
    ["0"] = {next = "1"},
    ["1"] = {
      description = "Starting Onboarding, Jump & Power box tutorial",
      ingame = true,
      walkIn = true,
      overrideAI = function()
        return true
      end,
      overrideCountdown = true,
      mapId = 1000,
      preLoad = function()
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("jump")
        composer.onboarding.hideReferences("powerUp")
        composer.onboarding.hideReferences("killMessages")
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.hideReferences("exit")
        composer.onboarding.playerReferences[1].setPowerUp(0)
      end,
      onGameUpdate = function(livePlayer)
        local function getXTileForStep(step)
          if step == 0 then
            return 26
          elseif step == 1 then
            return 31
          elseif step == 2 then
            return 36
          elseif step == 3 then
            return 48
          elseif step == 4 then
            return 58
          elseif step == 5 then
            return 60
          else
            return 999
          end
        end
        
        local function getDelayForStep(step)
          if step == 10 then
            return 500
          elseif step == 11 then
            return 1000
          elseif step == 12 then
            return 1500
          else
            return 0
          end
        end
        
        local function getYTileForStep(step)
          if step == 3 then
            return 5
          elseif step == 4 then
            return 8
          elseif step == 5 then
            return 9
          elseif step == 6 or step == 7 or step == 8 then
            return 10
          else
            return 3
          end
        end
        
        local function getTextForStep(step)
          if step == 4 then
            return "1. GET POWER UP"
          elseif step == 5 then
            return "2. USE POWER UP"
          else
            return "JUMP!"
          end
        end
        
        local function getXRequirementForStep(step)
          if step == 3 then
            return (getXTileForStep(step) - 3) * 160 * 0.5
          else
            return (getXTileForStep(step) - 2) * 160 * 0.5
          end
        end
        
        local step = #composer.onboarding.ingameTextArray
        onboardStepChecker(step, livePlayer.x, getXRequirementForStep(step), getTextForStep(step), getDelayForStep(step), getXTileForStep(step), getYTileForStep(step), 30)
        if livePlayer.x > getTileXPos(19) and step == 0 then
          composer.onboarding.showReferences("jump")
          composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        end
        if livePlayer.x > getTileXPos(58) and not composer.onboarding.stepData["1"].powerUpTutorial then
          composer.onboarding.showReferences("powerUp")
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
          composer.onboarding.stepData["1"].powerUpTutorial = true
        end
        if livePlayer.x > getTileXPos(25) then
          for i = 2, #composer.onboarding.playerReferences do
            composer.onboarding.playerReferences[i].setLinearVelocityOnPlayer(0, 0)
          end
        end
        if livePlayer.x > getTileXPos(36.15) and not composer.onboarding.stepData["1"].hasJumped and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showJumpArrowContinuous()
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["1"].endAtTileX) and not composer.onboarding.stepData["1"].fadeOut then
          local function onClose()
            blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          end
          
          friendlyHelper.createMessage([[
Wow, you're fast!
Welcome to Fun Run 2.
Let's have some fun!]], composer.onboarding.screenDisplayGroup, helperMonsterData)
          friendlyHelper.setOnCloseFunction(onClose)
          composer.onboarding.stepData["1"].fadeOut = true
        end
      end,
      powerBoxFunction = function()
        return 4
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      scene = "lua.scenes.gamePlay",
      next = "3"
    },
    ["2"] = {
      description = "First post game scene, Friendly helper",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
        friendlyHelper.createMessage([[
Wow, you're fast!
Welcome to Fun Run 2, I am your friendly helper. Let's have some fun!]], composer.onboarding.screenDisplayGroup, helperMonsterData)
      end,
      next = "3"
    },
    ["3"] = {
      description = "Sawblade challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1001,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        return 1
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      overrideAI = function()
        return true
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("jump")
        composer.onboarding.hideReferences("killMessages")
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX + 350 + (i - 2) * 60
        end
      end,
      onGameUpdate = function(livePlayer)
        for i = 2, #composer.onboarding.playerReferences do
          sawbladeChallengeBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
          composer.onboarding.playerReferences[i].setPowerUp(0)
          if composer.onboarding.playerReferences[i].canJump() and random() < 0.1 then
            composer.onboarding.playerReferences[i].jump()
          end
        end
        if livePlayer.x > getTileXPos(30) and not composer.onboarding.stepData["3"].usedSawblade and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["3"].endAtTileX) and not composer.onboarding.stepData["3"].fadeOut then
          blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          composer.onboarding.stepData["3"].fadeOut = true
        end
      end,
      next = "21"
    },
    ["4"] = {
      description = "Sawblade challenge post game scene",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "5"
    },
    ["5"] = {
      description = "First Race",
      ingame = true,
      walkIn = false,
      overrideCountdown = false,
      mapId = 2000,
      rubberband = true,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function(playerId)
        local powerUps = {
          1,
          4,
          7,
          3
        }
        local randomPowerUpIndex = random(1, #powerUps)
        return powerUps[randomPowerUpIndex]
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = nil
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("killMessages")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(1)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(0)
      end,
      next = "6"
    },
    ["6"] = {
      description = "First Race",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_market")
      end,
      next = "7"
    },
    ["7"] = {
      description = "Wall climb challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1002,
      overrideAI = function()
        return true
      end,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        return 4
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = nil
        composer.data.gameInfo.players[3] = nil
        composer.data.gameInfo.players[4] = nil
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
      end,
      onGameUpdate = function(livePlayer)
        local function getXTileForStep(step)
          if step == 0 or step == 1 or step == 2 or step == 3 then
            return 19
          elseif step == 4 then
            return 24
          elseif step == 5 then
            return 30
          elseif step == 6 or step == 7 or step == 8 then
            return 42
          else
            return 999
          end
        end
        
        local function getDelayForStep(step)
          if step == 1 or step == 7 then
            return 500
          elseif step == 2 or step == 8 then
            return 1000
          elseif step == 3 then
            return 1500
          else
            return 0
          end
        end
        
        local function getYTileForStep(step)
          if step == 0 then
            return 15
          elseif step == 1 then
            return 13
          elseif step == 2 then
            return 11
          elseif step == 3 then
            return 9
          elseif step == 4 then
            return 9
          elseif step == 5 then
            return 9
          elseif step == 6 then
            return 14
          elseif step == 7 then
            return 12
          elseif step == 8 then
            return 10
          else
            return 999
          end
        end
        
        local function getTextForStep(step)
          return "JUMP!"
        end
        
        local function getXRequirementForStep(step)
          if step == 6 then
            return (getXTileForStep(step) - 3) * 160 * 0.5
          else
            return (getXTileForStep(step) - 2) * 160 * 0.5
          end
        end
        
        local step = #composer.onboarding.ingameTextArray
        onboardStepChecker(step, livePlayer.x, getXRequirementForStep(step), getTextForStep(step), getDelayForStep(step), getXTileForStep(step), getYTileForStep(step), 30)
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["7"].endAtTileX) and not composer.onboarding.stepData["7"].fadeOut then
          blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          composer.onboarding.stepData["7"].fadeOut = true
        end
      end,
      next = "9"
    },
    ["8"] = {
      description = "Wall climb post lobby",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "9"
    },
    ["9"] = {
      description = "Shield challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1003,
      overrideAI = function()
        return true
      end,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        if composer.onboarding.playerReferences[1].x < getTileXPos(34) then
          return 5
        elseif composer.onboarding.playerReferences[1].x < getTileXPos(63) then
          return 6
        else
          return 1
        end
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("killMessages")
        composer.onboarding.hideReferences("jump")
        composer.onboarding.hideReferences("powerUp")
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(0)
        composer.onboarding.playerReferences[4].setPowerUp(0)
        local startTileX = getTileXPos(5)
        local startTileY = getTileYPos(7)
        composer.onboarding.playerReferences[2].x = startTileX
        composer.onboarding.playerReferences[2].y = startTileY
        composer.onboarding.playerReferences[3].x = startTileX + 80
        composer.onboarding.playerReferences[3].y = startTileY
        composer.onboarding.playerReferences[4].x = startTileX + 160
        composer.onboarding.playerReferences[4].y = startTileY
        if not powerUps then
          powerUps = require("lua.gameLogic.powerUps")
        end
        local livePlayer = composer.onboarding.playerReferences[1]
        powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(10), getTileYPos(7), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
        createSkullImage(0, -20, getLastPowerUpCreated())
        powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(15), getTileYPos(7), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
        createSkullImage(0, -20, getLastPowerUpCreated())
        powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(20), getTileYPos(7), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
        createSkullImage(0, -20, getLastPowerUpCreated())
        powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(48), getTileYPos(9), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
        createSkullImage(0, -20, getLastPowerUpCreated())
      end,
      onGameUpdate = function(livePlayer)
        local function getXTileForStep(step)
          if step == 0 then
            return 29
          elseif step == 1 then
            return 42
          else
            return 999
          end
        end
        
        local function getDelayForStep(step)
          return 0
        end
        
        local function getYTileForStep(step)
          return 10
        end
        
        local function getTextForStep(step)
          if step == 0 then
            return "SHIELD PROTECTS YOU!"
          elseif step == 1 then
            return "BALLOON TAKES ONE HIT!"
          end
        end
        
        local function getXRequirementForStep(step)
          return (getXTileForStep(step) - 2) * 160 * 0.5
        end
        
        local step = #composer.onboarding.ingameTextArray
        local reachedStep = onboardStepChecker(step, livePlayer.x, getXRequirementForStep(step), getTextForStep(step), getDelayForStep(step), getXTileForStep(step), getYTileForStep(step), 20)
        if (step == 0 or step == 1) and reachedStep then
          if not powerUps then
            powerUps = require("lua.gameLogic.powerUps")
          end
          local livePlayer = composer.onboarding.playerReferences[1]
          if step == 0 then
            powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(35), getTileYPos(9), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
            createSkullImage(0, -20, getLastPowerUpCreated())
            powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(37), getTileYPos(9), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
            createSkullImage(0, -20, getLastPowerUpCreated())
          elseif step == 1 then
            powerUps.usePowerUp(2, livePlayer.id, nil, nil, getTileXPos(61), getTileYPos(9), composer.onboarding.ingameDisplayGroup, composer.onboarding.screenDisplayGroup, composer.onboarding.playerReferences)
            createSkullImage(0, -20, getLastPowerUpCreated())
          end
        end
        if livePlayer.x < getTileXPos(65) then
          for i = 2, #composer.onboarding.playerReferences do
            shieldChallengeBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
            composer.onboarding.playerReferences[i].setPowerUp(0)
          end
        end
        if livePlayer.x > getTileXPos(27.25) and not composer.onboarding.stepData["9"].powerUpTutorial then
          composer.onboarding.showReferences("powerUp")
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
          composer.onboarding.stepData["9"].powerUpTutorial = true
          composer.onboarding.showReferences("jump")
        end
        if livePlayer.x > getTileXPos(40.25) and not composer.onboarding.stepData["9"].balloonPowerUpTutorial then
          composer.onboarding.showReferences("powerUp")
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
          composer.onboarding.stepData["9"].balloonPowerUpTutorial = true
        end
        if livePlayer.x > getTileXPos(65) and not composer.onboarding.stepData["9"].movedBots then
          composer.onboarding.playerReferences[2].x = getTileXPos(69)
          composer.onboarding.playerReferences[2].y = livePlayer.y
          composer.onboarding.playerReferences[2].setLinearVelocityOnPlayer(0, 0)
          composer.onboarding.stepData["9"].movedBots = true
        end
        if livePlayer.x > getTileXPos(65) then
          trapperBotAI(livePlayer, composer.onboarding.playerReferences[2], 1)
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["9"].endAtTileX) and not composer.onboarding.stepData["9"].fadeOut then
          blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          composer.onboarding.stepData["9"].fadeOut = true
        end
      end,
      next = "11"
    },
    ["10"] = {
      description = "Shield post lobby",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "11"
    },
    ["11"] = {
      description = "Second Race",
      ingame = true,
      walkIn = false,
      overrideCountdown = false,
      mapId = 2001,
      rubberband = true,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        local powerUps = {
          1,
          2,
          3,
          4,
          7,
          8
        }
        local randomPowerUpIndex = random(1, #powerUps)
        return powerUps[randomPowerUpIndex]
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(2)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(4)
        composer.onboarding.playerReferences[4].setPowerUp(0)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX - (i - 1) * 40
          composer.onboarding.playerReferences[i].y = composer.onboarding.playerReferences[1].y
        end
      end,
      next = "12"
    },
    ["12"] = {
      description = "Second Race",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_market")
      end,
      next = "13"
    },
    ["13"] = {
      description = "Jetpack Challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1004,
      overrideAI = function()
        return true
      end,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        if composer.onboarding.playerReferences[1].x < getTileXPos(59) then
          return 9
        else
          return 10
        end
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX + 350 + (i - 2) * 60
          composer.onboarding.playerReferences[i].y = composer.onboarding.playerReferences[1].y
        end
      end,
      onGameUpdate = function(livePlayer)
        for i = 2, #composer.onboarding.playerReferences do
          if composer.onboarding.playerReferences[i].x > getTileXPos(66) then
            composer.onboarding.playerReferences[i].setLinearVelocityOnPlayer(0, 0)
          else
            sawbladeChallengeBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
            composer.onboarding.playerReferences[i].setPowerUp(0)
            if livePlayer.x > getTileXPos(32) and composer.onboarding.playerReferences[i].id == 2 and not composer.onboarding.stepData["13"].usedShieldOnce then
              usePowerUp(composer.onboarding.playerReferences[i], composer.onboarding.playerReferences[i].id, 5)
              composer.onboarding.stepData["13"].usedShieldOnce = true
            end
            if livePlayer.x > getTileXPos(50) and composer.onboarding.playerReferences[i].id == 3 and not composer.onboarding.stepData["13"].usedShieldTwice then
              usePowerUp(composer.onboarding.playerReferences[i], composer.onboarding.playerReferences[i].id, 5)
              composer.onboarding.stepData["13"].usedShieldTwice = true
            end
          end
        end
        if livePlayer.x > getTileXPos(59) and not composer.onboarding.stepData["13"].resetPU then
          livePlayer.setPowerUp(0)
          composer.onboarding.stepData["13"].resetPU = true
        end
        if livePlayer.x >= getTileXPos(25) and not composer.onboarding.stepData["13"].usedHunter and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
        end
        if livePlayer.x >= getTileXPos(66) and not composer.onboarding.stepData["13"].usedJetpack and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["13"].endAtTileX) and not composer.onboarding.stepData["13"].fadeOut then
          blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          composer.onboarding.stepData["13"].fadeOut = true
        end
      end,
      next = "15"
    },
    ["14"] = {
      description = "Jetpack post lobby",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "15"
    },
    ["15"] = {
      description = "Third Race",
      ingame = true,
      walkIn = false,
      overrideCountdown = false,
      mapId = 2002,
      rubberband = true,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        local powerUps = {
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10
        }
        local randomPowerUpIndex = random(1, #powerUps)
        return powerUps[randomPowerUpIndex]
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(10)
        composer.onboarding.playerReferences[2].setPowerUp(4)
        composer.onboarding.playerReferences[3].setPowerUp(4)
        composer.onboarding.playerReferences[4].setPowerUp(5)
      end,
      next = "16"
    },
    ["16"] = {
      description = "Third Race",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_market")
        
        local function closePrizeOverlay()
          friendlyHelper.createMessage("Cool! Let's put them on.", composer.onboarding.screenDisplayGroup, helperMonsterData, false)
        end
        
        local function showPrize()
          local options = {
            isModal = true,
            params = {
              item = composer.storeConfig.getItem(402),
              freeItem = true,
              onCloseFunction = closePrizeOverlay
            }
          }
          options.params.item.imagePath = "images/gui/market/items/facewear/402.png"
          composer.showOverlay("lua.overlays.marketFree", options)
        end
        
        friendlyHelper.createMessage("Congratulations! You've just completed your first three races!", composer.onboarding.screenDisplayGroup, helperMonsterData, false)
        friendlyHelper.setOnCloseFunction(showPrize)
      end,
      next = "25"
    },
    ["17"] = {
      description = "Trap challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1005,
      overrideAI = function()
        return true
      end,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        if composer.onboarding.playerReferences[1].x < getTileXPos(34) then
          return 8
        else
          return 2
        end
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(0)
        composer.onboarding.playerReferences[4].setPowerUp(6)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX - (i - 1) * 40
          composer.onboarding.playerReferences[i].y = composer.onboarding.playerReferences[1].y
        end
      end,
      onGameUpdate = function(livePlayer)
        for i = 2, #composer.onboarding.playerReferences do
          trapChallengeBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["17"].endAtTileX) and not composer.onboarding.stepData["17"].fadeOut then
          blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          composer.onboarding.stepData["17"].fadeOut = true
        end
      end,
      next = "11"
    },
    ["18"] = {
      description = "Trap challenge post game scene",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "19"
    },
    ["19"] = {
      description = "Fourth Race",
      ingame = true,
      walkIn = false,
      overrideCountdown = false,
      mapId = 2003,
      rubberband = true,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        local powerUps = {
          1,
          2,
          4,
          5,
          6,
          8,
          9,
          10
        }
        local randomPowerUpIndex = math.random(1, #powerUps)
        return powerUps[randomPowerUpIndex]
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(2)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(0)
        composer.onboarding.playerReferences[4].setPowerUp(0)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX - (i - 1) * 40
          composer.onboarding.playerReferences[i].y = composer.onboarding.playerReferences[1].y
        end
      end,
      next = "20"
    },
    ["20"] = {
      description = "Fourth Race",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_market")
      end,
      next = "21"
    },
    ["21"] = {
      description = "Lightning challenge",
      ingame = true,
      walkIn = true,
      overrideCountdown = true,
      mapId = 1006,
      overrideAI = function()
        return true
      end,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        if composer.onboarding.playerReferences[1].x < getTileXPos(44) then
          return 7
        else
          return 3
        end
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.hideReferences("killMessages")
        composer.onboarding.hideReferences("position")
        composer.onboarding.hideReferences("countdown")
        composer.onboarding.hideReferences("bottomBar")
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(0)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(0)
        composer.onboarding.playerReferences[4].setPowerUp(0)
        local startX = composer.onboarding.playerReferences[1].x
        for i = 2, #composer.onboarding.playerReferences do
          composer.onboarding.playerReferences[i].x = startX + 350 + (i - 2) * 60
        end
      end,
      onGameUpdate = function(livePlayer)
        for i = 2, #composer.onboarding.playerReferences do
          sawbladeChallengeBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
          composer.onboarding.playerReferences[i].setPowerUp(0)
          if composer.onboarding.playerReferences[i].canJump() and random() < 0.025 then
            composer.onboarding.playerReferences[i].jump()
          end
        end
        if livePlayer.x >= getTileXPos(35) and not composer.onboarding.stepData["21"].usedMagnet and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
        end
        if livePlayer.x >= getTileXPos(60) and not composer.onboarding.stepData["21"].usedLightning and not composer.onboarding.physicsPaused then
          composer.onboarding.pausePhysics()
          showPowerUpArrowContinuous()
        end
        if livePlayer.x > getTileXPos(composer.onboarding.stepData["21"].endAtTileX) and not composer.onboarding.stepData["21"].fadeOut then
          local function onClose()
            blackFadeOut(composer.onboarding.screenDisplayGroup, composer.onboarding.stepDone)
          end
          
          friendlyHelper.createMessage([[
You got the basics!
Let's have a REAL race!]], composer.onboarding.screenDisplayGroup, helperMonsterData)
          friendlyHelper.setOnCloseFunction(onClose)
          composer.onboarding.stepData["21"].fadeOut = true
        end
      end,
      next = "5"
    },
    ["22"] = {
      description = "Lightning challenge post game scene",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_times")
        composer.onboarding.hideReferences("postlobby_mapName")
      end,
      next = "23"
    },
    ["23"] = {
      description = "Fifth Race",
      ingame = true,
      walkIn = false,
      overrideCountdown = false,
      mapId = 2004,
      rubberband = true,
      scene = "lua.scenes.gamePlay",
      powerBoxFunction = function()
        local powerUps = {
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10
        }
        local randomPowerUpIndex = math.random(1, #powerUps)
        return powerUps[randomPowerUpIndex]
      end,
      setAIBots = function()
        composer.data.gameInfo.players[2] = {
          username = getBotName(105, 0),
          avatar = {
            105,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 1
        }
        composer.data.gameInfo.players[3] = {
          username = getBotName(105, 214),
          avatar = {
            105,
            214,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 2
        }
        composer.data.gameInfo.players[4] = {
          username = getBotName(104, 0),
          avatar = {
            104,
            0,
            0,
            0,
            0,
            0,
            0
          },
          playerId = 3
        }
      end,
      onSetupGameComplete = function()
        composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
        composer.onboarding.playerReferences[1].setPowerUp(3)
        composer.onboarding.playerReferences[2].setPowerUp(0)
        composer.onboarding.playerReferences[3].setPowerUp(5)
        composer.onboarding.playerReferences[4].setPowerUp(0)
      end,
      next = "24"
    },
    ["24"] = {
      description = "Fifth Race",
      scene = "lua.scenes.postLobby",
      skipDB = true,
      postLoad = function()
        composer.onboarding.hideReferences("postlobby_exit")
        composer.onboarding.hideReferences("postlobby_addFriends")
        composer.onboarding.hideReferences("postlobby_chat")
        composer.onboarding.hideReferences("postlobby_market")
      end,
      next = "25"
    },
    ["25"] = {
      description = "Shop scene",
      scene = "lua.scenes.marketplace",
      postLoad = function()
        composer.onboarding.hideReferences("marketplace_back")
        
        local function friendlyHelperCloseFunction2()
          friendlyHelper.createMessage("Click on the 'Glasses' category to see different glasses you can wear", composer.onboarding.screenDisplayGroup, helperMonsterWithGlassesData, false)
        end
        
        local function friendlyHelperCloseFunction()
          friendlyHelper.createMessage("Let's put on the new glasses! Follow the arrows.", composer.onboarding.screenDisplayGroup, helperMonsterData, false)
          friendlyHelper.setOnCloseFunction(composer.onboarding.showMarketArrow)
          return true
        end
        
        friendlyHelper.createMessage("Check out all this stuff!", composer.onboarding.screenDisplayGroup, helperMonsterData, true)
        friendlyHelper.setOnCloseFunction(friendlyHelperCloseFunction)
      end,
      finalStep = true
    }
  }
end

function composer.onboarding.pausePhysics()
  composer.onboarding.physicsPaused = true
  for i = 1, 4 do
    if composer.onboarding.playerReferences[i] then
      composer.onboarding.playerReferences[i].pauseAnimations(true)
    end
  end
  composer.onboarding.physics.pause()
  composer.onboarding.hideReferences("exit")
end

function composer.onboarding.jumpButtonPressed()
  if composer.onboarding.activatedPart == "1" then
    if composer.onboarding.physicsPaused and not composer.onboarding.stepData["1"].hasJumped then
      composer.onboarding.stepData["1"].hasJumped = true
      composer.onboarding.startPhysics()
    elseif not composer.onboarding.stepData["1"].hasJumped then
      composer.onboarding.stepData["1"].hasJumped = true
    end
  end
end

function composer.onboarding.startPhysics()
  if composer.onboarding.arrowTutorialImage then
    composer.onboarding.arrowTutorialImage:removeSelf()
    composer.onboarding.arrowTutorialImage = nil
  end
  if composer.onboarding.activatedPart == "9" and composer.onboarding.playerReferences[1].x < getTileXPos(33) then
    composer.onboarding.hideReferences("powerUp")
  end
  if composer.onboarding.activatedPart == "3" then
    composer.onboarding.stepData["3"].usedSawblade = true
  end
  if composer.onboarding.activatedPart == "21" then
    if composer.onboarding.playerReferences[1].x <= getTileXPos(49) then
      composer.onboarding.stepData["21"].usedMagnet = true
    else
      composer.onboarding.stepData["21"].usedLightning = true
    end
  end
  if composer.onboarding.activatedPart == "13" then
    if composer.onboarding.playerReferences[1].x <= getTileXPos(63) then
      composer.onboarding.stepData["13"].usedHunter = true
    else
      composer.onboarding.stepData["13"].usedJetpack = true
    end
  end
  composer.onboarding.physicsPaused = false
  for i = 1, 4 do
    if composer.onboarding.playerReferences[i] then
      composer.onboarding.playerReferences[i].pauseAnimations(false)
    end
  end
  composer.onboarding.physics.start()
  composer.onboarding.setAlphaForReferences("exit", exitButtonAlpha)
end

local function loadOfflineOnboardingSession(mapId)
  composer.data.gameInfo.players[1] = {
    username = composer.database.getPlayerInformation().username,
    avatar = composer.database.getAvatarData(),
    playerId = composer.database.getPlayerInformation().playerId
  }
  composer.data.gameInfo.gameType = 0
  composer.data.gameInfo.map = mapId
end

function composer.onboarding.isActive()
  return composer.onboarding.isActive
end

function composer.onboarding.activate()
  composer.onboarding.isActive = true
end

function composer.contextualOnboarding.activate()
  composer.contextualOnboarding.isActive = true
end

function composer.onboarding.setStep(step)
  composer.onboarding.activatedPart = step
end

function composer.onboarding.insertTextIntoWorld(tileX, tileY, text, delay, size)
  local textObject = display.newEmbossedText(text, 500, 500, composer.data.font, size)
  local color = {
    highlight = {
      r = 0,
      g = 0,
      b = 0
    },
    shadow = {
      r = 0,
      g = 0,
      b = 0
    }
  }
  textObject:setEmbossColor(color)
  textObject.anchorX = 0.5
  textObject.anchorY = 0.5
  textObject.x = getTileXPos(tileX)
  textObject.y = getTileYPos(tileY)
  textObject.xScale = 0.01
  textObject.yScale = 0.01
  transition.to(textObject, {
    tag = "tutorialTransition",
    xScale = 1.5,
    yScale = 1.5,
    time = 750,
    transition = easing.outElastic,
    delay = delay
  })
  composer.onboarding.ingameDisplayGroup:insert(textObject)
  return textObject
end

function composer.onboarding.setBotCharacters()
  local id = composer.onboarding.activatedPart
  if onboardingSteps[id] and onboardingSteps[id].ingame and onboardingSteps[id].setAIBots then
    onboardingSteps[id].setAIBots()
  end
end

function composer.onboarding.powerBoxFunction(playerId)
  local id = composer.onboarding.activatedPart
  if onboardingSteps[id] and onboardingSteps[id].ingame and onboardingSteps[id].powerBoxFunction then
    return onboardingSteps[id].powerBoxFunction(playerId)
  else
    return 1
  end
end

local function createBlades(displayGroup)
  local bladeImagePath = composer.powerUpImageSheetInfo:getFrameIndex("sawblade")
  local bladeBloodImagePath = composer.powerUpImageSheetInfo:getFrameIndex("sawbladeBloody")
  local bladeImage = display.newImage(composer.powerUpImageSheet, bladeImagePath)
  bladeImage.xScale = 0.5
  bladeImage.yScale = 0.5
  bladeImage.alpha = 1
  local bladeBloodImage = display.newImage(composer.powerUpImageSheet, bladeBloodImagePath)
  bladeBloodImage.xScale = 0.5
  bladeBloodImage.yScale = 0.5
  bladeBloodImage.alpha = 0
  local blade = display.newGroup()
  blade:insert(bladeImage)
  blade:insert(bladeBloodImage)
  displayGroup:insert(blade)
  composer.onboarding.sawbladeGroup = blade
  composer.onboarding.sawblade = bladeImage
  composer.onboarding.sawbladeBlood = bladeBloodImage
end

local function startGame()
  composer.onboarding.intro = false
  composer.onboarding.manualStartFunction()
end

local function transitionToStartGame()
  if composer.onboarding.sawbladeGroup then
    composer.onboarding.sawbladeGroup:removeSelf()
    composer.onboarding.sawbladeGroup = nil
  end
  transition.to(composer.onboarding.ingameDisplayGroup, {
    tag = "tutorialTransition",
    delta = true,
    x = -150,
    time = 500,
    onComplete = startGame
  })
end

local function bounceLogo()
  local logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  logo.x = display.contentWidth * 0.5
  logo.y = display.contentHeight * 0.25
  logo.xScale = 0.01
  logo.yScale = 0.01
  composer.onboarding.screenDisplayGroup:insert(logo)
  transition.to(logo, {
    tag = "tutorialTransition",
    yScale = 1,
    xScale = 1,
    time = 500,
    transition = easing.outBounce
  })
  transition.to(logo, {
    tag = "tutorialTransition",
    alpha = 0,
    time = 500,
    delay = 1500,
    onComplete = transitionToStartGame
  })
  composer.onboarding.playerReferences[1].playSound("lightning_activate")
end

local function introPart2()
  local livePlayer = composer.onboarding.playerReferences[1]
  
  local function switchBlades()
    composer.onboarding.sawblade.alpha = 0
    composer.onboarding.sawbladeBlood.alpha = 1
  end
  
  local function splatterBot(bot)
    local function moveAway()
      bot.x = bot.x - 500
    end
    
    bot.playHitAnimation(1, 1, 1)
    timer10 = timer.performWithDelay(400, moveAway, 1)
  end
  
  local function happy()
    livePlayer.playAnimation("idle", true, true)
    livePlayer.playAnimation("happy", false, false)
  end
  
  local function land()
    livePlayer.playAnimation("idle", true, true)
  end
  
  timer1 = timer.performWithDelay(200, function()
    livePlayer.playAnimation("jump_start", true, true)
  end, 1)
  timer2 = timer.performWithDelay(650, function()
    livePlayer.playAnimation("jump_fall", true, true)
  end, 1)
  local currentPlayerY = livePlayer.y
  local targetPlayerY = currentPlayerY - 100
  transition.to(livePlayer, {
    tag = "tutorialTransition",
    y = targetPlayerY,
    time = 500,
    delay = 500,
    transition = easing.outSine
  })
  transition.to(livePlayer, {
    tag = "tutorialTransition",
    y = currentPlayerY,
    time = 500,
    delay = 1000,
    transition = easing.inSine,
    onComplete = land
  })
  composer.onboarding.sawbladeGroup.x = livePlayer.x - 320
  composer.onboarding.sawbladeGroup.y = getTileYPos(2)
  livePlayer.playSound("blade_activate")
  transition.to(composer.onboarding.sawbladeGroup, {
    tag = "tutorialTransition",
    delta = true,
    x = 540,
    time = 1800
  })
  transition.to(composer.onboarding.sawbladeGroup, {
    tag = "tutorialTransition",
    delta = true,
    rotation = 1500,
    time = 1800
  })
  timer3 = timer.performWithDelay(400, switchBlades, 1)
  timer4 = timer.performWithDelay(400, function()
    livePlayer.playBloodScreen(true)
    splatterBot(composer.onboarding.playerReferences[4])
  end, 1)
  timer5 = timer.performWithDelay(600, function()
    splatterBot(composer.onboarding.playerReferences[3])
  end, 1)
  timer6 = timer.performWithDelay(800, function()
    splatterBot(composer.onboarding.playerReferences[2])
  end, 1)
  timer7 = timer.performWithDelay(1750, bounceLogo, 1)
  timer8 = timer.performWithDelay(1450, function()
    happy()
  end, 1)
end

function composer.onboarding.onSetupGameComplete(playerList, displayGroup, screenDisplayGroup, physics, foreground)
  composer.onboarding.ingameDisplayGroup = displayGroup
  composer.onboarding.ingameForegroundDisplayGroup = foreground
  composer.onboarding.screenDisplayGroup = screenDisplayGroup
  composer.onboarding.playerReferences = playerList
  composer.onboarding.physics = physics
  local id = composer.onboarding.activatedPart
  if onboardingSteps[id] and onboardingSteps[id].ingame and onboardingSteps[id].onSetupGameComplete then
    onboardingSteps[id].onSetupGameComplete()
  end
  if screenDisplayGroup then
    screenDisplayGroup:insert(createArrowImage(greenArrow))
    if composer.onboarding.activatedPart == "1" then
      local firstStepTime = 3000
      createBlades(foreground)
      composer.onboarding.intro = true
      local dx = playerList[1].x - getTileXPos(2)
      displayGroup.x = displayGroup.x + dx * 0.25
      transition.to(composer.onboarding.ingameForegroundDisplayGroup, {
        tag = "tutorialTransition",
        x = displayGroup.x - dx * 0.25 + 150,
        time = firstStepTime
      })
      transition.to(displayGroup, {
        tag = "tutorialTransition",
        x = displayGroup.x - dx * 0.25 + 150,
        time = firstStepTime
      })
      blackFadeIn(screenDisplayGroup)
      local startX = playerList[1].x - dx
      local startY = playerList[1].y
      local endX = playerList[1].x
      moveCharacterIn(playerList[1], startX, startY, endX, startY, firstStepTime)
      moveCharacterIn(playerList[2], startX - 50, startY, endX - 50, startY, firstStepTime)
      moveCharacterIn(playerList[3], startX - 100, startY, endX - 100, startY, firstStepTime)
      moveCharacterIn(playerList[4], startX - 150, startY, endX - 150, startY, firstStepTime)
      timer9 = timer.performWithDelay(firstStepTime + 350, introPart2, 1)
    else
      blackFadeIn(screenDisplayGroup)
      if onboardingSteps[composer.onboarding.activatedPart].walkIn then
        moveCharacterIn(playerList[1], playerList[1].x - 200, playerList[1].y, playerList[1].x, startY, 1100)
      end
    end
  end
end

function composer.onboarding.updateDisplayGroups(displayGroup, screenDisplayGroup)
  composer.onboarding.ingameDisplayGroup = displayGroup
  composer.onboarding.screenDisplayGroup = screenDisplayGroup
end

function composer.onboarding.activateStep()
  if composer.config.invalidUser then
    return
  elseif not composer.onboarding.isActive then
    print("The Onboarding Module is not active")
    return
  elseif not composer.onboarding.activatedPart then
    print("activatedPart is not set")
    return
  end
  local id = composer.onboarding.activatedPart
  if onboardingSteps[id] then
    local onboardingStep = onboardingSteps[id]
    if onboardingStep.preLoad then
      onboardingStep.preLoad()
    end
    if onboardingStep.ingame then
      loadOfflineOnboardingSession(onboardingStep.mapId)
      composer.onboarding.ingameTextArray = {}
      composer.onboarding.doneMovingIn = false
      composer.onboarding.setCamera = false
    end
    local currentScene = composer.getSceneName("current")
    if currentScene == onboardingStep.scene and currentScene == "lua.scenes.gamePlay" then
      composer.gotoScene("lua.scenes.bufferScene")
      composer.removeScene(currentScene)
    else
      composer.gotoScene(onboardingStep.scene)
      composer.removeScene(currentScene)
    end
    if onboardingStep.postLoad then
      onboardingStep.postLoad()
    end
  else
  end
end

function composer.onboarding.stepDone()
  local finalStep = false
  local id = composer.onboarding.activatedPart
  local onboardingVersion = composer.config.onboardingVersion
  composer.onboarding.clean()
  composer.analytics.newEvent("design", {
    event_id = "onboarding:intro:step" .. id,
    area = onboardingVersion
  })
  if onboardingSteps[id] and onboardingSteps[id].finalStep and onboardingSteps[id].finalStep == true then
    finalStep = true
  end
  if finalStep then
    composer.onboarding.deactivate()
    local currentScene = composer.getSceneName("current")
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene(currentScene)
  else
    composer.database.setOnboardingIntroPartDone(tonumber(composer.onboarding.activatedPart))
    composer.onboarding.setStep(onboardingSteps[id].next)
    composer.onboarding.activateStep()
  end
end

function composer.onboarding.addGuiReference(referenceName, ref)
  if not composer.onboarding.guiReferences then
    return
  end
  local guiReferences = composer.onboarding.guiReferences
  if not guiReferences[referenceName] then
    guiReferences[referenceName] = {}
  end
  guiReferences[referenceName][#guiReferences[referenceName] + 1] = ref
end

function composer.onboarding.hideReferences(referenceName)
  local reference = composer.onboarding.guiReferences[referenceName]
  if reference then
    for i = 1, #reference do
      reference[i].alpha = 0
      if reference[i].isVisible == true then
        reference[i].isVisible = false
      end
    end
  end
end

function composer.onboarding.setAlphaForReferences(referenceName, alpha)
  local reference = composer.onboarding.guiReferences[referenceName]
  if reference then
    for i = 1, #reference do
      reference[i].alpha = alpha
      if not reference[i].isVisible == true then
        reference[i].isVisible = true
      end
    end
  end
end

function composer.onboarding.showReferences(referenceName)
  local reference = composer.onboarding.guiReferences[referenceName]
  if reference then
    for i = 1, #reference do
      reference[i].alpha = 1
      if not reference[i].isVisible == true then
        reference[i].isVisible = true
      end
    end
  end
end

function composer.onboarding.isReferenceVisible(referenceName)
  local reference = composer.onboarding.guiReferences[referenceName]
  if reference then
    for i = 1, #reference do
      if reference[i].alpha == 1 or reference[i].isVisible == true then
        return true
      end
    end
  end
  return false
end

function composer.onboarding.getNextStep(step)
  local currentStep = onboardingSteps[step .. ""]
  local nextStep = onboardingSteps[currentStep.next]
  if nextStep.skipDB == true then
    return step
  else
    return currentStep.next
  end
end

function composer.onboarding.deactivate()
  composer.onboarding.clean()
  local id = composer.onboarding.activatedPart
  local onboardingVersion = composer.config.onboardingVersion
  composer.analytics.newEvent("design", {
    event_id = "onboarding:intro:deactivationStep" .. id,
    area = onboardingVersion
  })
  composer.onboarding.isActive = false
  composer.onboarding.activatedPart = nil
  composer.database.setOnboardingPartDone(1)
end

function composer.contextualOnboarding.deactivate()
  composer.contextualOnboarding.isActive = false
end

function composer.onboarding.ingameUpdate()
  local id = composer.onboarding.activatedPart
  local livePlayer = composer.onboarding.playerReferences[1]
  if onboardingSteps[id] and onboardingSteps[id].ingame and onboardingSteps[id].onGameUpdate and livePlayer then
    local detachCamera = livePlayer.x > getTileXPos(composer.onboarding.stepData[composer.onboarding.activatedPart].endAtTileX - 6)
    if detachCamera then
      composer.onboarding.hideReferences("exit")
      local vx, vy = livePlayer.getLinearVelocityOnPlayer()
      if 150 < vx then
        vx = vx - vx * 0.15
      end
      livePlayer.setLinearVelocityOnPlayer(vx, vy)
    end
    onboardingSteps[id].onGameUpdate(livePlayer)
  end
  if onboardingSteps[id] and onboardingSteps[id].ingame and onboardingSteps[id].rubberband and livePlayer then
    for i = 2, #composer.onboarding.playerReferences do
      rubberbandBotAI(livePlayer, composer.onboarding.playerReferences[i], i - 1)
    end
  end
end

function composer.onboarding.overrideAI()
  local id = composer.onboarding.activatedPart
  if not onboardingSteps[id] and not onboardingSteps[id].overrideAI then
    return false
  elseif onboardingSteps[id] and onboardingSteps[id].overrideAI then
    return onboardingSteps[id].overrideAI()
  end
end

function composer.onboarding.shouldSetStartCamera()
  composer.onboarding.hideReferences("selfArrow")
  if not composer.onboarding.setCamera then
    composer.onboarding.setCamera = true
    return true
  end
  return false
end

function composer.onboarding.disableCameraX(playerX)
  if not composer.onboarding.isActive == true then
    return false
  end
  if composer.onboarding.intro then
    return true
  end
  if not onboardingSteps[composer.onboarding.activatedPart].walkIn then
    return false
  end
  if not composer.onboarding.stepData[composer.onboarding.activatedPart] then
    return false
  end
  if not composer.onboarding.stepData[composer.onboarding.activatedPart].endAtTileX then
    return false
  end
  if onboardingSteps[composer.onboarding.activatedPart].walkIn and not composer.onboarding.doneMovingIn then
    return true
  end
  local detachCamera = playerX > getTileXPos(composer.onboarding.stepData[composer.onboarding.activatedPart].endAtTileX - 6)
  if detachCamera then
    composer.onboarding.hideReferences("jump")
    composer.onboarding.hideReferences("powerUp")
    composer.onboarding.hideReferences("selfArrow")
  end
  return detachCamera
end

function composer.onboarding.disableCameraY(playerX)
  return composer.onboarding.intro == true
end

function composer.onboarding.overrideCountdown()
  local id = composer.onboarding.activatedPart
  if onboardingSteps[id] then
    return onboardingSteps[id].overrideCountdown
  end
  return false
end

function composer.onboarding.onCollideWithPowerBox()
  if composer.onboarding.isReferenceVisible("powerUp") then
    showPowerUpArrowOnce(1, 0)
  end
end

function composer.onboarding.setGameCleanFunction(clean)
  composer.onboarding.quitGameClean = clean
end

function composer.onboarding.getMapName()
  return onboardingSteps[composer.onboarding.activatedPart].description
end

function composer.onboarding.manualStart()
  return composer.onboarding.activatedPart == "1"
end

function composer.onboarding.setManualStart(countdownCompleted)
  composer.onboarding.manualStartFunction = countdownCompleted
end

function composer.onboarding.reduceRespawnTime()
  if not composer.onboarding.isActive == true then
    return false
  end
  return composer.onboarding.activatedPart == "21"
end

function composer.onboarding.clean()
  transition.cancel("tutorialTransition")
  if composer.contextualOnboarding.stepData["2"].playArrow and composer.contextualOnboarding.stepData["2"].playArrow.removeSelf then
    composer.contextualOnboarding.stepData["2"].playArrow:removeSelf()
    composer.contextualOnboarding.stepData["2"].playArrow = nil
  end
  if composer.contextualOnboarding.stepData["2"].quickPlayArrow and composer.contextualOnboarding.stepData["2"].quickPlayArrow.removeSelf then
    composer.contextualOnboarding.stepData["2"].quickPlayArrow:removeSelf()
    composer.contextualOnboarding.stepData["2"].quickPlayArrow = nil
  end
  if composer.onboarding.stepData["25"].categoryArrow and composer.onboarding.stepData["25"].categoryArrow.removeSelf then
    composer.onboarding.stepData["25"].categoryArrow:removeSelf()
    composer.onboarding.stepData["25"].categoryArrow = nil
  end
  if composer.onboarding.stepData["25"].iconArrow and composer.onboarding.stepData["25"].iconArrow.removeSelf then
    composer.onboarding.stepData["25"].iconArrow:removeSelf()
    composer.onboarding.stepData["25"].iconArrow = nil
  end
  if composer.onboarding.stepData["25"].homeArrow and composer.onboarding.stepData["25"].homeArrow.removeSelf then
    composer.onboarding.stepData["25"].homeArrow:removeSelf()
    composer.onboarding.stepData["25"].homeArrow = nil
  end
  if composer.onboarding.arrowTutorialImage then
    if composer.onboarding.arrowTutorialImage.removeSelf then
      composer.onboarding.arrowTutorialImage:removeSelf()
    end
    composer.onboarding.arrowTutorialImage = nil
  end
  if timer1 then
    timer.cancel(timer1)
    timer1 = nil
  end
  if timer2 then
    timer.cancel(timer2)
    timer2 = nil
  end
  if timer3 then
    timer.cancel(timer3)
    timer3 = nil
  end
  if timer4 then
    timer.cancel(timer4)
    timer4 = nil
  end
  if timer5 then
    timer.cancel(timer5)
    timer5 = nil
  end
  if timer6 then
    timer.cancel(timer6)
    timer6 = nil
  end
  if timer7 then
    timer.cancel(timer7)
    timer7 = nil
  end
  if timer8 then
    timer.cancel(timer8)
    timer8 = nil
  end
  if timer9 then
    timer.cancel(timer9)
    timer9 = nil
  end
  if timer10 then
    timer.cancel(timer10)
    timer10 = nil
  end
end
