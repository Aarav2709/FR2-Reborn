local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

function scene:create(event)
  local sceneGroup = self.view
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local item = event.params.item
  local moneyValue = composer.database.getMoney()
  local coinPrice = 0
  local inApp = require("lua.iap.inAppPurchase")
  local cashPrice = "error"
  local lockTimer
  local saleGroup = display.newGroup()
  local iapPriceTimeout
  local tryingToBuy = false
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.7843137254901961)
  alphaBackground.x = 0
  alphaBackground.y = 0
  alphaBackground.isVisible = false
  local dropdownGroup = display.newGroup()
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/market/popup/window.png", 276, 253)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  
  local function createSaleIcon()
    local path, amount
    if item.saleTier then
      path = "images/gui/market/saleCash.png"
      amount = math.ceil(item.saleTier / item.tier * 100) - 100
      x = backgroundWindow.x + 90
    else
      path = "images/gui/market/saleCoins.png"
      amount = math.ceil(item.salePrice / item.price * 100) - 100
      x = backgroundWindow.x - 30
    end
    local saleBackground = display.newImageRect(path, 40, 35)
    saleBackground.x = x
    saleBackground.y = backgroundWindow.y + 230
    saleGroup:insert(saleBackground)
    local saleText = composer.newText({
      string = amount .. "%",
      size = 10,
      x = saleBackground.x,
      y = saleBackground.y + 4,
      color = {
        1,
        1,
        1
      }
    })
    saleGroup:insert(saleText)
  end
  
  local function getCashPrice()
    if event.params.itemIAPStatus == 1 then
      cashPrice = composer.localized.get("loading")
      event.params.itemIAPStatus = 3
    elseif item.saleTier and item.saleKey then
      cashPrice = inApp.getLocalizedPrice(item.saleTier, item.saleKey)
      createSaleIcon()
    elseif item.tier then
      cashPrice = inApp.getLocalizedPrice(item.tier, item.key)
    end
    return cashPrice
  end
  
  if item.salePrice then
    coinPrice = item.salePrice
    createSaleIcon()
  elseif item.price then
    coinPrice = item.price
  end
  local windowInfo = composer.newText({
    string = composer.localized.get("Purchase"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 65,
    size = 20,
    color = {
      1,
      1,
      1
    }
  })
  local itemInfo = composer.newText({
    string = item.title,
    x = backgroundWindow.x,
    y = backgroundWindow.y + 78,
    size = 16,
    color = {
      1,
      1,
      1
    }
  })
  local errorInfo = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 210,
    size = 12,
    width = 200,
    align = "center"
  })
  local overlayInfo = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 210,
    size = 20,
    width = 300,
    color = {
      1,
      1,
      1
    },
    align = "center"
  })
  local orText = composer.newText({
    string = composer.localized.get("or"),
    size = 14,
    x = windowInfo.x,
    y = windowInfo.y + 170,
    ax = 0.5,
    color = {
      1,
      1,
      1
    },
    size = 22
  })
  local descriptionText = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 94,
    size = 12
  })
  local plate = display.newImageRect("images/gui/lobby/" .. item.plate .. ".png", 54, 19)
  plate.x = backgroundWindow.x
  plate.y = backgroundWindow.y + 170
  local icon = display.newImageRect(item.imagePath, 65, 72)
  icon.x = backgroundWindow.x
  icon.y = backgroundWindow.y + 130
  local backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 70, 53)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 400
  backgroundCoins.y = 0
  local moneyValue = composer.database.getMoney()
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
  local moneyLabelRed = composer.newText({
    string = moneyValue,
    size = 14,
    x = 424,
    y = 40,
    ax = 0,
    color = {
      1,
      0,
      0
    }
  })
  moneyLabelRed.alpha = 0
  
  local function stopIAPCashTimer()
    if iapPriceTimeout then
      timer.cancel(iapPriceTimeout)
      iapPriceTimeout = nil
    end
  end
  
  local function stopTimers()
    if lockTimer then
      timer.cancel(lockTimer)
      lockTimer = nil
    end
    stopIAPCashTimer()
  end
  
  local function showAppAgain()
    composer.data.iapOverlayActive = false
    stopTimers()
    alphaBackground.isVisible = false
    overlayInfo.text = ""
  end
  
  local function unlockBasedOnTimeout()
    overlayInfo.text = ""
    errorInfo.text = composer.localized.get("timeout")
    showAppAgain()
  end
  
  local function lockScreen()
    composer.data.iapOverlayActive = true
    stopTimers()
    lockTimer = timer.performWithDelay(9000, unlockBasedOnTimeout)
    alphaBackground.isVisible = true
  end
  
  local function inAppCallback(text, failed)
    if type(text) == "string" then
      if failed then
        errorInfo.text = text
        showAppAgain()
      else
        overlayInfo.text = text
      end
    end
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.buyCrystalIOS() or data.m == httpsFormat.buyCrystalGoogle() or data.m == httpsFormat.buyCrystalAmazon() then
      tryingToBuy = false
      showAppAgain()
      if data.r then
        errorInfo.text = composer.localized.get("Invalid purchase")
      else
        composer.analytics.newEvent("design", {
          event_id = "market:cashPurchase:purchaseComplete:" .. item.key,
          value = item.tier,
          area = composer.config.fullVersion
        })
        composer.audio.play("buy_item")
        if item.mysteryBox then
          local options = {
            isModal = true,
            params = {mysteryBox = true}
          }
          composer.showOverlay("lua.overlays.messages", options)
        else
          overlayEndedData = data
          composer.hideOverlay()
        end
      end
    end
  end
  
  local function commCallback(data)
    if data.m == tcpFormat.purchaseItem() then
      tryingToBuy = false
      if data.r then
        if data.r == 61 then
          errorInfo.text = composer.localized.get("Not enough coins")
        elseif data.r == 25 then
          errorInfo.text = composer.localized.get("You already own this")
        elseif data.r == 73 then
          errorInfo.text = composer.localized.get("Item not unlocked")
        else
          errorInfo.text = composer.localized.get("Invalid purchase")
        end
      else
        overlayEndedData = data
        composer.audio.play("buy_item")
        composer.hideOverlay()
        composer.analytics.newEvent("design", {
          event_id = "market:coinPurchase:purchaseComplete:" .. item.key,
          value = moneyValue,
          area = composer.config.fullVersion
        })
      end
    end
  end
  
  local function giveCoinFeedback()
    local newSize = 1.2
    local timeToUse = 100
    local delayToUse = 200
    transition.to(moneyLabel, {
      time = timeToUse,
      xScale = newSize,
      yScale = newSize
    })
    transition.to(moneyLabel, {
      time = timeToUse,
      delay = delayToUse,
      xScale = 1,
      yScale = 1
    })
    transition.to(moneyLabelRed, {
      time = timeToUse,
      xScale = newSize,
      yScale = newSize,
      alpha = 1
    })
    transition.to(moneyLabelRed, {
      time = timeToUse,
      delay = delayToUse,
      xScale = 1,
      yScale = 1,
      alpha = 0
    })
  end
  
  local function btnWithCoinsRelease()
    if tryingToBuy then
      errorInfo.text = composer.localized.get("trying to buy item")
      return
    elseif moneyValue < coinPrice then
      composer.analytics.newEvent("design", {
        event_id = "market:coinPurchase:notEnough:" .. item.key,
        value = moneyValue,
        area = composer.config.fullVersion
      })
      composer.audio.play("no_powerup")
      giveCoinFeedback()
    else
      tryingToBuy = true
      errorInfo.text = composer.localized.get("Purchasing")
      composer.analytics.newEvent("design", {
        event_id = "market:coinPurchase:success:" .. item.key,
        value = moneyValue,
        area = composer.config.fullVersion
      })
      composer.comm.setCallback(commCallback)
      if item.saleKey and item.salePrice then
        composer.comm.purchaseItem(item.saleKey)
      else
        composer.comm.purchaseItem(item.key)
      end
    end
  end
  
  local btnWithCoins = composer.newButton({
    image = "images/gui/market/popup/buttonCoins.png",
    onRelease = btnWithCoinsRelease,
    text = {
      string = coinPrice,
      x = 0,
      y = 10,
      size = 14
    },
    width = 77,
    height = 50,
    x = backgroundWindow.x - 60,
    y = backgroundWindow.y + 250
  })
  
  local function btnWithCashRelease()
    if tryingToBuy then
      errorInfo.text = composer.localized.get("trying to buy item")
      return
    elseif item.mysteryBox and #composer.database.getFriends() < 1 then
      errorInfo.text = composer.localized.get("nofriends")
      return
    end
    if not composer.data.iapCallActive then
      composer.analytics.newEvent("design", {
        event_id = "market:cashPurchase:" .. item.key,
        value = item.tier,
        area = composer.config.fullVersion
      })
      overlayInfo.text = "contacting store"
      lockScreen()
      tryingToBuy = true
      if item.saleKey and item.saleTier then
        inApp.buyThis(item.saleTier, item.saleKey)
      else
        inApp.buyThis(item.tier, item.key)
      end
    else
      errorInfo.text = "iap in progress"
    end
  end
  
  local btnWithCash = composer.newButton({
    image = "images/gui/market/popup/buttonCash.png",
    onRelease = btnWithCashRelease,
    text = {
      string = getCashPrice(),
      x = 0,
      y = 10,
      size = 14
    },
    width = 77,
    height = 50,
    x = backgroundWindow.x + 60,
    y = backgroundWindow.y + 250
  })
  
  local function btnExitRelease()
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 100,
    y = backgroundWindow.y + 80
  })
  
  local function addjustButtons()
    if not item.price then
      btnWithCoins.isVisible = false
      orText.isVisible = false
      btnWithCash.x = -60
      saleGroup.x = -60
    end
    if not item.tier then
      btnWithCash.isVisible = false
      orText.isVisible = false
      btnWithCoins.x = 60
      saleGroup.x = 60
    end
  end
  
  local function checkForDescriptionText()
    if item.description then
      descriptionText.text = composer.localized.get(item.description)
    end
  end
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    sceneGroup:insert(backgroundCoins)
    sceneGroup:insert(moneyLabel)
    sceneGroup:insert(moneyLabelRed)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnWithCoins)
    dropdownGroup:insert(btnWithCash)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(itemInfo)
    dropdownGroup:insert(plate)
    dropdownGroup:insert(icon)
    dropdownGroup:insert(errorInfo)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(orText)
    dropdownGroup:insert(descriptionText)
    dropdownGroup:insert(saleGroup)
    sceneGroup:insert(dropdownGroup)
    sceneGroup:insert(alphaBackground)
    sceneGroup:insert(overlayInfo)
  end
  
  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end
  
  local function backgroundImageTouchEvent(event)
    if event.phase == "ended" then
    end
    return true
  end
  
  local function iapUpdated()
    stopIAPCashTimer()
    btnWithCash.changeText(getCashPrice())
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", backgroundImageTouchEvent)
    backgroundImage:addEventListener("touch", escapeTouchEvent)
    backgroundWindow:addEventListener("touch", backgroundImageTouchEvent)
    Runtime:addEventListener("iapDone", iapUpdated)
  end
  
  function clean()
    display.remove(btnWithCoins)
    display.remove(btnWithCash)
    display.remove(btnExit)
    stopTimers()
    alphaBackground:removeEventListener("touch", backgroundImageTouchEvent)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
    Runtime:removeEventListener("iapDone", iapUpdated)
  end
  
  updateDisplayGroups()
  addListeners()
  addjustButtons()
  checkForDescriptionText()
  composer.commHttps.setCallback(httpsCallback)
  inApp.setInAppPurchaseCallback(inAppCallback)
  composer.bouncer.down(dropdownGroup)
  if event.params.itemIAPStatus == 1 then
    iapPriceTimeout = timer.performWithDelay(5000, iapUpdated)
  end
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
