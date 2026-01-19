local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, nameTextField

function scene:create(event)
  local group = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local textFieldSize = 25
  local timeoutTimer
  local dropdownGroup = display.newGroup()
  local updateButton
  if isAndroid then
    textFieldSize = 30
  end
  local tempEmail = ""
  local background = display.newImageRect("images/gui/login/window.png", 350, 137)
  background.anchorX = 0.5
  background.anchorY = 0
  background.x = 240
  background.y = 0
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local info = composer.newText({
    string = composer.localized.get("Edit Email"),
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
  local emailFieldDescriptionText = composer.newText({
    string = composer.localized.get("Email"),
    color = {
      1,
      1,
      1
    }
  })
  emailFieldDescriptionText.anchorX = 0.5
  emailFieldDescriptionText.anchorY = 0.5
  emailFieldDescriptionText.x = 125
  emailFieldDescriptionText.y = 80
  local infoText = composer.newText({string = ""})
  infoText.anchorX = 0.5
  infoText.anchorY = 0.5
  infoText.x = 240
  infoText.y = 118
  local emailTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 150, textFieldSize)
  emailTextField.anchorX = 0.5
  emailTextField.anchorY = 0.5
  emailTextField.x = 240
  emailTextField.y = 80
  emailTextField.userInput = composer.validateInput.limitTextField(255)
  emailTextField:addEventListener("userInput", emailTextField.userInput)
  if composer.data.playerInfo.email then
    emailTextField.text = composer.data.playerInfo.email
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
    x = 400,
    y = 26,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeButtonEvent
  })
  
  local function showUpdateButton(bool)
    updateButton.isVisible = bool
  end
  
  local function timoutFromServer()
    infoText.text = composer.localized.get("NoResponse")
    showUpdateButton(true)
  end
  
  local function stopTimer()
    if timeoutTimer then
      timer.cancel(timeoutTimer)
      timeoutTimer = nil
    end
  end
  
  local function updateButtonEvent()
    local email = emailTextField.text
    if email and string.len(email) > 1 then
      local validEmail, emailError = composer.validateInput.validateEmail(email)
      if not validEmail then
        infoText.text = composer.localized.get(emailError)
        composer.analytics.newEvent("design", {
          event_id = "updateAccount:email:invalidEmail",
          area = composer.config.fullVersion
        })
      else
        infoText.text = composer.localized.get("SettingEmail")
        composer.commHttps.changeEmail(validEmail, nil)
        tempEmail = validEmail
        stopTimer()
        timeoutTimer = timer.performWithDelay(composer.config.serverTimeout, timoutFromServer, 1)
        showUpdateButton(false)
        composer.analytics.newEvent("design", {
          event_id = "updateAccount:email:attempt",
          area = composer.config.fullVersion
        })
      end
    else
      infoText.text = composer.localized.get("PleaseEnterEmail")
    end
  end
  
  updateButton = composer.newButton({
    x = 350,
    y = 80,
    width = 62,
    height = 45,
    image = "images/gui/login/buttonNext.png",
    onRelease = updateButtonEvent
  })
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    dropdownGroup:insert(background)
    dropdownGroup:insert(info)
    dropdownGroup:insert(emailTextField)
    dropdownGroup:insert(emailFieldDescriptionText)
    dropdownGroup:insert(infoText)
    dropdownGroup:insert(closeButton)
    dropdownGroup:insert(updateButton)
    group:insert(dropdownGroup)
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.changeEmail() then
      stopTimer()
      if data.r then
        if data.r == 1 then
          infoText.text = composer.localized.get("NotValidInput")
          composer.analytics.newEvent("design", {
            event_id = "updateAccount:email:invalidInputResponse",
            area = composer.config.fullVersion
          })
        elseif data.r == 10 then
          infoText.text = composer.localized.get("NotValidSession")
          composer.analytics.newEvent("design", {
            event_id = "updateAccount:email:invalidUserResponse",
            area = composer.config.fullVersion
          })
        elseif data.r == 11 then
          infoText.text = composer.localized.get("This email is already in use.")
          composer.analytics.newEvent("design", {
            event_id = "updateAccount:email:emailAlreadyExists",
            area = composer.config.fullVersion
          })
        end
        showUpdateButton(true)
      else
        infoText.text = composer.localized.get("EmailUpdated")
        composer.data.playerInfo.email = tempEmail
        composer.analytics.newEvent("design", {
          event_id = "updateAccount:email:success",
          area = composer.config.fullVersion
        })
        
        local function hideAccountOverlay()
          composer.hideOverlay()
        end
        
        timer.performWithDelay(1000, hideAccountOverlay)
      end
    end
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", escapeTouchEvent)
    background:addEventListener("touch", backgroundImageTouchEvent)
  end
  
  function clean()
    display.remove(closeButton)
    display.remove(updateButton)
    native.setKeyboardFocus(nil)
    emailTextField:removeEventListener("userInput", emailTextField)
    alphaBackground:removeEventListener("touch", escapeTouchEvent)
    background:removeEventListener("touch", backgroundImageTouchEvent)
    stopTimer()
  end
  
  updateDisplayGroup()
  addListeners()
  composer.commHttps.setCallback(httpsCallback)
  if not isAndroid then
    native.setKeyboardFocus(emailTextField)
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
