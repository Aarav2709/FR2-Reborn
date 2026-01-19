local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData
local lineLength = 100

function scene:create(event)
  local sceneGroup = self.view
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local inApp = require("lua.iap.inAppPurchase")
  local moneyValue = composer.database.getMoney()
  local spinActive = false
  local startRotation = 0
  local spinVector = 0
  local stoppingAtPrize = false
  local prevX, prevY
  local spinSpeed = 0
  local spinSlowFactor = 1
  local spinRef, soundTimer, serverTimeoutTimer, imageFlipperRef, imageFlipper2Ref
  local activeTable = event.params.tableActive
  local challengeId = event.params.challengeId
  local spinJson = require("lua.modules.jsonParser").getJsonFromFile("config/spin.json")
  local rewards = spinJson.spinRewards
  local stopAngle
  local moneyValue = composer.database.getMoney()
  local rewardId, rewardValue, rewardThatIsWon, showPriceRef
  local shouldSendClaim = false
  local startedClean = false
  local dropdownGroup = display.newGroup()
  local spinningGroup = display.newGroup()
  spinningGroup.anchorX = 0.5
  spinningGroup.anchorY = 0.5
  spinningGroup.x = display.contentWidth * 0.5
  spinningGroup.y = 180
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  sceneGroup:insert(backgroundImage)
  local backgroundWindow = display.newImageRect("images/gui/wheel/window.png", 300, 300)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 70, 53)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 400
  backgroundCoins.y = 0
  local moneyLabel = composer.newText({
    string = moneyValue,
    size = 14,
    x = 424,
    y = 40,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local wheel1 = display.newImageRect("images/gui/wheel/wheel1.png", 270, 270)
  wheel1.x = 0
  wheel1.y = 0
  local wheel2 = display.newImageRect("images/gui/wheel/wheel2.png", 270, 270)
  wheel2.x = wheel1.x
  wheel2.y = wheel1.y
  local midWheel = display.newImageRect("images/gui/wheel/wheelMid.png", 50, 50)
  midWheel.x = wheel1.x
  midWheel.y = wheel1.y
  local headerBackground1 = display.newImageRect("images/gui/wheel/header1.png", 215, 75)
  headerBackground1.x = display.contentWidth * 0.5
  headerBackground1.y = 60
  local headerBackground2 = display.newImageRect("images/gui/wheel/header2.png", 215, 75)
  headerBackground2.x = headerBackground1.x
  headerBackground2.y = headerBackground1.y
  local arrow = display.newImageRect("images/gui/wheel/arrow.png", 25, 45)
  arrow.x = headerBackground1.x
  arrow.y = headerBackground1.y + 24
  local windowInfo = composer.newText({
    string = composer.localized.get("Spin"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 50,
    size = 20,
    color = {
      1,
      1,
      1
    }
  })
  local errorInfo = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 32
  })
  
  local function refreshMoney()
    local newMoney = composer.database.getMoney()
    if newMoney > moneyValue then
      moneyValue = newMoney
      moneyLabel.text = moneyValue
      transition.to(moneyLabel, {
        time = 100,
        xScale = 1.2,
        yScale = 1.2
      })
      transition.to(moneyLabel, {
        time = 100,
        delay = 200,
        xScale = 1,
        yScale = 1
      })
    end
  end
  
  local function showPrice()
    local options = {
      isModal = true,
      params = {rewardThatIsWon = rewardThatIsWon, rewardValue = rewardValue}
    }
    spinActive = false
    composer.showOverlay("lua.overlays.spinPrize", options)
  end
  
  local function storePrice(id, value)
    for i, reward in ipairs(rewards) do
      if tonumber(reward.id) == id then
        rewardThatIsWon = reward
        if reward.type == "spin" then
          composer.data.playerInfo.spins = composer.data.playerInfo.spins + value
        elseif reward.type == "coins" then
          composer.database.increaseMoney(value)
        elseif reward.type == "mystery" then
          composer.database.addItem(value)
        else
          print("WARNING: failed to find spin prize")
        end
      end
    end
  end
  
  local function applyRotationToWheel()
    if spinSpeed ~= 0 and not stoppingAtPrize then
      spinSpeed = spinSpeed * spinSlowFactor
      spinningGroup.rotation = spinningGroup.rotation + spinSpeed
    end
  end
  
  local function fixOverflow(angle)
    return angle % 360
  end
  
  local function getRandomStopAngle(rewardId)
    for i, reward in ipairs(rewards) do
      if reward.id == rewardId then
        local firstAngle = reward.angleBefore + 5
        local secondAngle = reward.angleAfter - 5
        if firstAngle > secondAngle then
          local meanAngle = (firstAngle + secondAngle) / 2
          firstAngle = meanAngle
          secondAngle = meanAngle
        end
        local angle = math.random(firstAngle, secondAngle)
        angle = angle + spinJson.rotationOffset * (180 / math.pi) + 90
        return -angle
      end
    end
  end
  
  local function playSpinSound()
    if spinActive then
      composer.audio.playWheelSpin()
    else
      if soundTimer then
        timer.cancel(soundTimer)
        soundTimer = nil
      end
      return
    end
    soundTimer = timer.performWithDelay(50, playSpinSound, 1)
  end
  
  local function stopSpinSound()
    if soundTimer then
      timer.cancel(soundTimer)
      soundTimer = nil
    end
  end
  
  local function slowDownSpin()
    spinSlowFactor = 0.7
  end
  
  local function serverTimeoutEvent()
    local spinTime = spinSpeed * 45
    if 3000 < spinTime then
      spinTime = 3000
    end
    
    local function onTransitionEnded()
      spinSpeed = 0
      spinActive = false
      stopSpinSound()
    end
    
    local spins = spinSpeed * 50
    spins = math.floor(spins / 360)
    local degreesToSpin = 360 * spins
    local current = spinningGroup.rotation % 360
    local stop = getRandomStopAngle(1) % 360
    local distanceToStopPoint
    if current > stop then
      distanceToStopPoint = 360 - (current - stop)
    else
      distanceToStopPoint = stop - current
    end
    degreesToSpin = degreesToSpin + distanceToStopPoint
    transition.to(spinningGroup, {
      time = spinTime,
      rotation = degreesToSpin,
      delta = true,
      transition = easing.outExpo,
      onComplete = onTransitionEnded
    })
  end
  
  local function serverTimeout()
    serverTimeoutEvent()
    composer.createCustomOverlay(43)
  end
  
  local function stopServerTimeout()
    if serverTimeoutTimer then
      timer.cancel(serverTimeoutTimer)
      serverTimeoutTimer = nil
    end
  end
  
  local function stopAtCorrectPrize()
    stopServerTimeout()
    stoppingAtPrize = true
    transition.cancel(spinningGroup)
    
    local function doneSpinning()
      spinSpeed = 0
      stopSpinSound()
      showPriceRef = timer.performWithDelay(1000, showPrice)
      composer.audio.play("wheel_win")
      refreshMoney()
    end
    
    local spinTime = spinSpeed * 45
    if 3000 < spinTime then
      spinTime = 3000
    end
    local spins = spinSpeed * 50
    spins = math.floor(spins / 360)
    local degreesToSpin = 360 * spins
    local current = spinningGroup.rotation % 360
    local stop = stopAngle % 360
    local distanceToStopPoint
    if current > stop then
      distanceToStopPoint = 360 - (current - stop)
    else
      distanceToStopPoint = stop - current
    end
    degreesToSpin = degreesToSpin + distanceToStopPoint
    transition.to(spinningGroup, {
      time = spinTime,
      rotation = degreesToSpin,
      delta = true,
      onComplete = doneSpinning,
      transition = easing.outExpo
    })
  end
  
  local function drawLineAtAngle(degrees)
    local endX = math.cos(degrees) * lineLength
    local endY = math.sin(degrees) * lineLength
    local line = display.newLine(0, 0, endX, endY)
    line:setStrokeColor(0, 0, 0, 1)
    line.strokeWidth = 1
    spinningGroup:insert(line)
  end
  
  local function drawRewardAtAngle(reward, degrees)
    local basePath = "images/gui/wheel/"
    if reward.type == "coins" then
    end
    local iconGroup = display.newGroup()
    local endX = math.cos(degrees) * lineLength / 4 * 2.5
    local endY = math.sin(degrees) * lineLength / 4 * 2.5
    local prize1 = display.newImage(basePath .. reward.image)
    prize1.xScale = 0.35
    prize1.yScale = 0.35
    iconGroup:insert(prize1)
    local iconText = reward.value
    if reward.type ~= "mystery" then
      iconText = "x " .. iconText
    end
    local text = composer.newText({
      string = iconText,
      size = 10,
      x = 0,
      y = 7,
      color = {
        1,
        1,
        1
      }
    })
    iconGroup:insert(text)
    iconGroup.x = endX
    iconGroup.y = endY
    iconGroup.rotation = degrees * (180 / math.pi) + 90
    reward.degrees = iconGroup.rotation
    spinningGroup:insert(iconGroup)
  end
  
  local function addPrizesToWheel()
    local sumOfWeights = 0
    for i, reward in ipairs(rewards) do
      sumOfWeights = sumOfWeights + reward.weight
    end
    local rotationOffset = spinJson.rotationOffset
    local sumOfDegrees = rotationOffset
    for i, reward in ipairs(rewards) do
      local degrees = reward.weight / sumOfWeights * math.pi * 2
      drawRewardAtAngle(reward, sumOfDegrees + degrees / 2)
      reward.angleBefore = (sumOfDegrees - rotationOffset) * (180 / math.pi)
      sumOfDegrees = sumOfDegrees + degrees
      reward.angleAfter = (sumOfDegrees - rotationOffset) * (180 / math.pi)
    end
  end
  
  local function getVectorFromCenterOfSpinWheel(centerX, centerY, touchStartX, touchStartY)
    return {
      x = touchStartX - centerX,
      y = touchStartY - centerY
    }
  end
  
  local function dotProduct2D(vectorOne, vectorTwo)
    return vectorOne.x * vectorTwo.x + vectorOne.y * vectorTwo.y
  end
  
  local function crossProduct2D(vectorOne, vectorTwo)
    return vectorOne.x * vectorTwo.y - vectorOne.y * vectorTwo.x
  end
  
  local function normalizeVector2D(vector)
    local length = math.sqrt(vector.x * vector.x + vector.y * vector.y)
    vector.x = vector.x / length
    vector.y = vector.y / length
  end
  
  local function radToDegree(rad)
    return rad * 180 / 3.14
  end
  
  local function getSpinSpeedFromTouch(centerWheelX, centerWheelY, touchStartX, touchStartY, touchEndX, touchEndY)
    if touchStartX == touchEndX and touchStartY == touchEndY then
      return 0
    end
    local vectorFromCenter = getVectorFromCenterOfSpinWheel(centerWheelX, centerWheelY, touchStartX, touchStartY)
    local touchVector = {
      x = touchEndX - touchStartX,
      y = touchEndY - touchStartY
    }
    normalizeVector2D(vectorFromCenter)
    normalizeVector2D(touchVector)
    local crossProduct = crossProduct2D(vectorFromCenter, touchVector)
    return crossProduct
  end
  
  local function sendMessagesToServer()
    if activeTable and challengeId then
      if activeTable == 1 then
        composer.data.dailyToClaim = composer.data.dailyToClaim - 1
        composer.comm.claimDailyChallenge(challengeId)
      elseif activeTable == 2 then
        composer.comm.claimAchievement(challengeId)
      end
      shouldSendClaim = true
    else
      composer.comm.useSpin()
      shouldSendClaim = false
    end
    serverTimeoutTimer = timer.performWithDelay(10000, serverTimeout, 1)
  end
  
  local function initiateValidSpin()
    if not spinActive and 30 < spinSpeed then
      spinSlowFactor = 1
      spinActive = true
      stoppingAtPrize = false
      stopAngle = nil
      rewardId = nil
      rewardValue = nil
      playSpinSound()
      sendMessagesToServer()
    else
      slowDownSpin()
    end
  end
  
  local function haveSpins()
    if activeTable and challengeId then
      return true
    elseif composer.data.playerInfo.spins and composer.data.playerInfo.spins > 0 then
      return true
    end
    return false
  end
  
  local centerX = 240
  local centerY = 180
  local dx = 0
  local dy = 0
  
  local function spinWheel(self, event)
    local phase = event.phase
    if not haveSpins() or spinActive then
      print("No spins or spin active")
      return
    end
    if phase == "began" then
      prevX = event.x
      prevY = event.y
      if spinningGroup then
        transition.cancel(spinningGroup)
      end
    elseif phase == "moved" then
      if prevX == nil or prevY == nil then
        prevX = event.x
        prevY = event.y
        return
      end
      local x = event.x
      local y = event.y
      local vectorFromCenter2 = getVectorFromCenterOfSpinWheel(centerX, centerY, prevX, prevY)
      normalizeVector2D(vectorFromCenter2)
      local degree = radToDegree(math.atan2(vectorFromCenter2.y, vectorFromCenter2.x)) + 90
      local vectorFromCenter = getVectorFromCenterOfSpinWheel(centerX, centerY, x, y)
      normalizeVector2D(vectorFromCenter)
      local degree2 = radToDegree(math.atan2(vectorFromCenter.y, vectorFromCenter.x)) + 90
      spinningGroup.rotation = spinningGroup.rotation + (degree2 - degree)
      spinVector = getSpinSpeedFromTouch(centerX, centerY, prevX, prevY, x, y)
      dx = x - prevX
      dy = y - prevY
      prevX = x
      prevY = y
    elseif phase == "ended" or phase == "cancelled" then
      local x = event.x
      local y = event.y
      if 3 < dx then
        dx = 3
      elseif dx < -3 then
        dx = -3
      end
      if 3 < dy then
        dy = 3
      elseif dy < -3 then
        dy = -3
      end
      local dist = math.sqrt(dx * dx + dy * dy)
      spinSpeed = spinVector * 50 * dist
      initiateValidSpin()
    end
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
    end
  end
  
  local function commCallback(data)
    if startedClean then
    elseif data.m == tcpFormat.useSpin() then
      composer.data.playerInfo.spins = composer.data.playerInfo.spins - 1
      rewardId = data.i
      rewardValue = data.v
      stopAngle = getRandomStopAngle(rewardId)
      storePrice(tonumber(rewardId), tonumber(rewardValue))
      stopAtCorrectPrize()
    elseif data.m == tcpFormat.claimDailyChallenge() and shouldSendClaim then
      composer.data.playerInfo.spins = composer.data.playerInfo.spins + 1
      composer.comm.useSpin()
      shouldSendClaim = false
    end
  end
  
  local function btnWithCashRelease()
    if not composer.data.iapCallActive then
    end
  end
  
  local btnWithCash = composer.newButton({
    image = "images/gui/market/popup/buttonCash.png",
    onRelease = btnWithCashRelease,
    text = {
      string = "cashPrice",
      x = 0,
      y = 10
    },
    width = 77,
    height = 50,
    x = backgroundWindow.x + 50,
    y = backgroundWindow.y + 190
  })
  btnWithCash.isVisible = false
  
  local function btnExitRelease()
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 136,
    y = backgroundWindow.y + 56
  })
  
  local function flipImages()
    if wheel2.isVisible then
      wheel2.isVisible = false
    else
      wheel2.isVisible = true
    end
    local time = 300
    if spinActive then
      time = 150
    end
    imageFlipperRef = timer.performWithDelay(time, flipImages, 1)
  end
  
  local function flipImages2()
    if headerBackground2.isVisible then
      headerBackground2.isVisible = false
    else
      headerBackground2.isVisible = true
    end
    local time = 400
    if spinActive then
      time = 100
    end
    imageFlipper2Ref = timer.performWithDelay(time, flipImages2, 1)
  end
  
  local function updateDisplayGroups()
    dropdownGroup:insert(backgroundWindow)
    spinningGroup:insert(wheel1)
    spinningGroup:insert(wheel2)
    spinningGroup:insert(midWheel)
    addPrizesToWheel()
    dropdownGroup:insert(spinningGroup)
    dropdownGroup:insert(headerBackground1)
    dropdownGroup:insert(headerBackground2)
    dropdownGroup:insert(arrow)
    dropdownGroup:insert(btnWithCash)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(errorInfo)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(backgroundCoins)
    dropdownGroup:insert(moneyLabel)
    sceneGroup:insert(dropdownGroup)
  end
  
  function clean()
    startedClean = true
    if spinRef then
      timer.cancel(spinRef)
      spinRef = nil
    end
    if soundTimer then
      timer.cancel(soundTimer)
      soundTimer = nil
    end
    if serverTimeoutTimer then
      timer.cancel(serverTimeoutTimer)
      serverTimeoutTimer = nil
    end
    transition.cancel(spinningGroup)
    display.remove(btnWithCash)
    display.remove(btnExit)
    spinningGroup:removeEventListener("touch", spinningGroup)
    Runtime:removeEventListener("enterFrame", applyRotationToWheel)
    if imageFlipperRef then
      timer.cancel(imageFlipperRef)
      imageFlipperRef = nil
    end
    if imageFlipper2Ref then
      timer.cancel(imageFlipper2Ref)
      imageFlipper2Ref = nil
    end
    if showPriceRef then
      timer.cancel(showPriceRef)
      showPriceRef = nil
    end
  end
  
  updateDisplayGroups()
  composer.commHttps.setCallback(httpsCallback)
  composer.comm.setCallback(commCallback)
  composer.bouncer.down(dropdownGroup)
  spinningGroup.touch = spinWheel
  spinningGroup:addEventListener("touch", spinningGroup)
  imageFlipperRef = timer.performWithDelay(300, flipImages, 1)
  imageFlipper2Ref = timer.performWithDelay(300, flipImages2, 1)
  startRotation = math.random(0, 360)
  spinningGroup.rotation = startRotation
  Runtime:addEventListener("enterFrame", applyRotationToWheel)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.isOverlay(false)
  end
  
  androidLogic.isOverlay(true)
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase
  if phase == "will" then
    cleanEnter()
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
  end
end

function scene:destroy(event)
  local sceneGroup = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
