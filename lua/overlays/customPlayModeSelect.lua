local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local setGameModeFunction = event.params.setGameModeFunction
  local sceneGroup = self.view
  local dropdownGroup = display.newGroup()
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  sceneGroup:insert(backgroundImage)
  local backgroundWindow = display.newImageRect("images/gui/customplay/popupWindow.png", 211, 161)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local windowInfo = composer.newText({
    string = composer.localized.get("Select"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 64,
    size = 20,
    color = {
      1,
      1,
      1
    }
  })
  local itemInfo = composer.newText({
    string = "game mode",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 78,
    size = 16,
    color = {
      1,
      1,
      1
    }
  })
  
  local function btnQuickPlayRelease()
    setGameModeFunction(1)
    composer.hideOverlay()
  end
  
  local btnQuickPlay = composer.newButton({
    image = "images/gui/customplay/buttonQuickplay.png",
    onRelease = btnQuickPlayRelease,
    text = {
      string = composer.localized.get("QuickPlay"),
      x = 0,
      y = 10,
      size = 13
    },
    width = 75,
    height = 48,
    x = backgroundWindow.x - 50,
    y = backgroundWindow.y + 120
  })
  
  local function btnCustomPlayRelease()
    local options = {
      isModal = true,
      params = {setGameModeFunction = setGameModeFunction}
    }
    composer.showOverlay("lua.overlays.customPlayMapSelect", options)
  end
  
  local btnCustomPlay = composer.newButton({
    image = "images/gui/customplay/buttonCustom.png",
    onRelease = btnCustomPlayRelease,
    text = {
      string = composer.localized.get("CustomMap"),
      x = 0,
      y = 10,
      size = 12
    },
    width = 75,
    height = 48,
    x = backgroundWindow.x + 50,
    y = backgroundWindow.y + 120
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
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnQuickPlay)
    dropdownGroup:insert(btnCustomPlay)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(itemInfo)
    dropdownGroup:insert(windowInfo)
    sceneGroup:insert(dropdownGroup)
  end
  
  function clean()
    display.remove(btnQuickPlay)
    display.remove(btnCustomPlay)
    display.remove(btnExit)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroups()
  composer.bouncer.down(dropdownGroup)
  addListeners()
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
