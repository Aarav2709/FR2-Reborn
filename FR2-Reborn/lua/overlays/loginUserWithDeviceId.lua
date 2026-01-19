local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local sceneGroup = self.view
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local dropdownGroup = display.newGroup()
  local canClickButton = true
  local username = ""
  if event.params and event.params.username then
    username = event.params.username
  end
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/login/window.png", 350, 137)
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 66
  local windowInfo = composer.newText({
    string = composer.localized.get("OldUser"),
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
  local usernameInfo = composer.newText({
    string = composer.localized.get("OldUserInfo") .. username,
    x = backgroundWindow.x,
    y = backgroundWindow.y - 4,
    color = {
      1,
      1,
      1
    },
    width = 250,
    align = "center"
  })
  local usernameInfo2 = composer.newText({
    string = composer.localized.get("OldUserInfo2"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 32,
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
  
  local function btnNoRelease()
    if not canClickButton then
      return
    end
    composer.hideOverlay()
  end
  
  local btnNo = composer.newButton({
    image = "images/gui/common/buttonTextB.png",
    text = composer.localized.get("No"),
    onRelease = btnNoRelease,
    width = 126,
    height = 40,
    x = backgroundWindow.x + 70,
    y = backgroundWindow.y + 70
  })
  
  local function btnYesRelease()
    if not canClickButton then
      return
    end
    canClickButton = false
    composer.commHttps.loginWithDeviceId()
  end
  
  local btnYes = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = composer.localized.get("Yes"),
    onRelease = btnYesRelease,
    width = 126,
    height = 40,
    x = backgroundWindow.x - 70,
    y = backgroundWindow.y + 70
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
    dropdownGroup:insert(btnNo)
    dropdownGroup:insert(btnYes)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(errorInfo)
    dropdownGroup:insert(usernameInfo2)
    dropdownGroup:insert(usernameInfo)
    sceneGroup:insert(dropdownGroup)
  end
  
  function clean()
    display.remove(btnYes)
    display.remove(btnNo)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroups()
  addListeners()
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
