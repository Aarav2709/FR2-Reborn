local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local sceneGroup = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local dropdownGroup = display.newGroup()
  local forgotPasswordTimeout
  local canClickButton = true
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/login/window.png", 350, 137)
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 66
  local mailTextField
  local textFieldSize = 25
  if isAndroid then
    textFieldSize = 35
  end
  local windowInfo = composer.newText({
    string = composer.localized.get("ForgotPassword"),
    x = backgroundWindow.x,
    y = backgroundWindow.y - 44,
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
    y = backgroundWindow.y + 50,
    color = {
      1,
      1,
      1
    }
  })
  local mailInfo = composer.newText({
    string = composer.localized.get("Email"),
    x = backgroundWindow.x - 116,
    y = backgroundWindow.y + 20,
    color = {
      1,
      1,
      1
    }
  })
  local userInfo = composer.newText({
    string = composer.localized.get("ForgotPasswordHelp"),
    x = backgroundWindow.x,
    y = backgroundWindow.y - 16,
    color = {
      1,
      1,
      1
    },
    size = 14
  })
  
  local function stopTimer()
    if forgotPasswordTimeout then
      timer.cancel(forgotPasswordTimeout)
      forgotPasswordTimeout = nil
    end
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.forgotPassword() then
      canClickButton = true
      stopTimer()
      if data.r then
        if data.r == 76 then
          errorInfo.text = composer.localized.get("No account with that email. Please check your spelling.")
        else
          errorInfo.text = composer.localized.get("ErrorTryLater")
        end
        return
      else
        errorInfo.text = composer.localized.get("ForgotPasswordHelpSuccess")
      end
    end
  end
  
  local function serverTimeout()
    canClickButton = true
    errorInfo.text = composer.localized.get("Could not connect to server")
  end
  
  local function btnNextRelease()
    if not canClickButton then
      return
    end
    local email, emailError = composer.validateInput.validateEmail(mailTextField.text)
    if not email then
      print("nameError ", nameError)
      errorInfo.text = emailError
      composer.analytics.newEvent("design", {
        event_id = "forgotPassword:invalidEmail",
        area = composer.config.fullVersion
      })
    else
      composer.commHttps.forgotPassword(email)
      composer.analytics.newEvent("design", {
        event_id = "forgotPassword:attempt",
        area = composer.config.fullVersion
      })
      errorInfo.text = composer.localized.get("Loading")
      forgotPasswordTimeout = timer.performWithDelay(composer.config.serverTimeout, serverTimeout)
      canClickButton = false
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
  mailTextField = native.newTextField(display.contentWidth * 4, display.contentHeight * 0.2, 150, textFieldSize)
  mailTextField.anchorX = 0.5
  mailTextField.anchorY = 0.5
  mailTextField.x = mailInfo.x + 120
  mailTextField.y = mailInfo.y
  mailTextField.userInput = composer.validateInput.limitTextField(255)
  mailTextField:addEventListener("userInput", mailTextField.userInput)
  
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
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnNext)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(mailInfo)
    dropdownGroup:insert(userInfo)
    dropdownGroup:insert(mailTextField)
    dropdownGroup:insert(errorInfo)
    dropdownGroup:insert(windowInfo)
    sceneGroup:insert(dropdownGroup)
  end
  
  function clean()
    display.remove(btnNext)
    display.remove(btnExit)
    native.setKeyboardFocus(nil)
    stopTimer()
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
    mailTextField:removeEventListener("userInput", mailTextField)
  end
  
  updateDisplayGroups()
  addListeners()
  if not isAndroid then
    native.setKeyboardFocus(mailTextField)
  end
  composer.commHttps.setCallback(httpsCallback)
  composer.bouncer.down(dropdownGroup)
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
