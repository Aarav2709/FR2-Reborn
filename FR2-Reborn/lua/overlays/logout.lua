local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local startedClean = false
  local addListenersTimer
  local dropdownGroup = display.newGroup()
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/login/window.png", 350, 137)
  tableBackground.anchorX = 0.5
  tableBackground.anchorY = 0
  tableBackground.x = 240
  tableBackground.y = 0
  local info = composer.newText({
    string = composer.localized.get("AreYouSure"),
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
  
  local function closeButtonEvent()
    composer.hideOverlay()
  end
  
  local closeButton = composer.newButton({
    x = 400,
    y = 26,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeButtonEvent
  })
  
  local function logoutEvent()
    local function changeScene()
      composer.gotoScene("lua.scenes.startScreen")
      
      composer.removeScene("lua.scenes.mainMenu")
      composer.removeScene("lua.scenes.settings")
      composer.removeScene("lua.scenes.playMenu")
    end
    
    composer.hideOverlay()
    composer.comm.stopTCPSocial()
    composer.facebook.stopDelayedTimer()
    composer.database.reset()
    timer.performWithDelay(200, changeScene, 1)
  end
  
  local logoutButton = composer.newButton({
    x = 240,
    y = 86,
    width = 126,
    height = 40,
    image = "images/gui/common/buttonTextA.png",
    text = {
      string = composer.localized.get("LogOut"),
      x = 0,
      y = 0
    },
    onRelease = logoutEvent
  })
  
  local function closeOnTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end
  
  local function doNothingOnTouchEvent(event)
    return true
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    dropdownGroup:insert(tableBackground)
    dropdownGroup:insert(info)
    dropdownGroup:insert(closeButton)
    dropdownGroup:insert(logoutButton)
    group:insert(dropdownGroup)
  end
  
  local function addListeners()
    if not startedClean then
      alphaBackground:addEventListener("touch", closeOnTouchEvent)
      tableBackground:addEventListener("touch", doNothingOnTouchEvent)
      tableBackground:addEventListener("tap", doNothingOnTouchEvent)
    end
  end
  
  function clean()
    if startedClean then
      return
    end
    startedClean = true
    if addListenersTimer then
      timer.cancel(addListenersTimer)
      addListenersTimer = nil
    end
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    tableBackground:removeEventListener("tap", doNothingOnTouchEvent)
  end
  
  updateDisplayGroup()
  addListenersTimer = timer.performWithDelay(200, addListeners)
  composer.bouncer.down(dropdownGroup)
end

function scene:show(event)
  local screenGroup = self.view
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
  local phase = event.phase
  if phase == "did" then
    return
  end
  if cleanEnter then
    cleanEnter()
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
