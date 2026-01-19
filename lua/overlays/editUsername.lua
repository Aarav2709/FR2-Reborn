local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, nameTextField

function scene:create(event)
  local group = self.view
  local money = composer.database.getMoney()
  local price = "error"
  local dropdownGroup = display.newGroup()
  price = composer.storeConfig.getUsernameChangePrice()
  local textFieldSize = 25
  local contiuneButton
  if isAndroid then
    textFieldSize = 35
  end
  local background = display.newImageRect("images/gui/settings/windowRename.png", 350, 137)
  background.anchorX = 0.5
  background.anchorY = 0
  background.x = 240
  background.y = 0
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
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local info = composer.newText({
    string = composer.localized.get("SetUsername"),
    size = 25,
    color = {
      1,
      1,
      1
    }
  })
  info.anchorX = 0.5
  info.anchorY = 0.5
  info.x = 240
  info.y = 25
  local inputFieldDescriptionText = composer.newText({
    string = composer.localized.get("Username"),
    color = {
      1,
      1,
      1
    }
  })
  inputFieldDescriptionText.anchorX = 0.5
  inputFieldDescriptionText.anchorY = 0.5
  inputFieldDescriptionText.x = 125
  inputFieldDescriptionText.y = 80
  local infoText = composer.newText({string = ""})
  infoText.anchorX = 0.5
  infoText.anchorY = 0.5
  infoText.x = 240
  infoText.y = 110
  nameTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 150, textFieldSize)
  nameTextField.anchorX = 0.5
  nameTextField.anchorY = 0.5
  nameTextField.x = 240
  nameTextField.y = 80
  nameTextField.userInput = composer.validateInput.limitTextField(15)
  nameTextField:addEventListener("userInput", nameTextField.userInput)
  nameTextField.text = composer.database.getPlayerInformation().username
  
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
  
  local function canPlayerAffordItem()
    local money = composer.database.getMoney()
    if price and money >= price then
      composer.analytics.newEvent("design", {
        event_id = "rename:coins",
        area = composer.config.fullVersion
      })
      return true
    else
      giveCoinFeedback()
      return false
    end
  end
  
  local function closeButtonEvent()
    composer.hideOverlay()
    native.setKeyboardFocus(nil)
  end
  
  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
      native.setKeyboardFocus(nil)
    end
    return true
  end
  
  local function backgroundImageTouchEvent(event)
    if event.phase == "ended" then
      native.setKeyboardFocus(nil)
    end
    return true
  end
  
  local closeButton = composer.newButton({
    x = 380,
    y = 26,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeButtonEvent
  })
  
  local function continueButtonEvent()
    if canPlayerAffordItem() then
      local newName, nameError = composer.validateInput.validateUsername(nameTextField.text)
      if not newName then
        infoText.text = composer.localized.get(nameError)
        composer.analytics.newEvent("design", {
          event_id = "renameUser:invalidUsername",
          area = composer.config.fullVersion
        })
      else
        composer.commHttps.changeUsername(newName)
        composer.analytics.newEvent("design", {
          event_id = "renameUser:attempt",
          area = composer.config.fullVersion
        })
        composer.hideOverlay()
      end
    end
  end
  
  contiuneButton = composer.newButton({
    x = 350,
    y = 80,
    width = 62,
    height = 45,
    text = {
      string = price,
      y = 7,
      x = 0
    },
    image = "images/gui/settings/buttonRenameCoins.png",
    onRelease = continueButtonEvent
  })
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    dropdownGroup:insert(background)
    dropdownGroup:insert(backgroundCoins)
    dropdownGroup:insert(moneyLabel)
    dropdownGroup:insert(moneyLabelRed)
    dropdownGroup:insert(info)
    dropdownGroup:insert(nameTextField)
    dropdownGroup:insert(inputFieldDescriptionText)
    dropdownGroup:insert(infoText)
    dropdownGroup:insert(closeButton)
    dropdownGroup:insert(contiuneButton)
    group:insert(dropdownGroup)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", escapeTouchEvent)
    background:addEventListener("touch", backgroundImageTouchEvent)
  end
  
  function clean()
    display.remove(closeButton)
    display.remove(contiuneButton)
    native.setKeyboardFocus(nil)
    nameTextField:removeEventListener("userInput", nameTextField)
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    background:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroup()
  addListeners()
  if not isAndroid then
    native.setKeyboardFocus(nameTextField)
  end
  composer.bouncer.down(dropdownGroup)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local group = self.view
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.isOverlay(false)
  end
  
  androidLogic.isOverlay(true)
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  local group = self.view
  cleanEnter()
end

function scene:destroy(event)
  local group = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
