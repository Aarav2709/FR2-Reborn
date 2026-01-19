local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local textFieldSize = 50
  local timeoutTimer
  local sliders = {}
  local slidersText = {}
  local slidersState = {}
  local slidersFunctions = {}
  local dropdownGroup = display.newGroup()
  if isAndroid then
    textFieldSize = 60
  end
  slidersState[1], slidersState[2], slidersState[3] = composer.database.getPushEnableStatus()
  local background = display.newImageRect("images/gui/settings/pushWindow.png", 330, 240)
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
    string = composer.localized.get("Notifications"),
    x = 240,
    y = 60,
    size = 25,
    color = {
      1,
      1,
      1
    }
  })
  local gameInvite = composer.newText({
    string = composer.localized.get("GameInvites"),
    ax = 1,
    x = 240,
    y = 105,
    size = 22,
    color = {
      1,
      1,
      1
    }
  })
  local friendRequests = composer.newText({
    string = composer.localized.get("FriendRequests"),
    ax = 1,
    x = 240,
    y = 155,
    size = 22,
    color = {
      1,
      1,
      1
    }
  })
  local generalRequests = composer.newText({
    string = composer.localized.get("GeneralRequests"),
    ax = 1,
    x = 240,
    y = 205,
    size = 22,
    color = {
      1,
      1,
      1
    }
  })
  
  local function createSliders(id)
    local imagePath = "images/gui/settings/toggleOn.png"
    local text = composer.localized.get("On")
    if slidersText[id] then
      slidersText[id]:removeSelf()
      slidersText[id] = nil
    end
    if sliders[id] then
      sliders[id]:removeEventListener("touch", slidersFunctions[id])
      sliders[id]:removeSelf()
      sliders[id] = nil
    end
    slidersText[id] = composer.newText({
      string = text,
      size = 14,
      ax = 0,
      ay = 0.5
    })
    slidersText[id].x = 308
    slidersText[id].y = 106 + (id - 1) * 50
    if slidersState[id] == 0 then
      imagePath = "images/gui/settings/toggleOff.png"
      slidersText[id].text = composer.localized.get("Off")
      slidersText[id].x = 280
      slidersText[id]:setFillColor(1, 1, 1)
    end
    sliders[id] = display.newImageRect(imagePath, 62, 34)
    sliders[id].anchorX = 0.5
    sliders[id].anchorY = 0
    sliders[id].x = 300
    sliders[id].y = 90 + (id - 1) * 50
    sliders[id]:addEventListener("touch", slidersFunctions[id])
    group:insert(sliders[id])
    group:insert(slidersText[id])
  end
  
  local function changeState(id)
    local stringStatus = "off"
    if slidersState[id] == 1 then
      slidersState[id] = 0
    else
      stringStatus = "on"
      slidersState[id] = 1
    end
    composer.analytics.newEvent("design", {
      event_id = "notifications:changeState:" .. id .. ":" .. stringStatus,
      value = slidersState[id],
      area = composer.config.fullVersion
    })
    createSliders(id)
    composer.database.setPushEnableStatus(slidersState[1], slidersState[2], slidersState[3])
  end
  
  slidersFunctions[1] = function(event)
    if event.phase == "ended" then
      changeState(1)
    end
    return true
  end
  slidersFunctions[2] = function(event)
    if event.phase == "ended" then
      changeState(2)
    end
    return true
  end
  slidersFunctions[3] = function(event)
    if event.phase == "ended" then
      changeState(3)
    end
    return true
  end
  
  local function closeButtonEvent()
    composer.hideOverlay()
  end
  
  local function closeOnTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end
  
  local function doNothingOnTouchEvent(event)
    return true
  end
  
  local closeButton = composer.newButton({
    x = 400,
    y = 60,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeButtonEvent
  })
  
  local function stopTimer()
    if timeoutTimer then
      timer.cancel(timeoutTimer)
      timeoutTimer = nil
    end
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    dropdownGroup:insert(background)
    dropdownGroup:insert(info)
    dropdownGroup:insert(gameInvite)
    dropdownGroup:insert(friendRequests)
    dropdownGroup:insert(generalRequests)
    for i = 1, #sliders do
      dropdownGroup:insert(sliders[i])
      dropdownGroup:insert(slidersText[i])
    end
    dropdownGroup:insert(closeButton)
    group:insert(dropdownGroup)
  end
  
  local function httpsCallback(data)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", closeOnTouchEvent)
    background:addEventListener("touch", doNothingOnTouchEvent)
  end
  
  function clean()
    composer.comm.updatePushNotificationSettings(slidersState[1], slidersState[2], slidersState[3])
    display.remove(closeButton)
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    for i = 1, #slidersFunctions do
      sliders[i]:removeEventListener("touch", slidersFunctions[i])
    end
    background:removeEventListener("touch", doNothingOnTouchEvent)
    stopTimer()
  end
  
  for i = 1, 3 do
    createSliders(i)
  end
  updateDisplayGroup()
  addListeners()
  composer.commHttps.setCallback(httpsCallback)
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
