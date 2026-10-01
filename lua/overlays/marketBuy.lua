local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

-- The purchase sign is laid out in the shop's 480x320 design units: it hangs from
-- the top of the screen, and a copy of the shop's currency board stays visible
-- above the dimmed shop.
local DESIGN_W, DESIGN_H = 480, 320
local WINDOW_W, WINDOW_H = 276, 253

-- Items worn by the monster are previewed on it; everything else as a picture.
local PREVIEW_SLOTS = { avatars = 1, hat = 3, facewear = 4, neck = 5, shoes = 7 }

function scene:create(event)
  local sceneGroup = self.view
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local inApp = require("lua.iap.inAppPurchase")
  local params = event.params or {}
  local item = params.item or {}
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local moneyValue = composer.database.getMoney()
  local coinPrice = 0
  local gemPrice = item.gemPrice
  local cashPrice = "error"
  local moneyLabel, moneyLabelRed, gemLabel, gemLabelRed
  local lockTimer, iapPriceTimeout
  local tryingToBuy = false

  -- Text rasterised at its on-screen size, then scaled back into design units.
  local function newText(textParams)
    textParams.size = (textParams.size or 14) * s
    if textParams.width then
      textParams.width = textParams.width * s
    end
    local text = composer.newText(textParams)
    text.baseScale = 1 / s
    if textParams.maxWidth and text.width > 0 then
      text.baseScale = text.baseScale * math.min(1, textParams.maxWidth / (text.width / s))
    end
    text.xScale, text.yScale = text.baseScale, text.baseScale
    return text
  end

  local function newDesignGroup()
    local group = display.newGroup()
    group.xScale, group.yScale = s, s
    group.x, group.y = box.left, box.top
    return group
  end

  -- Dimmed shop behind the sign; tapping it closes the popup.
  local backgroundImage = display.newImageRect(sceneGroup, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  backgroundImage.x, backgroundImage.y = screen.centerX, screen.centerY

  local designGroup = newDesignGroup()
  sceneGroup:insert(designGroup)
  -- The sign drops in from above (composer.bouncer animates this group's y).
  local dropdownGroup = display.newGroup()
  designGroup:insert(dropdownGroup)
  local wx, wy = DESIGN_W * 0.5, box.T

  local backgroundWindow = display.newImageRect(dropdownGroup, "images/gui/market/popup/window.png", WINDOW_W, WINDOW_H)
  backgroundWindow.anchorY = 0
  backgroundWindow.x, backgroundWindow.y = wx, wy

  -- Currency board over the shop's own board.
  local currencyGroup = newDesignGroup()
  sceneGroup:insert(currencyGroup)
  local overlayCurrentCoins = display.newImageRect(currencyGroup, "images/gui/market/currentCoins.png", 70, 81)
  overlayCurrentCoins.anchorX, overlayCurrentCoins.anchorY = 0, 0
  overlayCurrentCoins.x, overlayCurrentCoins.y = box.SR - 80, box.T

  local function newCurrencyLabel(value, y, color)
    local label = newText({
      string = value,
      size = 14,
      x = overlayCurrentCoins.x + 24,
      y = overlayCurrentCoins.y + y,
      ax = 0,
      maxWidth = 42,
      color = color
    })
    currencyGroup:insert(label)
    return label
  end

  local function createCurrencyLabels()
    local gems = composer.database.getGems()
    moneyLabel = newCurrencyLabel(moneyValue, 69, { 1, 1, 1 })
    moneyLabelRed = newCurrencyLabel(moneyValue, 69, { 1, 0.2, 0.2 })
    moneyLabelRed.alpha = 0
    gemLabel = newCurrencyLabel(gems, 41, { 1, 1, 1 })
    gemLabelRed = newCurrencyLabel(gems, 41, { 1, 0.2, 0.2 })
    gemLabelRed.alpha = 0
  end
  createCurrencyLabels()

  local function setLabelText(label, value)
    if label and label.removeSelf then
      label.text = value
    end
  end

  if item.salePrice then
    coinPrice = item.salePrice
  elseif item.price then
    coinPrice = item.price
  end

  local windowInfo = newText({
    string = composer.localized.get("Purchase"),
    x = wx,
    y = wy + 65,
    size = 20,
    maxWidth = 170,
    color = { 1, 1, 1 }
  })
  dropdownGroup:insert(windowInfo)
  local itemInfo = newText({
    string = item.title or "",
    x = wx,
    y = wy + 79,
    size = 14,
    maxWidth = 170,
    color = { 1, 1, 1 }
  })
  dropdownGroup:insert(itemInfo)
  local errorInfo = newText({
    string = "",
    x = wx,
    y = wy + 214,
    size = 11,
    width = 200,
    align = "center",
    color = { 0.32, 0.18, 0.14 }
  })
  dropdownGroup:insert(errorInfo)
  local orText = newText({
    string = composer.localized.get("or"),
    x = wx,
    y = wy + 250,
    size = 18,
    color = { 1, 1, 1 }
  })
  dropdownGroup:insert(orText)
  local descriptionText = newText({
    string = "",
    x = wx,
    y = wy + 100,
    size = 9,
    width = 96,
    align = "center"
  })
  dropdownGroup:insert(descriptionText)

  local plate = display.newImageRect(dropdownGroup, "images/gui/lobby/" .. (item.plate or 1) .. ".png", 54, 19)
  if plate then
    plate.x, plate.y = wx, wy + 170
  end

  local function resolveAvatarIds(itemData)
    local skinId = itemData.skinId
    local characterId = itemData.characterId
    if not characterId and itemData.key then
      local keyNum = tonumber(itemData.key)
      if keyNum and keyNum > 100 and keyNum < 300 then
        characterId = keyNum - 100
      end
    end
    if not skinId and itemData.key then
      local storeItem = composer.storeConfig.getItem(tonumber(itemData.key))
      if type(storeItem) == "table" then
        skinId = storeItem.skinId
      end
    end
    return characterId, skinId or 0
  end

  -- Monster slot the item goes into, or nil when it isn't worn.
  local function getPreviewSlot(itemData)
    local itemType = tonumber(itemData.itemType)
    if itemType then
      return itemType
    end
    if itemData.skinId then
      return 2
    end
    local keyNum = tonumber(itemData.key)
    if not keyNum then
      return nil
    end
    if itemData.characterId and tonumber(itemData.characterId) ~= keyNum then
      return 2
    end
    return PREVIEW_SLOTS[composer.storeConfig.getItemCategory(keyNum)]
  end

  local function buildPreviewMonsterData(itemData)
    local slot = getPreviewSlot(itemData)
    if slot ~= 1 and slot ~= 2 and not PREVIEW_SLOTS[composer.storeConfig.getItemCategory(tonumber(itemData.key))] then
      return nil
    end
    local base = {}
    for i, value in ipairs(composer.database.getAvatarData() or {}) do
      base[i] = value
    end
    if #base < 7 then
      base = { 101, 0, 0, 0, 0, 0, 0 }
    end
    local keyNum = tonumber(itemData.key)
    local characterId, skinId = resolveAvatarIds(itemData)
    if slot == 1 then
      local avatarId = characterId or keyNum
      if avatarId then
        base[1] = avatarId
        base[2] = composer.database.getDefaultSkinForAvatar(avatarId) or 0
      end
    elseif slot == 2 then
      if characterId then
        base[1] = characterId
      end
      base[2] = keyNum or skinId or 0
    elseif slot and slot >= 3 and slot <= 7 then
      base[slot] = keyNum or 0
    end
    return base
  end

  local icon, avatarMonster
  local previewMonsterData = buildPreviewMonsterData(item)
  if previewMonsterData then
    local monsterLoader = require("spine-corona.monsterLoader")
    avatarMonster = monsterLoader.new(previewMonsterData)
    icon = avatarMonster.getGroup()
    icon.xScale, icon.yScale = 0.35, 0.35
    icon.x, icon.y = wx, wy + 168
    dropdownGroup:insert(icon)
  elseif item.imagePath then
    icon = display.newImageRect(dropdownGroup, item.imagePath, 65, 72)
    if icon then
      icon.x, icon.y = wx, wy + 130
    end
  end

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

  -- While the store is being contacted the screen is locked behind a dark layer.
  local alphaBackground = display.newRect(sceneGroup, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  alphaBackground:setFillColor(0, 0, 0, 0.78)
  alphaBackground.isVisible = false
  local lockGroup = newDesignGroup()
  sceneGroup:insert(lockGroup)
  local overlayInfo = newText({
    string = "",
    x = DESIGN_W * 0.5,
    y = box.T + 210,
    size = 20,
    width = 300,
    align = "center",
    color = { 1, 1, 1 }
  })
  lockGroup:insert(overlayInfo)

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
          composer.showOverlay("lua.overlays.messages", {
            isModal = true,
            params = { mysteryBox = true }
          })
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

  -- Offline purchases are settled against the local wallet straight away.
  local function completeLocalPurchase(currency, price)
    if currency == "coins" then
      composer.database.decreaseMoney(price)
      moneyValue = composer.database.getMoney()
      setLabelText(moneyLabel, moneyValue)
      setLabelText(moneyLabelRed, moneyValue)
    elseif currency == "gems" then
      composer.database.decreaseGems(price)
      local gemValue = composer.database.getGems()
      setLabelText(gemLabel, gemValue)
      setLabelText(gemLabelRed, gemValue)
    end
    composer.database.addItem(item.key)
    overlayEndedData = { localPurchase = true, i = item.key }
    composer.audio.play("buy_item")
    composer.hideOverlay()
  end

  -- "Not enough" feedback: the balance pulses and flashes red.
  local function pulseLabel(label, redLabel)
    local pulse = 1.2
    if label and label.removeSelf then
      local base = label.baseScale or 1
      transition.to(label, { time = 100, xScale = base * pulse, yScale = base * pulse })
      transition.to(label, { time = 100, delay = 200, xScale = base, yScale = base })
    end
    if redLabel and redLabel.removeSelf then
      local base = redLabel.baseScale or 1
      transition.to(redLabel, { time = 100, xScale = base * pulse, yScale = base * pulse, alpha = 1 })
      transition.to(redLabel, { time = 100, delay = 200, xScale = base, yScale = base, alpha = 0 })
    end
  end

  local function btnWithCoinsRelease()
    if tryingToBuy then
      errorInfo.text = composer.localized.get("trying to buy item")
      return
    end
    moneyValue = composer.database.getMoney()
    setLabelText(moneyLabel, moneyValue)
    setLabelText(moneyLabelRed, moneyValue)
    if moneyValue < coinPrice then
      local marketScene = composer.getScene("lua.scenes.marketplace")
      if marketScene and marketScene.flashMarketCoins then
        marketScene.flashMarketCoins()
      end
      composer.analytics.newEvent("design", {
        event_id = "market:coinPurchase:notEnough:" .. item.key,
        value = moneyValue,
        area = composer.config.fullVersion
      })
      composer.audio.play("no_powerup")
      pulseLabel(moneyLabel, moneyLabelRed)
    elseif composer.config.offlineMode or not (composer.comm and composer.comm.isOnline and composer.comm.isOnline()) then
      completeLocalPurchase("coins", coinPrice)
    else
      tryingToBuy = true
      errorInfo.text = composer.localized.get("Purchasing")
      composer.analytics.newEvent("design", {
        event_id = "market:coinPurchase:success:" .. item.key,
        value = moneyValue,
        area = composer.config.fullVersion
      })
      if composer.comm.setCallback then
        composer.comm.setCallback(commCallback)
        if item.saleKey and item.salePrice then
          composer.comm.purchaseItem(item.saleKey)
        else
          composer.comm.purchaseItem(item.key)
        end
      else
        completeLocalPurchase("coins", coinPrice)
      end
    end
  end

  local function btnWithGemsRelease()
    if tryingToBuy then
      errorInfo.text = composer.localized.get("trying to buy item")
      return
    end
    if not gemPrice then
      return
    end
    local gemValue = composer.database.getGems()
    setLabelText(gemLabel, gemValue)
    setLabelText(gemLabelRed, gemValue)
    if gemValue < gemPrice then
      local marketScene = composer.getScene("lua.scenes.marketplace")
      if marketScene and marketScene.flashMarketGems then
        marketScene.flashMarketGems()
      end
      composer.analytics.newEvent("design", {
        event_id = "market:gemPurchase:notEnough:" .. item.key,
        value = gemValue,
        area = composer.config.fullVersion
      })
      composer.audio.play("no_powerup")
      pulseLabel(gemLabel, gemLabelRed)
    else
      completeLocalPurchase("gems", gemPrice)
    end
  end

  local function getCashPrice()
    if params.itemIAPStatus == 1 then
      cashPrice = composer.localized.get("loading")
      params.itemIAPStatus = 3
    elseif item.saleTier and item.saleKey then
      cashPrice = inApp.getLocalizedPrice(item.saleTier, item.saleKey)
    elseif item.tier then
      cashPrice = inApp.getLocalizedPrice(item.tier, item.key)
    end
    return cashPrice
  end

  local function btnWithCashRelease()
    if tryingToBuy then
      errorInfo.text = composer.localized.get("trying to buy item")
      return
    elseif item.mysteryBox and #composer.database.getFriends() < 1 then
      errorInfo.text = composer.localized.get("nofriends")
      return
    end
    if composer.config.offlineMode or not (composer.comm and composer.comm.isOnline and composer.comm.isOnline()) then
      completeLocalPurchase("coins", 0)
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

  -- Price buttons hang from the bottom edge of the sign.
  local function newPriceButton(image, label, onRelease)
    local button = composer.newButton({
      image = image,
      onRelease = onRelease,
      text = {
        string = label,
        x = 0,
        y = 10,
        size = 14
      },
      width = 77,
      height = 50,
      x = 0,
      y = 0
    })
    dropdownGroup:insert(button)
    return button
  end

  local btnWithCoins = newPriceButton("images/gui/market/popup/buttonCoins.png", coinPrice, btnWithCoinsRelease)
  local btnWithGems = newPriceButton("images/gui/market/popup/buttonGems.png", gemPrice or "", btnWithGemsRelease)
  local btnWithCash = newPriceButton("images/gui/market/popup/buttonCash.png", getCashPrice(), btnWithCashRelease)

  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopupBrown.png",
    onRelease = function()
      composer.hideOverlay()
    end,
    width = 43,
    height = 38,
    x = wx + 120,
    y = wy + 84
  })
  dropdownGroup:insert(btnExit)

  -- Sale badge in the top-left corner of the discounted price button.
  local function addSaleBadge(button)
    local path, amount
    if item.saleTier and item.tier then
      path = "images/gui/market/saleCash.png"
      amount = math.ceil(item.saleTier / item.tier * 100) - 100
    elseif item.salePrice and item.price then
      path = "images/gui/market/saleCoins.png"
      amount = math.ceil(item.salePrice / item.price * 100) - 100
    end
    if not path or not button then
      return
    end
    local badge = display.newImageRect(dropdownGroup, path, 40, 35)
    badge.x, badge.y = button.x - 30, button.y - 20
    local badgeText = newText({
      string = amount .. "%",
      size = 10,
      x = badge.x,
      y = badge.y + 4,
      color = { 1, 1, 1 }
    })
    dropdownGroup:insert(badgeText)
  end

  local function arrangeButtons()
    btnWithCoins.isVisible = item.price ~= nil or item.salePrice ~= nil
    btnWithGems.isVisible = gemPrice ~= nil
    btnWithCash.isVisible = item.tier ~= nil and not composer.config.offlineMode
    if not (btnWithCoins.isVisible or btnWithGems.isVisible or btnWithCash.isVisible) then
      -- Free items still need a way to claim them.
      btnWithCoins.isVisible = true
      btnWithCoins.changeText("0")
    end
    local buttons = {}
    for _, button in ipairs({ btnWithCoins, btnWithGems, btnWithCash }) do
      if button.isVisible then
        buttons[#buttons + 1] = button
      end
    end
    local spacing = #buttons == 2 and 120 or 90
    local firstX = wx - spacing * (#buttons - 1) * 0.5
    for i, button in ipairs(buttons) do
      button.x, button.y = firstX + (i - 1) * spacing, wy + WINDOW_H - 3
    end
    orText.isVisible = #buttons == 2
    orText.y = wy + WINDOW_H - 3
    if item.saleTier and btnWithCash.isVisible then
      addSaleBadge(btnWithCash)
    elseif item.salePrice and btnWithCoins.isVisible then
      addSaleBadge(btnWithCoins)
    end
  end

  local function checkForDescriptionText()
    if item.description then
      descriptionText.text = composer.localized.get(item.description)
    elseif item.coinMultiplier then
      descriptionText.text = composer.localized.get("DoubleCoinsDesc")
    end
  end

  local function escapeTouchEvent(event)
    if event.phase == "ended" and not composer.data.iapOverlayActive then
      composer.hideOverlay()
    end
    return true
  end

  local function blockTouchEvent()
    return true
  end

  local function iapUpdated()
    stopIAPCashTimer()
    if btnWithCash.changeText then
      btnWithCash.changeText(getCashPrice())
    end
  end

  function clean()
    display.remove(btnWithCoins)
    display.remove(btnWithGems)
    display.remove(btnWithCash)
    display.remove(btnExit)
    if avatarMonster and avatarMonster.clean then
      avatarMonster.clean()
      avatarMonster = nil
    end
    stopTimers()
    alphaBackground:removeEventListener("touch", blockTouchEvent)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", blockTouchEvent)
    Runtime:removeEventListener("iapDone", iapUpdated)
  end

  alphaBackground:addEventListener("touch", blockTouchEvent)
  backgroundImage:addEventListener("touch", escapeTouchEvent)
  backgroundWindow:addEventListener("touch", blockTouchEvent)
  Runtime:addEventListener("iapDone", iapUpdated)
  arrangeButtons()
  checkForDescriptionText()
  composer.commHttps.setCallback(httpsCallback)
  inApp.setInAppPurchaseCallback(inAppCallback)
  composer.bouncer.down(dropdownGroup)
  if params.itemIAPStatus == 3 then
    iapPriceTimeout = timer.performWithDelay(5000, iapUpdated)
  end
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
