local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

-- The prize won on the wheel, on a sign hanging from the top of the screen (original
-- 480x320 design units), with the coin board in its usual corner.
local DESIGN_W, DESIGN_H = 480, 320

function scene:create(event)
  local sceneGroup = self.view
  local params = event.params or {}
  local reward = params.rewardThatIsWon or {}
  local value = params.rewardValue
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T

  local function newText(textParams)
    textParams.size = (textParams.size or composer.localized.getFontSize()) * s
    local text = composer.newText(textParams)
    text.baseScale = 1 / s
    text.xScale, text.yScale = text.baseScale, text.baseScale
    return text
  end

  local backgroundImage = display.newImageRect(sceneGroup, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  backgroundImage.x, backgroundImage.y = screen.centerX, screen.centerY
  local designGroup = display.newGroup()
  designGroup.xScale, designGroup.yScale = s, s
  designGroup.x, designGroup.y = box.left, box.top
  sceneGroup:insert(designGroup)
  local dropdownGroup = display.newGroup()
  designGroup:insert(dropdownGroup)

  local backgroundWindow = display.newImageRect(dropdownGroup, "images/gui/market/popup/window.png", 215, 200)
  backgroundWindow.anchorY = 0
  backgroundWindow.x, backgroundWindow.y = 240, top
  local windowInfo = newText({ string = composer.localized.get("Purchase"), x = 240, y = top + 56, size = 20, color = { 1, 1, 1 } })
  dropdownGroup:insert(windowInfo)
  local amountText = newText({ string = "", x = 240, y = top + 160, size = 10, color = { 1, 1, 1 } })

  if reward.type == "mystery" then
    local item = composer.storeConfig.getItem(value)
    if item then
      local plate = display.newImageRect(dropdownGroup, "images/gui/lobby/" .. item.plate .. ".png", 54, 19)
      plate.x, plate.y = 240, top + 130
      local itemType = composer.storeConfig.getItemCategory(value)
      if itemType then
        local icon = display.newImageRect(dropdownGroup, "images/gui/market/items/" .. itemType .. "/" .. value .. ".png", 65, 72)
        if icon then
          icon.x, icon.y = 240, top + 90
        end
      end
      windowInfo.text = composer.localized.get("GotItem")
    end
  elseif reward.image then
    local icon = display.newImage(dropdownGroup, "images/gui/wheel/" .. reward.image)
    icon.xScale, icon.yScale = 0.45, 0.45
    icon.x, icon.y = 240, top + 108
    amountText.text = "x " .. tostring(value or "")
    amountText.y = icon.y + 10
    if reward.type == "coins" then
      windowInfo.text = composer.localized.get("GotCoins")
    elseif reward.type == "gems" then
      windowInfo.text = composer.localized.get("You got gems!")
    elseif reward.type == "spin" then
      windowInfo.text = composer.localized.get("GotSpin")
    end
  end
  dropdownGroup:insert(amountText)

  local backgroundCoins = display.newImageRect(designGroup, "images/gui/market/currentCoins.png", 70, 81)
  backgroundCoins.anchorX, backgroundCoins.anchorY = 0, 0
  backgroundCoins.x, backgroundCoins.y = box.SR - 80, top
  local gemLabel = newText({ string = composer.database.getGems(), size = 14, x = backgroundCoins.x + 24, y = top + 41, ax = 0, color = { 1, 1, 1 } })
  designGroup:insert(gemLabel)
  local moneyLabel = newText({ string = composer.database.getMoney(), size = 14, x = backgroundCoins.x + 24, y = top + 69, ax = 0, color = { 1, 1, 1 } })
  designGroup:insert(moneyLabel)

  local function btnExitRelease()
    composer.hideOverlay()
    if not composer.config.offlineMode and composer.data.playerInfo.spins and composer.data.playerInfo.spins > 0 then
      composer.showOverlay("lua.overlays.spinningWheel", { isModal = true, params = {} })
    end
  end

  local btnExit = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    onRelease = btnExitRelease,
    text = { string = composer.localized.get("Ok") },
    width = 126,
    height = 40,
    x = 240,
    y = top + 190
  })
  dropdownGroup:insert(btnExit)

  local function escapeTouchEvent(touchEvent)
    if touchEvent.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end

  local function swallowTouch()
    return true
  end

  backgroundImage:addEventListener("touch", escapeTouchEvent)
  backgroundWindow:addEventListener("touch", swallowTouch)

  function clean()
    display.remove(btnExit)
    backgroundImage:removeEventListener("touch", escapeTouchEvent)
    backgroundWindow:removeEventListener("touch", swallowTouch)
  end

  composer.bouncer.down(dropdownGroup)
end

function scene:show(event)
  if event.phase == "will" then
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
  if phase == "will" then
    if cleanEnter then
      cleanEnter()
    end
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
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
