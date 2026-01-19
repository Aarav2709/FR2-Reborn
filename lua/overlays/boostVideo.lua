local composer = require("composer")
local videoModule = require("lua.ads.videoModule")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local sceneGroup = self.view
  local listenerRef
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  sceneGroup:insert(backgroundImage)
  local backgroundWindow = display.newImageRect("images/gui/postgame/adCointsPopup.png", 258, 221)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local itemInfo = composer.newText({
    string = composer.localized.get("adBoostInfo"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 170,
    size = 16,
    color = {
      1,
      1,
      1
    },
    width = 200,
    align = "center"
  })
  
  local function btnWatchVideoRelease()
    composer.adsTable.boostVideoActive = true
    videoModule.showAd()
    composer.hideOverlay()
  end
  
  local btnWatchVideo = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    onRelease = btnWatchVideoRelease,
    text = {
      string = composer.localized.get("Watch"),
      size = 16
    },
    width = 126,
    height = 40,
    x = backgroundWindow.x,
    y = backgroundWindow.y + 220
  })
  
  local function btnExitRelease()
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 120,
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
    sceneGroup:insert(backgroundWindow)
    sceneGroup:insert(btnWatchVideo)
    sceneGroup:insert(btnExit)
    sceneGroup:insert(itemInfo)
  end
  
  function clean()
    if listenerRef then
      timer.cancel(listenerRef)
      listenerRef = nil
    end
    display.remove(btnWatchVideo)
    display.remove(btnExit)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroups()
  listenerRef = timer.performWithDelay(700, addListeners)
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
    event.parent:overlayEnded()
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
