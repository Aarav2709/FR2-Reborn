local composer = require("composer")
local screen = require("lua.modules.screen")
local dailySpin = require("lua.modules.dailySpin")
local pcMode = require("lua.modules.pcMode")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData
local lineLength = 100
local WHEEL_RADIUS = lineLength * 0.75
local STOP_SPREAD = 0.5
local FRAME_MS = 1000 / 60
local CLICK_SPIN_MIN, CLICK_SPIN_MAX = 60, 110
local CLICK_MOVE_LIMIT = 6

local DESIGN_W, DESIGN_H = 480, 320
local WHEEL_X, WHEEL_Y = 240, 180

function scene:create(event)
  local sceneGroup = self.view
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local params = event.params or {}
  local offline = composer.config.offlineMode
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local spinActive = false
  local spinVector = 0
  local stoppingAtPrize = false
  local prevX, prevY
  local spinSpeed = 0
  local spinSlowFactor = 1
  local soundTimer, serverTimeoutTimer, imageFlipper2Ref, showPriceRef
  local activeTable = params.tableActive
  local challengeId = params.challengeId
  local spinJson = require("lua.modules.jsonParser").getJsonFromFile("config/spin.json")
  local rewards = spinJson.spinRewards
  local stopAngle
  local moneyValue = composer.database.getMoney()
  local rewardId, rewardValue, rewardThatIsWon
  local shouldSendClaim = false
  local startedClean = false

  local function newText(textParams)
    textParams.size = (textParams.size or composer.localized.getFontSize()) * s
    local text = composer.newText(textParams)
    text.baseScale = 1 / s
    text.xScale, text.yScale = text.baseScale, text.baseScale
    return text
  end

  local backgroundImage = display.newImageRect(sceneGroup, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  backgroundImage.x, backgroundImage.y = screen.centerX, screen.centerY

  local designGroup = display.newGroup()
  designGroup.xScale, designGroup.yScale = s, s
  designGroup.x, designGroup.y = box.left, box.top
  sceneGroup:insert(designGroup)
  local dropdownGroup = display.newGroup()
  designGroup:insert(dropdownGroup)

  local backgroundWindow = display.newImageRect(dropdownGroup, "images/gui/wheel/window.png", 436, 173)
  backgroundWindow.anchorY = 0
  backgroundWindow.x, backgroundWindow.y = WHEEL_X - 16, top

  local spinningGroup = display.newGroup()
  spinningGroup.x, spinningGroup.y = WHEEL_X, top + WHEEL_Y
  display.newImageRect(spinningGroup, "images/gui/wheel/wheel1.png", 257, 258)
  display.newImageRect(spinningGroup, "images/gui/wheel/wheelMid.png", 50, 50)
  local headerBackground1 = display.newImageRect("images/gui/wheel/header1.png", 215, 75)
  headerBackground1.x, headerBackground1.y = WHEEL_X, top + 60
  local headerBackground2 = display.newImageRect("images/gui/wheel/header2.png", 215, 75)
  headerBackground2.x, headerBackground2.y = headerBackground1.x, headerBackground1.y
  local arrow = display.newImageRect("images/gui/wheel/arrow.png", 25, 45)
  arrow.x, arrow.y = WHEEL_X, top + WHEEL_Y - WHEEL_RADIUS - arrow.height * 0.5
  local windowInfo = newText({ string = "", x = WHEEL_X, y = top + 50, size = 20, color = { 1, 1, 1 } })
  local timeInfo = newText({ string = "", x = WHEEL_X, y = top + 62, size = 16, color = { 1, 1, 1 } })
  local errorInfo = newText({ string = "", x = WHEEL_X, y = top + 32 })

  local backgroundCoins = display.newImageRect(designGroup, "images/gui/market/currentCoins.png", 70, 81)
  backgroundCoins.anchorX, backgroundCoins.anchorY = 0, 0
  backgroundCoins.x, backgroundCoins.y = box.SR - 80, top
  local gemValue = composer.database.getGems()
  local gemLabel = newText({ string = gemValue, size = 14, x = backgroundCoins.x + 24, y = top + 41, ax = 0, color = { 1, 1, 1 } })
  designGroup:insert(gemLabel)
  local moneyLabel = newText({ string = moneyValue, size = 14, x = backgroundCoins.x + 24, y = top + 69, ax = 0, color = { 1, 1, 1 } })
  designGroup:insert(moneyLabel)

  local function haveSpins()
    if offline then
      return dailySpin.hasFreeSpin()
    elseif activeTable and challengeId then
      return true
    end
    return composer.data.playerInfo.spins and composer.data.playerInfo.spins > 0
  end

  local function fitOnSign(text)
    local maxWidth = 108
    local width = text.width * text.baseScale
    local fit = math.min(1, maxWidth / math.max(1, width))
    text.xScale, text.yScale = text.baseScale * fit, text.baseScale * fit
  end

  local function updateInfo()
    if haveSpins() then
      windowInfo.text = composer.localized.get("Spin")
      windowInfo.y = top + 50
      timeInfo.text = ""
    else
      windowInfo.text = "Wait " .. dailySpin.timeUntilFreeSpinText()
      windowInfo.y = top + 50
      timeInfo.text = ""
    end
    fitOnSign(windowInfo)
    fitOnSign(timeInfo)
  end

  local function bump(label)
    local base = label.baseScale
    transition.to(label, { time = 100, xScale = base * 1.2, yScale = base * 1.2 })
    transition.to(label, { time = 100, delay = 200, xScale = base, yScale = base })
  end

  local function refreshMoney()
    local newMoney = composer.database.getMoney()
    if newMoney > moneyValue then
      moneyValue = newMoney
      moneyLabel.text = moneyValue
      bump(moneyLabel)
    end
    local newGems = composer.database.getGems()
    if newGems > gemValue then
      gemValue = newGems
      gemLabel.text = gemValue
      bump(gemLabel)
    end
  end

  local function showPrice()
    spinActive = false
    composer.showOverlay("lua.overlays.spinPrize", {
      isModal = true,
      params = { rewardThatIsWon = rewardThatIsWon, rewardValue = rewardValue }
    })
  end

  local function storePrice(id, value)
    for _, reward in ipairs(rewards) do
      if tonumber(reward.id) == id then
        rewardThatIsWon = reward
        if reward.type == "spin" then
          composer.data.playerInfo.spins = (composer.data.playerInfo.spins or 0) + value
        elseif reward.type == "coins" then
          composer.database.increaseMoney(value)
        elseif reward.type == "gems" then
          composer.database.increaseGems(value)
        elseif reward.type == "mystery" then
          composer.database.addItem(value)
        else
        end
      end
    end
  end

  local lastFrameTime
  local function applyRotationToWheel(event)
    local now = event and event.time or system.getTimer()
    local frames = lastFrameTime and math.min(4, (now - lastFrameTime) / FRAME_MS) or 1
    lastFrameTime = now
    if spinSpeed ~= 0 and not stoppingAtPrize then
      local factor = spinSlowFactor
      local turned
      if factor == 1 then
        turned = spinSpeed * frames
      else
        turned = spinSpeed * factor * (1 - math.pow(factor, frames)) / (1 - factor)
      end
      spinSpeed = spinSpeed * math.pow(factor, frames)
      spinningGroup.rotation = spinningGroup.rotation + turned
      if math.abs(spinSpeed) < 0.05 then
        spinSpeed = 0
      end
    end
  end

  -- the wheel rotation that puts a point of reward `id`'s slice under the arrow:
  -- near the middle of the slice, never close to its lines.
  local function getRandomStopAngle(id)
    for _, reward in ipairs(rewards) do
      if tonumber(reward.id) == tonumber(id) then
        local middle = (reward.angleBefore + reward.angleAfter) * 0.5
        local halfWidth = (reward.angleAfter - reward.angleBefore) * 0.5
        local sliceAngle = middle + (math.random() * 2 - 1) * halfWidth * STOP_SPREAD
        local rewardAngle = sliceAngle + spinJson.rotationOffset * (180 / math.pi)
        return -90 - rewardAngle
      end
    end
    return 0
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

  local function spinTo(stop, onComplete, easingFunction)
    local spinTime = math.min(spinSpeed * 45, 3000)
    local degreesToSpin = 360 * math.floor(spinSpeed * 50 / 360)
    local current = spinningGroup.rotation % 360
    stop = stop % 360
    local distanceToStopPoint
    if current > stop then
      distanceToStopPoint = 360 - (current - stop)
    else
      distanceToStopPoint = stop - current
    end
    transition.to(spinningGroup, {
      time = spinTime,
      rotation = degreesToSpin + distanceToStopPoint,
      delta = true,
      transition = easingFunction or easing.outExpo,
      onComplete = onComplete
    })
  end

  local function serverTimeout()
    serverTimeoutTimer = nil
    spinTo(getRandomStopAngle(1), function()
      spinSpeed = 0
      spinActive = false
      stopSpinSound()
    end)
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
    spinTo(stopAngle, function()
      spinSpeed = 0
      stopSpinSound()
      showPriceRef = timer.performWithDelay(1000, showPrice)
      composer.audio.play("wheel_win")
      refreshMoney()
    end)
  end

  local function drawRewardAtAngle(reward, degrees)
    local iconGroup = display.newGroup()
    local prize = display.newImage(iconGroup, "images/gui/wheel/" .. reward.image)
    prize.xScale, prize.yScale = 0.35, 0.35
    local iconText = reward.value
    if reward.type ~= "mystery" then
      iconText = "x " .. iconText
    end
    local textSize = 10
    if reward.type ~= "mystery" and (tonumber(reward.value) or 0) > 1000 then
      textSize = 8
    end
    local text = newText({ string = iconText, size = textSize, x = 0, y = 15, color = { 1, 1, 1 } })
    iconGroup:insert(text)
    iconGroup.x = math.cos(degrees) * WHEEL_RADIUS
    iconGroup.y = math.sin(degrees) * WHEEL_RADIUS
    iconGroup.rotation = degrees * (180 / math.pi) + 90
    reward.degrees = iconGroup.rotation
    spinningGroup:insert(iconGroup)
  end

  local function addPrizesToWheel()
    local sumOfWeights = 0
    for _, reward in ipairs(rewards) do
      sumOfWeights = sumOfWeights + reward.weight
    end
    local rotationOffset = spinJson.rotationOffset
    local sumOfDegrees = rotationOffset
    for _, reward in ipairs(rewards) do
      local degrees = reward.weight / sumOfWeights * math.pi * 2
      drawRewardAtAngle(reward, sumOfDegrees + degrees / 2)
      reward.angleBefore = (sumOfDegrees - rotationOffset) * (180 / math.pi)
      sumOfDegrees = sumOfDegrees + degrees
      reward.angleAfter = (sumOfDegrees - rotationOffset) * (180 / math.pi)
    end
  end

  local function normalizeVector2D(vector)
    local length = math.sqrt(vector.x * vector.x + vector.y * vector.y)
    if length > 0 then
      vector.x = vector.x / length
      vector.y = vector.y / length
    end
  end

  local function radToDegree(rad)
    return rad * 180 / math.pi
  end

  local function getSpinSpeedFromTouch(touchStartX, touchStartY, touchEndX, touchEndY)
    if touchStartX == touchEndX and touchStartY == touchEndY then
      return 0
    end
    local vectorFromCenter = { x = touchStartX - spinningGroup.x, y = touchStartY - spinningGroup.y }
    local touchVector = { x = touchEndX - touchStartX, y = touchEndY - touchStartY }
    normalizeVector2D(vectorFromCenter)
    normalizeVector2D(touchVector)
    return vectorFromCenter.x * touchVector.y - vectorFromCenter.y * touchVector.x
  end

  local function sendMessagesToServer()
    if offline then
      local reward, value = dailySpin.rollPrize(rewards)
      dailySpin.useFreeSpin()
      serverTimeoutTimer = timer.performWithDelay(400, function()
        serverTimeoutTimer = nil
        if startedClean then
          return
        end
        rewardId, rewardValue = reward.id, value
        stopAngle = getRandomStopAngle(rewardId)
        storePrice(tonumber(rewardId), tonumber(rewardValue))
        stopAtCorrectPrize()
      end)
      return
    end
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

  local dx, dy = 0, 0
  local dragDistance = 0
  local touchFocused = false

  local function spinFromButton()
    if not haveSpins() or spinActive or startedClean then
      return false
    end
    transition.cancel(spinningGroup)
    spinSpeed = math.random(CLICK_SPIN_MIN, CLICK_SPIN_MAX)
    initiateValidSpin()
    return true
  end

  local function releaseTouchFocus()
    if touchFocused then
      touchFocused = false
      display.getCurrentStage():setFocus(nil)
    end
  end

  local function spinWheel(self, touchEvent)
    local phase = touchEvent.phase
    if not haveSpins() or spinActive then
      if phase == "ended" or phase == "cancelled" then
        releaseTouchFocus()
      end
      return true
    end
    local x, y = spinningGroup.parent:contentToLocal(touchEvent.x, touchEvent.y)
    if phase == "began" then
      display.getCurrentStage():setFocus(self, touchEvent.id)
      touchFocused = true
      prevX, prevY = x, y
      dx, dy, spinVector, dragDistance = 0, 0, 0, 0
      transition.cancel(spinningGroup)
    elseif phase == "moved" then
      if prevX == nil or prevY == nil then
        prevX, prevY = x, y
        return true
      end
      local degree = radToDegree(math.atan2(prevY - spinningGroup.y, prevX - spinningGroup.x)) + 90
      local degree2 = radToDegree(math.atan2(y - spinningGroup.y, x - spinningGroup.x)) + 90
      spinningGroup.rotation = spinningGroup.rotation + (degree2 - degree)
      spinVector = getSpinSpeedFromTouch(prevX, prevY, x, y)
      dx, dy = x - prevX, y - prevY
      dragDistance = dragDistance + math.sqrt(dx * dx + dy * dy)
      prevX, prevY = x, y
    elseif phase == "ended" or phase == "cancelled" then
      releaseTouchFocus()
      if phase == "ended" and pcMode.isPC and dragDistance < CLICK_MOVE_LIMIT then
        spinFromButton()
        return true
      end
      dx = math.max(-3, math.min(3, dx))
      dy = math.max(-3, math.min(3, dy))
      spinSpeed = spinVector * 50 * math.sqrt(dx * dx + dy * dy)
      initiateValidSpin()
    end
    return true
  end

  -- the wheel is swiped, not pressed: keyboard and mouse hover leave it alone
  -- (its corners would otherwise grow and shrink the hover area as it turns).
  spinningGroup.navIgnore = true

  local function onKey(event)
    if event.phase == "down" and not event.isRepeat and (event.keyName == "space" or event.keyName == "spacebar") then
      spinFromButton()
      return true
    end
    return false
  end

  local function commCallback(data)
    if startedClean or offline then
      return
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

  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = function()
      composer.hideOverlay()
    end,
    width = 38,
    height = 34,
    x = headerBackground1.x + 76,
    y = headerBackground1.y - 6
  })

  local function flipImages2()
    headerBackground2.isVisible = not headerBackground2.isVisible
    imageFlipper2Ref = timer.performWithDelay(spinActive and 100 or 400, flipImages2, 1)
  end

  addPrizesToWheel()
  dropdownGroup:insert(spinningGroup)
  dropdownGroup:insert(headerBackground1)
  dropdownGroup:insert(headerBackground2)
  dropdownGroup:insert(arrow)
  dropdownGroup:insert(btnExit)
  dropdownGroup:insert(errorInfo)
  dropdownGroup:insert(windowInfo)
  dropdownGroup:insert(timeInfo)
  updateInfo()

  function clean()
    startedClean = true
    stopSpinSound()
    stopServerTimeout()
    transition.cancel(spinningGroup)
    releaseTouchFocus()
    display.remove(btnExit)
    spinningGroup:removeEventListener("touch", spinningGroup)
    Runtime:removeEventListener("key", onKey)
    Runtime:removeEventListener("enterFrame", applyRotationToWheel)
    for _, ref in pairs({ imageFlipper2Ref, showPriceRef }) do
      timer.cancel(ref)
    end
  end

  composer.comm.setCallback(commCallback)
  composer.bouncer.down(dropdownGroup)
  spinningGroup.touch = spinWheel
  spinningGroup:addEventListener("touch", spinningGroup)
  Runtime:addEventListener("key", onKey)
  imageFlipper2Ref = timer.performWithDelay(300, flipImages2, 1)
  spinningGroup.rotation = math.random(0, 360)
  Runtime:addEventListener("enterFrame", applyRotationToWheel)
end

function scene:show(event)
  if event.phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")

  function cleanEnter()
    androidLogic.isOverlay(false)
  end

  androidLogic.isOverlay(true)
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if cleanEnter then
      cleanEnter()
    end
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
  end
end

function scene:destroy(event)
  if clean then
    clean()
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
