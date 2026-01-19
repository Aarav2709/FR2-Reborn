local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData, onCloseFunction

function scene:create(event)
  local sceneGroup = self.view
  local item = event.params.item
  onCloseFunction = event.params.onCloseFunction
  local dropdownGroup = display.newGroup()
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/market/popup/window.png", 215, 200)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local windowInfo = composer.newText({
    string = composer.localized.get("Yougot"),
    x = backgroundWindow.x + 2,
    y = backgroundWindow.y + 56,
    size = 18,
    color = {
      1,
      1,
      1
    }
  })
  local itemInfo = composer.newText({
    string = item.title,
    x = backgroundWindow.x,
    y = backgroundWindow.y + 180,
    size = 24,
    color = {
      1,
      1,
      1
    },
    width = 180,
    align = "center"
  })
  itemInfo.isVisible = false
  local plate = display.newImageRect("images/gui/market/items/plate/" .. item.plate .. ".png", 35, 15)
  plate.x = backgroundWindow.x + 3
  plate.y = backgroundWindow.y + 130
  plate.isVisible = false
  local icon = display.newImageRect(item.imagePath, 50, 56)
  if icon == nil then
    itemInfo.text = composer.localized.get("updatetouse")
    itemInfo.y = itemInfo.y - 40
    icon = display.newGroup()
    plate.isVisible = false
  else
    icon.x = backgroundWindow.x
    icon.y = backgroundWindow.y + 100
  end
  icon.isVisible = false
  local countDownImage
  local countdownTick = 4
  local countDownStartTimer, countDownTimer
  
  local function createCountdownImage()
    if countDownImage then
      countDownImage:removeSelf()
      countDownImage = nil
    end
    countDownImage = display.newImageRect("images/game/countdown" .. countdownTick .. ".png", 129, 70)
    if countDownImage then
      countDownImage.x = display.contentWidth * 0.51
      countDownImage.y = display.contentHeight * 0.33
      countDownImage:scale(0.1, 0.1)
      dropdownGroup:insert(countDownImage)
    end
  end
  
  local function fadecountdownImage()
    transition.to(countDownImage, {
      time = 400,
      xScale = 0.8,
      yScale = 0.8,
      transition = easing.outBounce
    })
    transition.to(countDownImage, {
      time = 400,
      delay = 500,
      alpha = 0
    })
  end
  
  local function countdown()
    local function doTick()
      countdownTick = countdownTick - 1
      
      if countdownTick < 1 then
        plate.isVisible = true
        icon.isVisible = true
        itemInfo.isVisible = true
      else
        createCountdownImage()
        fadecountdownImage()
        countDownTimer = timer.performWithDelay(1000, doTick, 1)
      end
    end
    
    doTick()
  end
  
  local function btnExitRelease()
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 33,
    height = 28,
    x = backgroundWindow.x + 105,
    y = backgroundWindow.y + 65
  })
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(itemInfo)
    dropdownGroup:insert(plate)
    dropdownGroup:insert(icon)
    dropdownGroup:insert(windowInfo)
    sceneGroup:insert(dropdownGroup)
  end
  
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
  
  function clean()
    display.remove(btnWithCoins)
    display.remove(btnWithCash)
    display.remove(btnExit)
    if countDownTimer then
      timer.cancel(countDownTimer)
      countDownTimer = nil
    end
    if countDownStartTimer then
      timer.cancel(countDownStartTimer)
      countDownStartTimer = nil
    end
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", backgroundImageTouchEvent)
  end
  
  updateDisplayGroups()
  addListeners()
  countDownStartTimer = timer.performWithDelay(500, countdown, 1)
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
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
  end
end

function scene:destroy(event)
  if onCloseFunction then
    onCloseFunction()
    onCloseFunction = nil
  end
  local sceneGroup = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
