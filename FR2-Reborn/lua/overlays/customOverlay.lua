local composer = require("composer")
local androidLogic = require("lua.modules.androidBackButton")
local overlayGroup, background, alphaBackground, info, contiuneButton, cleanOldOverlay, timerRef, doNotOverride, canExitOverlay

local function closeOnTouchEvent(event)
  if event.phase == "ended" and canExitOverlay then
    cleanOldOverlay()
  end
  return true
end

local function doNothingOnTouchEvent(event)
  return true
end

function cleanOldOverlay()
  androidLogic.isCustomOverlay(nil)
  if timerRef then
    timer.cancel(timerRef)
    timerRef = nil
  end
  if background then
    background:removeEventListener("touch", doNothingOnTouchEvent)
    background:removeSelf()
    background = nil
  end
  if alphaBackground then
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    alphaBackground:removeSelf()
    alphaBackground = nil
  end
  if contiuneButton then
    display.remove(contiuneButton)
    contiuneButton = nil
  end
  if info then
    info:removeSelf()
    info = nil
  end
  if overlayGroup then
    overlayGroup:removeSelf()
    overlayGroup = nil
  end
  doNotOverride = false
end

composer.cleanOldOverlay = cleanOldOverlay

local function createCustomOverlay(infoTextId, doNotOverrideMessage, extra)
  if doNotOverride then
    return
  end
  if doNotOverrideMessage then
    doNotOverride = doNotOverrideMessage
  end
  cleanOldOverlay()
  canExitOverlay = false
  local text = ""
  if infoTextId == 1 then
    text = composer.localized.get("Offline, try again later")
  elseif infoTextId == 2 then
    text = composer.localized.get("Facebook login failed E3")
  elseif infoTextId == 3 then
    text = composer.localized.get("Facebook login failed E1")
  elseif infoTextId == 4 then
    text = composer.localized.get("Facebook login failed E2")
  elseif infoTextId == 5 then
    text = composer.localized.get("Store not available")
  elseif infoTextId == 6 then
    text = composer.localized.get("Game unavailable")
  elseif infoTextId == 7 then
    text = composer.localized.get("Host left")
  elseif infoTextId == 8 then
    text = composer.localized.get("You were kicked")
  elseif infoTextId == 9 then
    text = composer.localized.get("Try again later")
  elseif infoTextId == 10 then
    text = composer.localized.get("Logged in elsewhere")
  elseif infoTextId == 11 then
    text = composer.localized.get("Please login again")
  elseif infoTextId == 12 then
    text = composer.localized.get("Something went wrong")
  elseif infoTextId == 13 then
    text = composer.localized.get("Failed to unlock zone")
  elseif infoTextId == 14 then
    text = composer.localized.get("Facebook failed E4")
  elseif infoTextId == 15 then
    text = composer.localized.get("Facebook failed E5")
  elseif infoTextId == 16 then
    text = composer.localized.get("Facebook already in use")
  elseif infoTextId == 17 then
    text = composer.localized.get("You must buy more slots")
  elseif infoTextId == 18 then
    text = composer.localized.get("You can not use this item")
  elseif infoTextId == 19 then
    text = composer.localized.get("Lost connection")
  elseif infoTextId == 20 then
    text = composer.localized.get("Could not find a game")
  elseif infoTextId == 21 then
    text = composer.localized.get("Please enter a new name")
  elseif infoTextId == 22 then
    text = composer.localized.get("Not enough gems")
  elseif infoTextId == 23 then
    text = composer.localized.get("Not enough coins")
  elseif infoTextId == 24 then
    text = composer.localized.get("Egg hunt not unlocked")
  elseif infoTextId == 25 then
    text = composer.localized.get("Already a member")
  elseif infoTextId == 26 then
    text = composer.localized.get("Already connected to facebook")
  elseif infoTextId == 27 then
    text = composer.localized.get("Facebook error")
  elseif infoTextId == 28 then
    text = composer.localized.get("You already own this")
  elseif infoTextId == 29 then
    text = composer.localized.get("Achievements error")
  elseif infoTextId == 30 then
    text = composer.localized.get("Daily challenge not complete")
  elseif infoTextId == 31 then
    text = composer.localized.get("Can't find daily challenges")
  elseif infoTextId == 32 then
    text = composer.localized.get("You need more progression")
  elseif infoTextId == 33 then
    text = composer.localized.get("Game is full")
  elseif infoTextId == 34 then
    text = composer.localized.get("Game already started")
  elseif infoTextId == 35 then
    text = composer.localized.get("No game found")
  elseif infoTextId == 36 then
    text = composer.localized.get("You have been banned")
  elseif infoTextId == 37 then
    text = composer.localized.get("Your account has been frozen")
  elseif infoTextId == 38 then
    text = composer.localized.get("Failed to update files, try again later")
  elseif infoTextId == 39 then
    text = composer.localized.get("CouldNotConnect")
  elseif infoTextId == 40 then
    text = composer.localized.get("TooManyFriends")
  elseif infoTextId == 41 then
    text = composer.localized.get("Already friends")
  elseif infoTextId == 42 then
    text = composer.localized.get("TooManyFriendInvites")
  elseif infoTextId == 43 then
    text = composer.localized.get("Error: Please try again")
  elseif infoTextId == 44 then
    text = composer.localized.get("Gift sent!")
  elseif infoTextId == 45 then
    text = composer.localized.get("You own all items, wait for next patch")
  elseif infoTextId == 46 then
    text = composer.localized.get("Failed file update. Starting offline mode.")
  elseif infoTextId == 98 then
    text = extra
  elseif infoTextId == 99 then
    text = composer.localized.get("Message error ") .. extra
  else
    text = composer.localized.get("SOMETHING WENT WRONG")
  end
  overlayGroup = display.newGroup()
  background = display.newImageRect("images/gui/common/generalPopup.png", 248, 105)
  background.anchorX = 0.5
  background.anchorY = 0
  background.x = 240
  background.y = 100
  alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  info = composer.newText({
    string = text,
    size = 22,
    x = 240,
    y = 140,
    width = 220,
    height = 60,
    align = "center",
    ay = 0.5,
    color = {
      1,
      1,
      1
    }
  })
  
  local function contiuneButtonEvent()
    cleanOldOverlay()
  end
  
  contiuneButton = composer.newButton({
    x = 240,
    y = 200,
    width = 126,
    height = 40,
    text = composer.localized.get("OK"),
    image = "images/gui/common/buttonTextB.png",
    onRelease = contiuneButtonEvent
  })
  
  local function updateDisplayGroup()
    overlayGroup:insert(alphaBackground)
    overlayGroup:insert(background)
    overlayGroup:insert(info)
    overlayGroup:insert(contiuneButton)
  end
  
  local function canExit()
    canExitOverlay = true
  end
  
  alphaBackground:addEventListener("touch", closeOnTouchEvent)
  background:addEventListener("touch", doNothingOnTouchEvent)
  updateDisplayGroup()
  timerRef = timer.performWithDelay(500, canExit, 1)
  androidLogic.isCustomOverlay(cleanOldOverlay)
end

composer.createCustomOverlay = createCustomOverlay
