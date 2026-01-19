local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local sceneGroup = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local dropdownGroup = display.newGroup()
  local timeoutTimer
  local canClickButton = true
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/login/window.png", 350, 137)
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 66
  local emailTextField, passowrdTextField
  local textFieldSize = 25
  if isAndroid then
    textFieldSize = 35
  end
  local windowInfo = composer.newText({
    string = composer.localized.get("Login"),
    x = backgroundWindow.x,
    y = backgroundWindow.y - 44,
    size = 25,
    color = {
      1,
      1,
      1
    }
  })
  local errorInfo = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 48,
    color = {
      1,
      1,
      1
    }
  })
  local mailInfo = composer.newText({
    string = composer.localized.get("Email"),
    x = backgroundWindow.x - 116,
    y = backgroundWindow.y - 6,
    color = {
      1,
      1,
      1
    }
  })
  local passwordInfo = composer.newText({
    string = composer.localized.get("Password"),
    x = backgroundWindow.x - 116,
    y = backgroundWindow.y + 26,
    color = {
      1,
      1,
      1
    }
  })
  
  local function stopTimer()
    if timeoutTimer then
      timer.cancel(timeoutTimer)
      timeoutTimer = nil
    end
  end
  
  local function escapeTouchEvent(event)
    if event.phase == "ended" then
      if false then
        native.setKeyboardFocus(nil)
      else
        composer.hideOverlay()
      end
    end
    return true
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.loginWithEmail() then
      canClickButton = true
      stopTimer()
      if data.r and data.r == 17 then
        errorInfo.text = composer.localized.get("wrong username or password")
        composer.analytics.newEvent("design", {
          event_id = "continueLogin:invalidEmailPassword",
          area = composer.config.fullVersion
        })
      end
    end
  end
  
  local function backgroundImageTouchEvent(event)
    if event.phase == "ended" then
      native.setKeyboardFocus(nil)
    end
    return true
  end
  
  local function serverTimeout()
    canClickButton = true
    errorInfo.text = composer.localized.get("Could not connect to server")
  end
  
  local function btnNextRelease()
    local email, emailError = composer.validateInput.validateEmail(emailTextField.text)
    local password, passwordError = composer.validateInput.validatePassword(passowrdTextField.text)
    if not email then
      errorInfo.text = emailError
      composer.analytics.newEvent("design", {
        event_id = "loginUserEmail:invalidEmail",
        area = composer.config.fullVersion
      })
    elseif not password then
      errorInfo.text = passwordError
      composer.analytics.newEvent("design", {
        event_id = "loginUserEmail:invalidPassword",
        area = composer.config.fullVersion
      })
    elseif email and password then
      errorInfo.text = composer.localized.get("Loading")
      composer.commHttps.loginWithEmail(email, password)
      timeoutTimer = timer.performWithDelay(composer.config.serverTimeout, serverTimeout, 1)
      composer.analytics.newEvent("design", {
        event_id = "continueLogin:attempt",
        area = composer.config.fullVersion
      })
    else
      errorInfo.text = composer.localized.get("UsernameAndPassword")
    end
  end
  
  local btnNext = composer.newButton({
    image = "images/gui/login/buttonNext.png",
    onRelease = btnNextRelease,
    width = 62,
    height = 45,
    x = backgroundWindow.x + 130,
    y = backgroundWindow.y + 16
  })
  
  local function btnExitRelease()
    native.setKeyboardFocus(nil)
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 158,
    y = backgroundWindow.y + -40
  })
  
  local function btnForgotPasswordRelease()
    native.setKeyboardFocus(nil)
    local options = {isModal = true}
    composer.showOverlay("lua.overlays.forgotPassword", options)
  end
  
  local btnForgotPassword = composer.newButton({
    image = "images/gui/login/forgotPassword.png",
    onRelease = btnForgotPasswordRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 110,
    y = backgroundWindow.y + -40
  })
  emailTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 150, textFieldSize)
  emailTextField.anchorX = 0.5
  emailTextField.anchorY = 0.5
  emailTextField.x = mailInfo.x + 120
  emailTextField.y = mailInfo.y
  emailTextField.inputType = "email"
  emailTextField.userInput = composer.validateInput.limitTextField(255)
  emailTextField:addEventListener("userInput", emailTextField.userInput)
  passowrdTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 150, textFieldSize)
  passowrdTextField.anchorX = 0.5
  passowrdTextField.anchorY = 0.5
  passowrdTextField.x = passwordInfo.x + 120
  passowrdTextField.y = passwordInfo.y
  passowrdTextField.isSecure = true
  passowrdTextField.userInput = composer.validateInput.limitTextField(15)
  passowrdTextField:addEventListener("userInput", passowrdTextField.userInput)
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnNext)
    dropdownGroup:insert(emailTextField)
    dropdownGroup:insert(passowrdTextField)
    dropdownGroup:insert(btnForgotPassword)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(mailInfo)
    dropdownGroup:insert(passwordInfo)
    dropdownGroup:insert(errorInfo)
    sceneGroup:insert(dropdownGroup)
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
  
  local function addListeners()
    backgroundImage:addEventListener("touch", escapeTouchEvent)
    backgroundWindow:addEventListener("touch", backgroundImageTouchEvent)
  end
  
  function clean()
    display.remove(btnNext)
    display.remove(btnExit)
    display.remove(btnForgotPassword)
    stopTimer()
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
    emailTextField:removeEventListener("userInput", emailTextField)
  end
  
  updateDisplayGroups()
  addListeners()
  composer.commHttps.setCallback(httpsCallback)
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
  elseif phase == "did" then
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
