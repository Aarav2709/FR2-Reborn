local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

function scene:create(event)
  local sceneGroup = self.view
  local moneyValue = composer.database.getMoney()
  local coinPrice = 0
  local cashPrice = "error"
  local basePath = "images/gui/wheel/"
  local reward = event.params.rewardThatIsWon
  local value = event.params.rewardValue
  local dropdownGroup = display.newGroup()
  local backgroundImage = display.newImageRect("images/gui/common/black.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local backgroundWindow = display.newImageRect("images/gui/market/popup/window.png", 215, 200)
  backgroundWindow.anchorY = 0
  backgroundWindow.x = display.contentWidth * 0.5
  backgroundWindow.y = 0
  local windowInfo = composer.newText({
    string = composer.localized.get("Purchase"),
    x = backgroundWindow.x,
    y = backgroundWindow.y + 56,
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
    y = backgroundWindow.y + 94
  })
  local amountText = composer.newText({
    string = "",
    x = backgroundWindow.x,
    y = backgroundWindow.y + 160,
    size = 10,
    color = {
      1,
      1,
      1
    }
  })
  local icon, plate
  if reward.type == "mystery" then
    local item = composer.storeConfig.getItem(value)
    if item then
      local plateId = item.plate
      plate = display.newImageRect("images/gui/lobby/" .. plateId .. ".png", 54, 19)
      plate.x = backgroundWindow.x
      plate.y = backgroundWindow.y + 130
      local itemType = composer.storeConfig.getItemCategory(value)
      if itemType then
        local imagePath = "images/gui/market/items/" .. itemType .. "/" .. value .. ".png"
        icon = display.newImageRect(imagePath, 65, 72)
        icon.x = backgroundWindow.x
        icon.y = backgroundWindow.y + 90
      end
      windowInfo.text = composer.localized.get("GotItem")
    end
  else
    icon = display.newImage(basePath .. reward.image)
    icon.xScale = 0.45
    icon.yScale = 0.45
    icon.x = backgroundWindow.x
    icon.y = backgroundWindow.y + 108
    if value == nil then
      value = "error"
    end
    if reward.type == "coins" then
      windowInfo.text = composer.localized.get("GotCoins")
      amountText.text = "x " .. value
      amountText.y = icon.y + 10
    elseif reward.type == "spin" then
      windowInfo.text = composer.localized.get("GotSpin")
      amountText.text = "x " .. value
      amountText.y = icon.y + 10
    end
  end
  local backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 70, 53)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 400
  backgroundCoins.y = 0
  local moneyValue = composer.database.getMoney()
  local moneyLabel = composer.newText({
    string = moneyValue,
    size = 14,
    x = 424,
    y = 40,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  
  local function refreshMoney()
    local newMoney = composer.database.getMoney()
    if newMoney > moneyValue then
      moneyValue = newMoney
      moneyLabel.text = moneyValue
      transition.to(moneyLabel, {
        time = 100,
        xScale = 1.2,
        yScale = 1.2
      })
      transition.to(moneyLabel, {
        time = 100,
        delay = 200,
        xScale = 1,
        yScale = 1
      })
    end
  end
  
  local function btnExitRelease()
    composer.hideOverlay()
    if composer.data.playerInfo.spins and composer.data.playerInfo.spins > 0 then
      local options = {
        isModal = true,
        params = {}
      }
      composer.showOverlay("lua.overlays.spinningWheel", options)
    end
  end
  
  local btnExit = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    onRelease = btnExitRelease,
    text = {
      string = composer.localized.get("Ok")
    },
    width = 126,
    height = 40,
    x = backgroundWindow.x,
    y = backgroundWindow.y + 190
  })
  
  local function updateDisplayGroups()
    sceneGroup:insert(backgroundImage)
    sceneGroup:insert(backgroundCoins)
    sceneGroup:insert(moneyLabel)
    dropdownGroup:insert(backgroundWindow)
    dropdownGroup:insert(btnExit)
    if plate then
      dropdownGroup:insert(plate)
    end
    dropdownGroup:insert(icon)
    dropdownGroup:insert(amountText)
    dropdownGroup:insert(errorInfo)
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
