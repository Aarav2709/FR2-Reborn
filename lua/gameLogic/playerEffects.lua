local M = {}
local composer = require("composer")
local spawnGibs = true

function M.createEffects(player, playerCorpses, monster, booleanStates, spriteDisplay, bodyParts, screenGroup)
  local C = {}
  local deathAnimation = composer.data.monsterInMemory[monster.getMemoryIndex()]
  local bloodSplatter = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.bloodEffect)
  bloodSplatter.xScale = 0.5
  bloodSplatter.yScale = 0.5
  bloodSplatter.alpha = 0
  bloodSplatter.y = -30
  
  local function hideBloodSplatterEffect(event)
    if event.phase == "ended" then
      bloodSplatter.alpha = 0
    end
  end
  
  function C.createCannonBall()
    local function playHuntersMarkEffect()
      if booleanStates.startedClean then
        return
      end
      bloodSplatter.alpha = 1
      bloodSplatter:setSequence("normal")
      bloodSplatter.rotation = spriteDisplay.rotation
      bloodSplatter:play()
    end
    
    local cannonImagePath = composer.powerUpEffectImageSheetInfo:getFrameIndex("cannonball")
    local cannonBall = display.newImage(composer.powerUpEffectImageSheet, cannonImagePath)
    cannonBall.xScale = 0.5
    cannonBall.yScale = 0.5
    player:insert(cannonBall)
    cannonBall.y = -400
    
    local function removeCannonBall(obj)
      if obj and not booleanStates.startedClean then
        obj:removeSelf()
        obj = nil
      end
    end
    
    transition.to(cannonBall, {
      time = 200,
      y = 0,
      onComplete = removeCannonBall
    })
    timer.performWithDelay(180, playHuntersMarkEffect, 1)
  end
  
  local trapStartIndex = deathAnimation.sheetInfo:getFrameIndex("deaths/body")
  local trapDeathSprite = display.newImage(deathAnimation.sheet, trapStartIndex)
  trapDeathSprite.xScale = 0.5
  trapDeathSprite.yScale = 0.5
  trapDeathSprite.alpha = 0
  
  local function hideTrapDeathEffect(event)
    trapDeathSprite.alpha = 0
  end
  
  function C.playTrapEffect()
    trapDeathSprite.alpha = 1
    transition.to(trapDeathSprite, {
      delay = 1000,
      time = 0,
      alpha = 0
    })
    trapDeathSprite.rotation = spriteDisplay.rotation
  end
  
  local rocketDeathSprite = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.rocketEffect)
  rocketDeathSprite.xScale = 0.5
  rocketDeathSprite.yScale = 0.5
  rocketDeathSprite.alpha = 0
  
  local function hideRocketDeathEffect(event)
    if event.phase == "ended" then
      rocketDeathSprite.alpha = 0
    end
  end
  
  function C.playRocketDeathEffect()
    rocketDeathSprite.alpha = 1
    rocketDeathSprite:setSequence("normal")
    rocketDeathSprite:play()
  end
  
  local lightninStartIndex = deathAnimation.sheetInfo:getFrameIndex("deaths/lightning1")
  local lightningSequenceData = {
    name = "normal",
    start = lightninStartIndex,
    count = 2,
    time = 300,
    loopCount = 2
  }
  local lightningDeathSprite = display.newSprite(deathAnimation.sheet, lightningSequenceData)
  lightningDeathSprite.xScale = 0.5
  lightningDeathSprite.yScale = 0.5
  lightningDeathSprite.alpha = 0
  local lightningDeathBackground = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.lightningBackSet)
  lightningDeathBackground.xScale = 0.5
  lightningDeathBackground.yScale = 0.5
  lightningDeathBackground.alpha = 0
  
  local function hideLightningDeathEffect(event)
    if event.phase == "ended" then
      lightningDeathSprite.alpha = 0
      lightningDeathBackground.alpha = 0
    end
  end
  
  function C.playLightningEffect()
    lightningDeathSprite.alpha = 1
    lightningDeathSprite:setSequence("normal")
    lightningDeathSprite.rotation = spriteDisplay.rotation
    lightningDeathSprite:play()
    lightningDeathBackground.alpha = 1
    lightningDeathBackground:setSequence("normal")
    lightningDeathBackground.rotation = spriteDisplay.rotation
    lightningDeathBackground:play()
  end
  
  local lightningBoltSprite = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.lightningBoltSet)
  lightningBoltSprite.xScale = 0.5
  lightningBoltSprite.yScale = 0.5
  lightningBoltSprite.alpha = 0
  bodyParts:insert(lightningBoltSprite)
  
  function C.playLightningStrike()
    lightningBoltSprite.alpha = 1
    lightningBoltSprite.x = player.x + 10
    lightningBoltSprite.y = player.y - 110
    lightningBoltSprite:setSequence("normal")
    lightningBoltSprite:play()
  end
  
  local function hideLightningEffect(event)
    if event.phase == "ended" then
      lightningBoltSprite.alpha = 0
    end
  end
  
  local bloodSquirtSprite = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.bloodSquirt)
  bloodSquirtSprite.xScale = 0.5
  bloodSquirtSprite.yScale = 0.5
  bloodSquirtSprite.alpha = 0
  
  function C.playBloodSquirt()
    if bloodSquirtSprite and not booleanStates.startedClean then
      bloodSquirtSprite.alpha = 1
      bloodSquirtSprite.x = 6
      bloodSquirtSprite.y = 0
      bloodSquirtSprite:setSequence("normal")
      bloodSquirtSprite:play()
    end
  end
  
  local function hideBloodSquirt(event)
    if event.phase == "ended" then
      bloodSquirtSprite.alpha = 0
    end
  end
  
  local cloudTop, cloudBottom, cloudBackground, cloudTimer
  if player.mainPlayer then
    local cloudBottomPath = composer.powerUpEffectImageSheetInfo:getFrameIndex("lightningCloudBottom")
    local cloudTopPath = composer.powerUpEffectImageSheetInfo:getFrameIndex("lightningCloudTop")
    local cloudBackgroundPath = composer.powerUpEffectImageSheetInfo:getFrameIndex("lightningBackground")
    cloudBottom = display.newImage(composer.powerUpEffectImageSheet, cloudBottomPath)
    cloudBottom.xScale = 0.5
    cloudBottom.yScale = 0.5
    cloudBottom.anchorX = 1
    cloudBottom.anchorY = 0
    cloudBottom.x = display.contentWidth
    cloudBottom.y = 0
    cloudBottom.alpha = 0
    cloudTop = display.newImage(composer.powerUpEffectImageSheet, cloudTopPath)
    cloudTop.xScale = 0.5
    cloudTop.yScale = 0.5
    cloudTop.anchorX = 0
    cloudTop.anchorY = 0
    cloudTop.x = 0
    cloudTop.y = 0
    cloudTop.alpha = 0
    cloudBackground = display.newImageRect(composer.powerUpEffectImageSheet, cloudBackgroundPath, 480, 320)
    cloudBackground.x = display.contentWidth * 0.5
    cloudBackground.y = display.contentHeight * 0.5
    cloudBackground.alpha = 0
    screenGroup:insert(cloudBackground)
    screenGroup:insert(cloudBottom)
    screenGroup:insert(cloudTop)
  end
  
  local function hideCloud()
    cloudBottom.alpha = 0
    cloudTop.alpha = 0
    cloudBottom.x = display.contentWidth
    cloudTop.x = 0
  end
  
  local function fadeCloudBackground()
    transition.to(cloudBackground, {
      delay = 800,
      time = 1200,
      alpha = 0,
      tag = "lightningCloud"
    })
  end
  
  local function moveClouds()
    cloudBottom.alpha = 1
    cloudTop.alpha = 1
    transition.to(cloudBottom, {
      x = 530,
      time = 1500,
      tag = "lightningCloud"
    })
    transition.to(cloudTop, {
      x = -50,
      time = 1500,
      tag = "lightningCloud"
    })
    transition.to(cloudBottom, {
      delay = 1200,
      time = 500,
      alpha = 0,
      tag = "lightningCloud"
    })
    transition.to(cloudTop, {
      delay = 1200,
      time = 500,
      alpha = 0,
      tag = "lightningCloud"
    })
  end
  
  function C.showCloud()
    if player.mainPlayer then
      if cloudTimer then
        timer.cancel(cloudTimer)
        cloudTimer = nil
      end
      hideCloud()
      transition.cancel("lightningCloud")
      cloudBackground.alpha = 0.7
      fadeCloudBackground()
      moveClouds()
      cloudTimer = timer.performWithDelay(2200, hideCloud, 1)
    end
  end
  
  local teleportEffect = display.newSprite(composer.powerUpImageSheet, composer.data.animations.teleportEffect)
  teleportEffect.xScale = 0.5
  teleportEffect.yScale = 0.5
  teleportEffect.alpha = 0
  
  local function hideTeleportEffect(event)
    if event.phase == "ended" and teleportEffect.animationType == 1 then
      teleportEffect:setSequence("stop")
      teleportEffect.animationType = 2
      teleportEffect:play()
      player.x = teleportEffect.newX
      player.y = teleportEffect.newY
    elseif event.phase == "ended" and teleportEffect.animationType == 2 then
      teleportEffect.alpha = 0
      teleportEffect:pause()
    end
  end
  
  function C.playTeleportPowerUp(newX, newY)
    teleportEffect.alpha = 1
    teleportEffect:setSequence("start")
    teleportEffect.animationType = 1
    teleportEffect.newX = newX
    teleportEffect.newY = newY
    teleportEffect:play()
  end
  
  local magnetEffect = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.magnetEffect)
  magnetEffect.xScale = 0.5
  magnetEffect.yScale = 0.5
  magnetEffect.alpha = 0
  
  local function hideMagnetEffect(event)
    if event.phase == "ended" then
      magnetEffect.alpha = 0
      magnetEffect:pause()
    end
  end
  
  function C.playMagnetEffect(dirRight)
    if dirRight then
      magnetEffect.x = -40
      magnetEffect.xScale = math.abs(magnetEffect.xScale)
    else
      magnetEffect.x = 40
      magnetEffect.xScale = -math.abs(magnetEffect.xScale)
    end
    magnetEffect.alpha = 1
    magnetEffect:setSequence("normal")
    magnetEffect:play()
  end
  
  local shieldSprite = display.newSprite(composer.powerUpImageSheet, composer.data.animations.shieldSpriteSet)
  shieldSprite.xScale = 0.5
  shieldSprite.yScale = 0.5
  shieldSprite.y = -10
  shieldSprite.alpha = 0
  
  function C.hidePowerUpShield()
    transition.cancel(shieldSprite)
    booleanStates.shieldActive = false
    shieldSprite.alpha = 0
    shieldSprite:pause()
  end
  
  local function playPowerUpShieldActive(event)
    if event then
      if event.phase == "ended" and shieldSprite.animationType == 1 then
        shieldSprite:setSequence("shieldActive")
        shieldSprite:play()
        shieldSprite.animationType = 2
      elseif event.phase == "ended" and shieldSprite.animationType == 2 then
        shieldSprite:setSequence("shieldEnd")
        shieldSprite:play()
        shieldSprite.animationType = 3
        player.playSound("invul_end")
      elseif event.phase == "ended" and shieldSprite.animationType == 3 then
        C.hidePowerUpShield()
      end
    end
  end
  
  local function shieldOverEffect()
    if not booleanStates.startedClean then
      local targetScale = 0.45
      local targetAlpha = 0.25
      
      local function setTransitionTarget()
        if targetScale < 0.5 then
          targetScale = 0.5
          targetAlpha = 1
        else
          targetScale = 0.45
          targetAlpha = 0.25
        end
      end
      
      local function hide()
        transition.cancel(shieldSprite)
        shieldSprite.alpha = 0
        booleanStates.shieldActive = false
      end
      
      local function transitionScale()
        transition.to(shieldSprite, {
          time = 200,
          alpha = targetAlpha,
          xScale = targetScale,
          yScale = targetScale,
          onRepeat = setTransitionTarget,
          onComplete = hide,
          iterations = 4
        })
      end
      
      transitionScale()
    end
  end
  
  function C.playShieldAbsorb()
    shieldSprite.animationType = 1
    shieldSprite:setSequence("shieldAbsorb")
    shieldSprite:play()
  end
  
  function C.playPowerUpShieldStart()
    transition.cancel(shieldSprite)
    shieldSprite.animationType = 1
    shieldSprite.alpha = 1
    shieldSprite:setSequence("shieldStart")
    shieldSprite:play()
    transition.to(shieldSprite, {time = 3200, onComplete = shieldOverEffect})
  end
  
  local bloodScreenBL, bloodScreenTL, bloodScreenTR
  if player.mainPlayer then
    bloodScreenBL = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.llBloodEffect)
    bloodScreenBL.xScale = 0.5
    bloodScreenBL.yScale = 0.5
    bloodScreenBL.anchorX = 0
    bloodScreenBL.anchorY = 1
    bloodScreenBL.x = 0
    bloodScreenBL.y = display.contentHeight
    bloodScreenBL.alpha = 0
    screenGroup:insert(bloodScreenBL)
    bloodScreenTL = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.tlBloodEffect)
    bloodScreenTL.xScale = 0.5
    bloodScreenTL.yScale = 0.5
    bloodScreenTL.anchorX = 0
    bloodScreenTL.anchorY = 0
    bloodScreenTL.x = 0
    bloodScreenTL.y = 0
    bloodScreenTL.alpha = 0
    screenGroup:insert(bloodScreenTL)
    bloodScreenTR = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.trBloodEffect)
    bloodScreenTL.xScale = 0.5
    bloodScreenTL.yScale = 0.5
    bloodScreenTR.anchorX = 1
    bloodScreenTR.anchorY = 0
    bloodScreenTR.x = display.contentWidth
    bloodScreenTR.y = 0
    bloodScreenTR.alpha = 0
    screenGroup:insert(bloodScreenTR)
  end
  
  local function showBloodScreen()
    if bloodScreenBL.alpha == 0 then
      bloodScreenBL.alpha = 1
      bloodScreenBL:setSequence("normal")
      bloodScreenBL:play()
    elseif bloodScreenTR.alpha == 0 then
      bloodScreenTR.alpha = 1
      bloodScreenTR:setSequence("normal")
      bloodScreenTR:play()
    elseif bloodScreenTL.alpha == 0 then
      bloodScreenTL.alpha = 1
      bloodScreenTL:setSequence("normal")
      bloodScreenTL:play()
    end
  end
  
  local function hideBloodScreen()
    transition.to(bloodScreenBL, {
      time = 300,
      alpha = 0,
      tag = "blood"
    })
    transition.to(bloodScreenTR, {
      time = 300,
      alpha = 0,
      tag = "blood"
    })
    transition.to(bloodScreenTL, {
      time = 300,
      alpha = 0,
      tag = "blood"
    })
  end
  
  function C.runBloodScreen(override)
    if player.mainPlayer or override then
      showBloodScreen()
      timer.performWithDelay(125, showBloodScreen, 1)
      timer.performWithDelay(250, showBloodScreen, 1)
      timer.performWithDelay(375, showBloodScreen, 1)
      timer.performWithDelay(800, hideBloodScreen, 1)
    end
  end
  
  local jumpEffect = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.jumpEffect)
  jumpEffect.xScale = 0.25
  jumpEffect.yScale = 0.25
  jumpEffect.alpha = 0
  
  local function hideJumpEffect(event)
    if event.phase == "ended" then
      jumpEffect.alpha = 0
      jumpEffect:pause()
    end
  end
  
  function C.playJumpEffect(x, y, rotation, vxPercentage)
    jumpEffect.alpha = 1
    jumpEffect.anchorX = vxPercentage
    jumpEffect.anchorY = 0.5
    jumpEffect.rotation = rotation
    jumpEffect.x = x
    jumpEffect.y = y
    jumpEffect:setSequence("normal")
    jumpEffect:play()
  end
  
  local landEffect = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.landEffect)
  landEffect.xScale = 0.25
  landEffect.yScale = 0.25
  landEffect.alpha = 0
  
  local function hideLandEffect(event)
    if event.phase == "ended" then
      landEffect.alpha = 0
      landEffect:pause()
    end
  end
  
  function C.playLandEffect(x, y, rotation)
    landEffect.alpha = 1
    landEffect.anchorX = 0
    landEffect.anchorY = 0.5
    landEffect.rotation = rotation
    landEffect.x = x
    landEffect.y = y
    landEffect:setSequence("normal")
    landEffect:play()
  end
  
  local markBloodEffect = display.newSprite(composer.powerUpEffectImageSheet, composer.data.animations.markBlood)
  markBloodEffect.xScale = 0.25
  markBloodEffect.yScale = 0.25
  markBloodEffect.alpha = 0
  
  local function hideMarkBloodEffect(event)
    if event.phase == "ended" then
      markBloodEffect.alpha = 0
      markBloodEffect:pause()
    end
  end
  
  function C.playMarkBloodEffect()
    markBloodEffect.alpha = 1
    markBloodEffect:setSequence("normal")
    markBloodEffect:play()
  end
  
  local function removeEventListeners()
    bloodSplatter:removeEventListener("sprite", hideBloodSplatterEffect)
    trapDeathSprite:removeEventListener("sprite", hideTrapDeathEffect)
    rocketDeathSprite:removeEventListener("sprite", hideRocketDeathEffect)
    lightningDeathSprite:removeEventListener("sprite", hideLightningDeathEffect)
    lightningBoltSprite:removeEventListener("sprite", hideLightningEffect)
    bloodSquirtSprite:removeEventListener("sprite", hideBloodSquirt)
    teleportEffect:removeEventListener("sprite", hideTeleportEffect)
    magnetEffect:removeEventListener("sprite", hideMagnetEffect)
    shieldSprite:removeEventListener("sprite", playPowerUpShieldActive)
    jumpEffect:removeEventListener("sprite", hideJumpEffect)
    landEffect:removeEventListener("sprite", hideLandEffect)
    markBloodEffect:removeEventListener("sprite", hideMarkBloodEffect)
  end
  
  function C.clean()
    if cloudTimer then
      timer.cancel(cloudTimer)
      cloudTimer = nil
    end
    transition.cancel("blood")
    removeEventListeners()
  end
  
  function C.addEventListeners()
    bloodSplatter:addEventListener("sprite", hideBloodSplatterEffect)
    trapDeathSprite:addEventListener("sprite", hideTrapDeathEffect)
    rocketDeathSprite:addEventListener("sprite", hideRocketDeathEffect)
    lightningDeathSprite:addEventListener("sprite", hideLightningDeathEffect)
    lightningBoltSprite:addEventListener("sprite", hideLightningEffect)
    bloodSquirtSprite:addEventListener("sprite", hideBloodSquirt)
    teleportEffect:addEventListener("sprite", hideTeleportEffect)
    magnetEffect:addEventListener("sprite", hideMagnetEffect)
    shieldSprite:addEventListener("sprite", playPowerUpShieldActive)
    jumpEffect:addEventListener("sprite", hideJumpEffect)
    landEffect:addEventListener("sprite", hideLandEffect)
    markBloodEffect:addEventListener("sprite", hideMarkBloodEffect)
  end
  
  function C.updateDisplayGroup()
    player:insert(bloodSplatter)
    player:insert(trapDeathSprite)
    player:insert(rocketDeathSprite)
    player:insert(lightningDeathBackground)
    player:insert(lightningDeathSprite)
    player:insert(teleportEffect)
    player:insert(magnetEffect)
    player:insert(shieldSprite)
    spriteDisplay:insert(bloodSquirtSprite)
    bodyParts:insert(jumpEffect)
    bodyParts:insert(landEffect)
  end
  
  return C
end

return M
