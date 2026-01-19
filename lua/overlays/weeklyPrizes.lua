local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

function scene:create(event)
  local sceneGroup = self.view
  local dropdownGroup = display.newGroup()
  local spinningGroup = display.newGroup()
  spinningGroup.anchorX = 0.5
  spinningGroup.anchorY = 0.5
  spinningGroup.x = display.contentWidth * 0.5
  spinningGroup.y = 180
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/ranking/prizesPopup.png", 351, 262)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local prizes = event.params.prize
  local windowInfo = composer.newText({
    string = composer.localized.get("Weekly"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 44,
    size = 24,
    color = {
      1,
      1,
      1
    }
  })
  local windowInfo2 = composer.newText({
    string = composer.localized.get("OnlyQuick"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 68,
    size = 12,
    color = {
      1,
      1,
      1
    }
  })
  
  local function scalePrizeImage(image, iconWidth, iconHeight)
    local xScale = iconWidth / image.width
    local yScale = iconHeight / image.height
    local scaleToUse = math.min(xScale, yScale)
    image.width = scaleToUse * image.width
    image.height = scaleToUse * image.height
  end
  
  local function createPrizeDisplay(id, amount, index)
    local prizeGroup = display.newGroup()
    local prizeIconPath = composer.storeConfig.getItemCategory(id)
    local prizeIcon, prizeAmountText, plate
    if prizeIconPath then
      local fullPath
      if id == 1 then
        fullPath = "images/gui/common/coin.png"
      else
        fullPath = "images/gui/market/items/" .. prizeIconPath .. "/" .. id .. ".png"
      end
      if 1 < amount then
        prizeAmountText = composer.newText({
          string = "x " .. amount,
          size = 12,
          x = 30,
          y = 30
        })
        prizeGroup:insert(prizeAmountText)
      end
      local iconWidth = 80
      local iconHeight = 80
      local plateWidth = 50
      local plateHeight = 20
      if index ~= 1 then
        iconWidth = 35
        iconHeight = 35
        plateWidth = 35
        plateHeight = 15
      end
      prizeIcon = display.newImage(fullPath)
      scalePrizeImage(prizeIcon, iconWidth, iconHeight)
      prizeIcon.x = 30
      if id ~= 1 then
        local plateIndex = composer.storeConfig.getItem(id).plate
        if plateIndex then
          plate = display.newImageRect("images/gui/lobby/" .. plateIndex .. ".png", plateWidth, plateHeight)
          plate.x = prizeIcon.x
          plate.y = prizeIcon.y + prizeIcon.height * 0.5 + 2
          prizeGroup:insert(plate)
        end
      end
      prizeGroup:insert(prizeIcon)
    end
    if index == 1 then
      prizeGroup.x = 125
      prizeGroup.y = 155
    elseif index == 2 then
      prizeGroup.x = 244
      prizeGroup.y = 120
    elseif index == 3 then
      prizeGroup.x = 330
      prizeGroup.y = 120
    elseif index == 4 then
      prizeGroup.x = 244
      prizeGroup.y = 214
    elseif index == 5 then
      prizeGroup.x = 330
      prizeGroup.y = 214
    end
    dropdownGroup:insert(prizeGroup)
  end
  
  local function btnExitRelease()
    composer.hideOverlay()
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = btnExitRelease,
    width = 43,
    height = 38,
    x = backgroundWindow.x + 156,
    y = backgroundWindow.y + 50
  })
  
  local function addPrizes()
    if prizes then
      for i = 1, #prizes do
        createPrizeDisplay(prizes[i].i, prizes[i].a, i)
      end
    end
  end
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnExit)
    dropdownGroup:insert(windowInfo)
    dropdownGroup:insert(windowInfo2)
    sceneGroup:insert(dropdownGroup)
    addPrizes()
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
    display.remove(btnExit)
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
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
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
