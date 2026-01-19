local M = {}
local androidButtonListener, androidKeyEvent, canPressButton, overlayIsActive, customOverlayCloseFunction, backSceneName, purgeSceneName
local composer = require("composer")
local backButtonPushed = false
local activateBackbuttonTimerRef

local function removeBackButton()
  canPressButton = false
  if activateBackbuttonTimerRef then
    timer.cancel(activateBackbuttonTimerRef)
    activateBackbuttonTimerRef = nil
  end
end

function androidButtonListener(event)
  if composer.onboarding.isActive == true then
    return
  elseif composer.data.iapOverlayActive then
    return
  end
  if backButtonPushed == true then
    backButtonPushed = false
    canPressButton = false
    if overlayIsActive then
      composer.hideOverlay()
      overlayIsActive = false
    elseif customOverlayCloseFunction then
      customOverlayCloseFunction()
      customOverlayCloseFunction = nil
    elseif backSceneName then
      if backSceneName == "lua.scenes.game.quitGameAlert" then
        composer.showOverlay(backSceneName, {isModal = true})
      else
        composer.gotoScene(backSceneName)
        backSceneName = nil
      end
      if purgeSceneName then
        composer.removeScene(purgeSceneName)
        purgeSceneName = nil
      end
    else
      print("close app")
      composer.closeAppAndorid = true
      native.requestExit()
    end
  end
end

function androidKeyEvent(event)
  local phase = event.phase
  local keyName = event.keyName
  if phase == "up" and keyName == "back" then
    if canPressButton then
      backButtonPushed = true
    end
    return true
  end
  return false
end

local function activateBackbutton()
  canPressButton = true
end

local function addBackButton(scenePath, purgePath)
  backSceneName = scenePath
  purgeSceneName = purgePath
  activateBackbuttonTimerRef = timer.performWithDelay(200, activateBackbutton, 1)
end

local function isOverlay(state)
  overlayIsActive = state
  activateBackbuttonTimerRef = timer.performWithDelay(200, activateBackbutton, 1)
end

local function isCustomOverlay(closeFunction)
  customOverlayCloseFunction = closeFunction
  activateBackbuttonTimerRef = timer.performWithDelay(200, activateBackbutton, 1)
end

local function startAndroidBackButton()
  Runtime:addEventListener("key", androidKeyEvent)
  Runtime:addEventListener("enterFrame", androidButtonListener)
end

local function cleanAndroidBackButton()
  if androidButtonListener then
    Runtime:removeEventListener("enterFrame", androidButtonListener)
    androidButtonListener = nil
  end
  if androidKeyEvent then
    Runtime:removeEventListener("key", androidKeyEvent)
    androidKeyEvent = nil
  end
end

M.addBackButton = addBackButton
M.removeBackButton = removeBackButton
M.isOverlay = isOverlay
M.isCustomOverlay = isCustomOverlay
M.startAndroidBackButton = startAndroidBackButton
M.cleanAndroidBackButton = cleanAndroidBackButton
return M
