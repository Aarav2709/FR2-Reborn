local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local sceneGroup = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local dropdownGroup = display.newGroup()
  local facebookTimeout
  local canClickButton = true
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/login/window.png", 350, 137)
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 66
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
    y = backgroundWindow.y + 46,
    color = {
      1,
      1,
      1
    }
  })
  
  local function serverTimeout()
    canClickButton = true
    composer.config.loginMessage = false
    errorInfo.text = composer.localized.get("Could not access Facebook")
  end
  
  local function facebookCallback(data)
    if data.isError then
      serverTimeout()
    end
  end
  
  local function stopTimer()
    if facebookTimeout then
      timer.cancel(facebookTimeout)
      facebookTimeout = nil
    end
  end
  
  local function httpsCallback(data)
    if data.m == httpsFormat.loginWithFacebook() then
      canClickButton = true
      stopTimer()
      if data.r and data.r == 18 then
        errorInfo.text = composer.localized.get("NoFacebookAccount")
        composer.analytics.newEvent("design", {
          event_id = "continueLogin:invalidEmailPassword",
          area = composer.config.fullVersion
        })
      end
    end
  end
  
  local function btnEmailRelease()
    if not canClickButton then
      return
    end
    local options = {isModal = true}
    composer.showOverlay("lua.overlays.loginUserEmail", options)
  end
  
  local btnEmail = composer.newButton({
    image = "images/gui/common/buttonTextB.png",
    text = composer.localized.get("Email"),
    onRelease = btnEmailRelease,
    width = 126,
    height = 40,
    x = backgroundWindow.x + 70,
    y = backgroundWindow.y + 16
  })
  
  local function btnFacebookRelease()
    if not canClickButton then
      return
    end
    composer.config.loginMessage = true
    composer.facebook.login({
      "user_friends"
    }, facebookCallback)
    composer.analytics.newEvent("design", {
      event_id = "facebookLogin:attempt",
      area = composer.config.fullVersion
    })
    facebookTimeout = timer.performWithDelay(2 * composer.config.serverTimeout, serverTimeout)
    errorInfo.text = composer.localized.get("Loading")
    canClickButton = false
  end
  
  local btnFacebook = composer.newButton({
    image = "images/gui/common/buttonFacebook.png",
    text = {
      string = composer.localized.get("Facebook"),
      color = {
        1,
        1,
        1
      }
    },
    onRelease = btnFacebookRelease,
    width = 126,
    height = 40,
    x = backgroundWindow.x - 70,
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
  
  local function addListeners()
    backgroundImage:addEventListener("touch", escapeTouchEvent)
    backgroundWindow:addEventListener("touch", backgroundImageTouchEvent)
  end
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnEmail)
    dropdownGroup:insert(btnFacebook)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(errorInfo)
    sceneGroup:insert(dropdownGroup)
  end
  
  function clean()
    display.remove(btnExit)
    display.remove(btnFacebook)
    display.remove(btnEmail)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
    stopTimer()
  end
  
  updateDisplayGroups()
  addListeners()
  composer.bouncer.down(dropdownGroup)
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
