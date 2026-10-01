local composer = require("composer")
local screen = require("lua.modules.screen")
local league = require("lua.modules.offlineLeague")
local fireworksHandler = require("lua.game.effects.fireworksHandler")
local scene = composer.newScene()
local clean, cleanEnter

-- Last week's league prize, on the hanging prize sign (original 480x320 design units).
-- The prizes are already paid out by offlineLeague when the week ends.
local DESIGN_W, DESIGN_H = 480, 320
local PRIZE_SPACING = 50

local function ordinal(place)
  local lastDigit = place % 10
  if place % 100 > 10 and place % 100 < 20 then
    return place .. "th"
  elseif lastDigit == 1 then
    return place .. "st"
  elseif lastDigit == 2 then
    return place .. "nd"
  elseif lastDigit == 3 then
    return place .. "rd"
  end
  return place .. "th"
end

function scene:create(event)
  local group = self.view
  local params = event.params or {}
  local tier = tonumber(params.tier) or league.WOOD
  local place = tonumber(params.place) or 1
  local prizes = params.prizes or {}
  local box = screen.designBox(DESIGN_W, DESIGN_H)
  local s = box.scale
  local top = box.T
  local buttons = {}

  local function newText(textParams)
    textParams.size = textParams.size * s
    local text = composer.newText(textParams)
    text.xScale, text.yScale = 1 / s, 1 / s
    return text
  end

  local dim = display.newImageRect(group, "images/gui/common/black.png", screen.width + 4, screen.height + 4)
  dim.x, dim.y = screen.centerX, screen.centerY
  local design = display.newGroup()
  design.xScale, design.yScale = s, s
  design.x, design.y = box.left, box.top
  group:insert(design)

  local window = display.newImageRect(design, "images/gui/ranking/promotion/windowPrizes.png", 430, 256)
  window.anchorY = 0
  window.x, window.y = 240, top
  local plateY = top + 86
  local platePath = "images/gui/ranking/promotion/plate_" .. tier .. ".png"
  if system.pathForFile(platePath, system.ResourceDirectory) then
    local plate = display.newImageRect(design, platePath, 182, 70)
    plate.x, plate.y = 240, plateY
    plate.yScale = -1
  end
  local shield = display.newImageRect(design, "images/gui/ranking/league/tierB_" .. tier .. ".png", 83, 81)
  shield.x, shield.y = 240, top + 110
  shield.xScale, shield.yScale = 0.6, 0.6

  local title = newText({ string = composer.localized.get("League Prize"), size = 22, color = { 1, 1, 1 } })
  title.x, title.y = 240, plateY - 10
  design:insert(title)
  local congratulations = newText({ string = composer.localized.get("Congratulations!"), size = 17, color = { 0, 0, 0 } })
  congratulations.x, congratulations.y = 240, plateY + 56
  design:insert(congratulations)
  local message = composer.localized.get("You placed ") .. ordinal(place) .. composer.localized.get(" in ")
    .. composer.localized.get(league.leagueName(tier)) .. composer.localized.get(" last week! Here's your reward")
  local messageText = newText({ string = message, size = 10, color = { 0, 0, 0 }, width = 270 * s, align = "center" })
  messageText.x, messageText.y = 240, plateY + 72
  design:insert(messageText)

  -- The prizes side by side under the message.
  local prizeRow = display.newGroup()
  design:insert(prizeRow)
  local highlightItemId
  for i, prize in ipairs(prizes) do
    local x = (i - 1) * PRIZE_SPACING
    if prize.type == "ITEM" then
      local category = composer.storeConfig.getItemCategory(prize.itemId)
      if not category and tonumber(prize.itemId) and tonumber(prize.itemId) >= 5000 then
        category = "skins"
      end
      local path = category and ("images/gui/market/items/" .. category .. "/" .. prize.itemId .. ".png")
      if path and system.pathForFile(path, system.ResourceDirectory) then
        local icon = display.newImageRect(prizeRow, path, 39, 43)
        icon.x, icon.y = x, 5
      end
      highlightItemId = highlightItemId or prize.itemId
    else
      local isGems = prize.type == "HARD_CURRENCY"
      local icon = display.newImageRect(prizeRow, isGems and "images/gui/common/gem.png" or "images/gui/common/coin.png", 36, 36)
      icon.x, icon.y = x, 0
      local amount = newText({ string = "+" .. tostring(prize.amount), size = 14, color = { 0, 0, 0 } })
      amount.x, amount.y = x, 26
      prizeRow:insert(amount)
    end
  end
  prizeRow.x = 240 - (#prizes - 1) * PRIZE_SPACING * 0.5
  prizeRow.y = top + 190

  fireworksHandler.startFireWorks(0, top + 320, design, 0, true)
  composer.audio.play("coins_end")

  local function close()
    composer.hideOverlay()
  end

  local function openShop()
    composer.hideOverlay()
    composer.gotoScene("lua.scenes.marketplace", { params = { highlightItemId = highlightItemId } })
  end

  local okButton = composer.newButton({
    image = "images/gui/ranking/promotion/buttonOk.png",
    width = 62,
    height = 37,
    x = 210,
    y = top + 255,
    text = { string = composer.localized.get("OK"), size = 14 },
    onRelease = close
  })
  design:insert(okButton)
  buttons[#buttons + 1] = okButton
  local shopButton = composer.newButton({
    image = "images/gui/ranking/promotion/buttonShop.png",
    width = 48,
    height = 37,
    x = 270,
    y = top + 255,
    onRelease = openShop
  })
  design:insert(shopButton)
  buttons[#buttons + 1] = shopButton

  local function swallowTouch()
    return true
  end

  dim:addEventListener("touch", swallowTouch)

  function clean()
    dim:removeEventListener("touch", swallowTouch)
    fireworksHandler.clean()
    for _, button in ipairs(buttons) do
      display.remove(button)
    end
  end
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
  if event.phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
  elseif event.phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded()
  end
end

function scene:destroy(event)
  if clean then
    clean()
    clean = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
