local composer = require("composer")
local M = {}

local CATCHER_SHARE = 0.55
local PANEL_SHARE = 0.12
local SKIPPED_SCENES = { ["lua.scenes.gamePlay"] = true, ["lua.scenes.loadingScene"] = true }

local function navSkipped()
  return SKIPPED_SCENES[composer.getSceneName("current") or ""] and not composer.getSceneName("overlay")
    and not composer.raceMenuOpen
end

local buttons = setmetatable({}, { __mode = "k" })
local focused
local started = false

local function isAlive(object)
  return object and object.parent ~= nil and object.removeSelf ~= nil
end

local function hasListener(object, name)
  local functions = rawget(object, "_functionListeners")
  local tables = rawget(object, "_tableListeners")
  return (functions and functions[name] and #functions[name] > 0) or (tables and tables[name] and #tables[name] > 0)
end

local function isTouchable(object)
  return object ~= display.getCurrentStage() and (hasListener(object, "touch") or hasListener(object, "tap"))
end

local function boundsOf(object)
  local bounds = object.contentBounds
  if not bounds then
    return nil
  end
  local width, height = bounds.xMax - bounds.xMin, bounds.yMax - bounds.yMin
  if width < 4 or height < 4 then
    return nil
  end
  return bounds, width, height
end

local function screenRect()
  return display.screenOriginX, display.screenOriginY,
    display.screenOriginX + display.actualContentWidth, display.screenOriginY + display.actualContentHeight
end

local function screenArea()
  local left, top, right, bottom = screenRect()
  return (right - left) * (bottom - top)
end

local function onScreen(bounds)
  local left, top, right, bottom = screenRect()
  return bounds.xMax > left and bounds.xMin < right and bounds.yMax > top and bounds.yMin < bottom
end

local function isScrollView(object)
  return rawget(object, "_widgetType") ~= nil
end

local function scrollFrameOf(object)
  local view = rawget(object, "_view")
  local background = view and rawget(view, "_background")
  if background and background.contentBounds then
    return background
  end
end

local function isScrollBackground(object)
  local owner = object.parent
  return owner ~= nil and scrollFrameOf(owner) == object
end

local function isTableRow(object)
  local parent = object.parent
  return parent ~= nil and rawget(parent, "_widgetType") == "tableView"
end

local ROW_ACTIONS = { "clickButton", "getPlayerData", "getChallengeData", "setThisMapActive", "getId", "toggleName",
  "getPlayerInfo", "openGift", "acceptRequest", "deleteRequest", "acceptFriend", "deleteFriend", "sendMysterybox" }

local function isPressableRow(object)
  if object.navFocusable then
    return true
  end
  for i = 1, #ROW_ACTIONS do
    if object[ROW_ACTIONS[i]] then
      return true
    end
  end
  return false
end

local function collect()
  local area = screenArea()
  local found, catcher = {}, nil
  local function walk(object)
    local touchable = isTouchable(object)
    if not object.isVisible or (object.alpha or 1) <= 0.02 then
      if touchable and object.isHitTestable and not object.navIgnore and not isScrollBackground(object) then
        local bounds, width, height = boundsOf(object)
        if bounds and onScreen(bounds) then
          if width * height >= area * CATCHER_SHARE then
            found, catcher = {}, nil
          elseif width * height < area * PANEL_SHARE or object.numChildren or object.navFocusable then
            found[#found + 1] = object
          end
        end
      end
      return
    end
    if buttons[object] then
      local bounds = boundsOf(object)
      if bounds and onScreen(bounds) and not object.navIgnore then
        found[#found + 1] = object
      end
      return
    end
    if touchable and not object.navIgnore and not isScrollView(object) and not isScrollBackground(object)
        and (not isTableRow(object) or isPressableRow(object)) then
      local bounds, width, height = boundsOf(object)
      if bounds and onScreen(bounds) then
        if width * height >= area * CATCHER_SHARE then
          found = {}
          catcher = object
        elseif not (width * height >= area * PANEL_SHARE and not object.numChildren and not object.navFocusable) then
          found[#found + 1] = object
        end
      end
    end
    if object.numChildren then
      for i = 1, object.numChildren do
        local child = object[i]
        if child then
          walk(child)
        end
      end
    end
  end
  walk(display.getCurrentStage())
  return found, catcher
end

local function centerOf(object)
  local bounds = object.contentBounds
  return (bounds.xMin + bounds.xMax) * 0.5, (bounds.yMin + bounds.yMax) * 0.5
end

local FOCUS_GROW = 1.08
local FOCUS_TEXT = { 0.9, 0.58, 0 }
local shown, shownRestore

local function buttonText(object)
  if buttons[object] and object.numChildren then
    for i = object.numChildren, 1, -1 do
      local child = object[i]
      if child and child.returnToNormalColor then
        return child
      end
    end
  end
end

local function restoreValue(object, key, restore)
  if math.abs((object[key] or 0) - restore.popped[key]) < 1e-6 then
    object[key] = restore.original[key]
  end
end

local function unpop()
  local object = shown
  local restore = shownRestore
  shown = nil
  shownRestore = nil
  if not (object and isAlive(object)) then
    return
  end
  if object.navCustomFocus then
    object.navCustomFocus(false)
  elseif restore then
    restoreValue(object, "xScale", restore)
    restoreValue(object, "yScale", restore)
    restoreValue(object, "x", restore)
    restoreValue(object, "y", restore)
    local text = buttonText(object)
    if text then
      text.returnToNormalColor()
    end
  end
end

local TICK_CHANNEL = 31
local lastTick = 0

local function playTick()
  local now = system.getTimer()
  if now - lastTick < 90 or composer.database.getSound() ~= 1 then
    return
  end
  lastTick = now
  local handle = composer.data.sounds and composer.data.sounds.button_press
  if handle then
    pcall(function()
      audio.setVolume(0.25, { channel = TICK_CHANNEL })
      audio.play(handle, { channel = TICK_CHANNEL })
    end)
  end
end

local cursor = "arrow"

local function setCursor(name)
  if name ~= cursor then
    cursor = name
    pcall(native.setProperty, "mouseCursor", name)
  end
end

local function pop(object)
  shown = object
  playTick()
  if object.navCustomFocus then
    object.navCustomFocus(true)
    return
  end
  if not object.numChildren then
    return
  end
  local scaleX, scaleY, x, y = object.xScale, object.yScale, object.x, object.y
  if scaleX == 0 or scaleY == 0 then
    return
  end
  local bounds = object.contentBounds
  local centerX, centerY = object.parent:contentToLocal((bounds.xMin + bounds.xMax) * 0.5, (bounds.yMin + bounds.yMax) * 0.5)
  local localX, localY = (centerX - x) / scaleX, (centerY - y) / scaleY
  object.xScale, object.yScale = scaleX * FOCUS_GROW, scaleY * FOCUS_GROW
  object.x = x + localX * scaleX * (1 - FOCUS_GROW)
  object.y = y + localY * scaleY * (1 - FOCUS_GROW)
  shownRestore = {
    original = { xScale = scaleX, yScale = scaleY, x = x, y = y },
    popped = { xScale = object.xScale, yScale = object.yScale, x = object.x, y = object.y }
  }
  local text = buttonText(object)
  if text then
    text:setFillColor(unpack(FOCUS_TEXT))
  end
end

-- screens whose lists don't take the pop well (league prizes and lists, news,
-- settings): no hover or pop there; the keyboard still works them.
local NO_POP = { ["lua.overlays.league"] = true, ["lua.overlays.newsfeed"] = true, ["lua.scenes.settings"] = true }

local function popAllowed()
  local overlay = composer.getSceneName("overlay")
  return not NO_POP[overlay or composer.getSceneName("current") or ""]
end

local function isFocusable(object)
  return isAlive(object) and object.isVisible and not object.navIgnore
end

local function updateHighlight()
  local current = isFocusable(focused) and focused or nil
  if current and not popAllowed() then
    current = nil
  end
  if current ~= shown then
    unpop()
    if current then
      pop(current)
    end
  end
end

local function move(dx, dy)
  local candidates = collect()
  if #candidates == 0 then
    focused = nil
    return
  end
  local stillThere = false
  for _, object in ipairs(candidates) do
    if object == focused then
      stillThere = true
    end
  end
  if not stillThere then
    local left, top, right, bottom = screenRect()
    local midX, midY = (left + right) * 0.5, (top + bottom) * 0.5
    local best, bestDistance
    for _, object in ipairs(candidates) do
      local x, y = centerOf(object)
      local distance = (x - midX) ^ 2 + (y - midY) ^ 2
      if not bestDistance or distance < bestDistance then
        best, bestDistance = object, distance
      end
    end
    focused = best
    return
  end
  local fromX, fromY = centerOf(focused)
  local best, bestScore
  for _, object in ipairs(candidates) do
    if object ~= focused then
      local x, y = centerOf(object)
      local along = (x - fromX) * dx + (y - fromY) * dy
      if along > 2 then
        local across = math.abs((x - fromX) * dy) + math.abs((y - fromY) * dx)
        local score = along + across * 2
        if not bestScore or score < bestScore then
          best, bestScore = object, score
        end
      end
    end
  end
  if best then
    focused = best
  end
end

local function dispatchTouch(object, x, y)
  local now = system.getTimer()
  local began = { name = "touch", phase = "began", target = object, x = x, y = y, xStart = x, yStart = y, id = "keyboard", time = now }
  object:dispatchEvent(began)
  if isAlive(object) then
    object:dispatchEvent({ name = "touch", phase = "ended", target = object, x = x, y = y, xStart = x, yStart = y, id = "keyboard", time = now })
  end
  display.getCurrentStage():setFocus(nil)
end

local function press(object)
  local x, y = centerOf(object)
  local entry = buttons[object]
  if entry then
    local params = entry
    if not params.noSound then
      composer.audio.play("button_press")
    end
    if params.onPress then
      params.onPress({ name = "touch", phase = "began", target = object, x = x, y = y })
    end
    if params.onRelease then
      params.onRelease({ name = "touch", phase = "ended", target = object, x = x, y = y })
    end
    return
  end
  if object.navPress then
    object.navPress()
    return
  end
  if isTableRow(object) and hasListener(object, "touch") then
    dispatchTouch(object, x, y)
    return
  end
  if hasListener(object, "tap") then
    object:dispatchEvent({ name = "tap", numTaps = 1, target = object, x = x, y = y })
    return
  end
  dispatchTouch(object, x, y)
end

local function confirm()
  local candidates, catcher = collect()
  local valid = false
  for _, object in ipairs(candidates) do
    if object == focused then
      valid = true
    end
  end
  if valid then
    press(focused)
  elseif #candidates == 0 and catcher then
    press(catcher)
  else
    move(0, 0)
  end
end

local function toggleFullscreen()
  require("lua.modules.pcSettings").toggleFullscreen()
end

local hovered
local lastHoverCheck = 0
local mouseX, mouseY

local function unhover()
  if hovered and focused == hovered then
    focused = nil
  end
  hovered = nil
  setCursor("arrow")
end

local function hover(object)
  hovered = object
  focused = object
  setCursor("pointingHand")
end

local function inside(bounds, x, y)
  return x >= bounds.xMin and x <= bounds.xMax and y >= bounds.yMin and y <= bounds.yMax
end

local function refreshHover()
  if not mouseX then
    return
  end
  if navSkipped() or not popAllowed() then
    unhover()
    return
  end
  local candidates = collect()
  local found
  for i = #candidates, 1, -1 do
    local object = candidates[i]
    local hit
    if object.navHitTest then
      hit = object.navHitTest(mouseX, mouseY)
    else
      hit = inside(object.contentBounds, mouseX, mouseY)
    end
    if hit then
      found = object
      break
    end
  end
  if found then
    hover(found)
  elseif hovered then
    unhover()
    focused = nil
  end
end

local WHEEL_SPEED = 2.75
local WHEEL_EASE = 70
local STRIP_UNITS = 50

local wheel
local stripAccumulator, stripTarget, stripTime = 0, nil, 0

local function wheelLimits(view)
  local top = view._topPadding or 0
  local height = view._height or 0
  local scrollHeight = view._scrollHeight or view.height or 0
  local bottom = -scrollHeight + height - (view._bottomPadding or 0)
  if bottom > top then
    bottom = top
  end
  return top, bottom
end

local function stopWheel()
  if wheel then
    wheel = nil
    Runtime:removeEventListener("enterFrame", M.wheelFrame)
  end
end

function M.wheelFrame(event)
  local state = wheel
  if not state then
    return
  end
  local view = state.view
  if not isAlive(view) then
    stopWheel()
    return
  end
  local now = event and event.time or system.getTimer()
  local dt = math.max(0, math.min(100, now - state.lastTime))
  state.lastTime = now
  local y = view.y + (state.goal - view.y) * (1 - math.exp(-dt / WHEEL_EASE))
  local done = math.abs(state.goal - y) < 0.5
  if done then
    y = state.goal
  end
  view.y = y
  if view._scrollBar and view._scrollBar.move then
    pcall(view._scrollBar.move, view._scrollBar)
  end
  if done then
    stopWheel()
    refreshHover()
  end
end

local function wheelScroll(owner, delta)
  local view = owner._view or owner
  if view._isVerticalScrollingDisabled or view._isLocked then
    return
  end
  local top, bottom = wheelLimits(view)
  if top == bottom and math.abs(view.y - top) < 0.5 then
    return
  end
  -- one event never moves more than most of the visible height.
  local limit = math.max(40, (view._height or 400) * 0.9)
  delta = math.max(-limit, math.min(limit, delta))
  if not wheel or wheel.view ~= view then
    if view._transitionToIndex then
      transition.cancel(view._transitionToIndex)
      view._transitionToIndex = nil
    end
    if view._tween then
      transition.cancel(view._tween)
      view._tween = nil
    end
    view._updateRuntime = false
    view._trackVelocity = false
    view._velocity = 0
    stopWheel()
    wheel = { view = view, goal = view.y, lastTime = system.getTimer() }
    Runtime:addEventListener("enterFrame", M.wheelFrame)
  end
  wheel.goal = math.max(bottom, math.min(top, wheel.goal - delta))
end

local function stripScroll(strip, delta)
  local now = system.getTimer()
  if stripTarget ~= strip or now - stripTime > 600 then
    stripAccumulator = 0
  end
  stripTarget, stripTime = strip, now
  stripAccumulator = stripAccumulator + delta
  while math.abs(stripAccumulator) >= STRIP_UNITS do
    local direction = stripAccumulator > 0 and 1 or -1
    stripAccumulator = stripAccumulator - direction * STRIP_UNITS
    strip:step(direction)
  end
end

local function scrollTargetAt(x, y)
  local area = screenArea()
  local target
  local function walk(object)
    if not object.isVisible then
      if object.isHitTestable and isTouchable(object) then
        local bounds, width, height = boundsOf(object)
        if bounds and width * height >= area * CATCHER_SHARE then
          target = nil
        end
      end
      return
    end
    local bounds = object.contentBounds
    if bounds and isTouchable(object) and not isScrollView(object) and not object.step and not isScrollBackground(object) then
      local _, width, height = boundsOf(object)
      if width and width * height >= area * CATCHER_SHARE then
        target = nil
      end
    end
    if object.step then
      if bounds and inside(bounds, x, y) then
        target = object
      end
    elseif object.getContentPosition and rawget(object, "_view") then
      local frame = scrollFrameOf(object)
      local frameBounds = frame and frame.contentBounds or bounds
      if frameBounds and inside(frameBounds, x, y) then
        target = object
      end
    end
    if object.numChildren then
      for i = 1, object.numChildren do
        if object[i] then
          walk(object[i])
        end
      end
    end
  end
  walk(display.getCurrentStage())
  return target
end

local function onWheel(event)
  local amountY = event.scrollY or 0
  local amountX = event.scrollX or 0
  local target = scrollTargetAt(event.x, event.y)
  if not target then
    return
  end
  if target.step then
    local amount = amountX ~= 0 and amountX or amountY
    stripScroll(target, amount * WHEEL_SPEED)
  elseif amountY ~= 0 then
    wheelScroll(target, amountY * WHEEL_SPEED)
  end
end

local function onMouse(event)
  if event.type == "scroll" or (event.scrollY and event.scrollY ~= 0) or (event.scrollX and event.scrollX ~= 0) then
    if (event.scrollY and event.scrollY ~= 0) or (event.scrollX and event.scrollX ~= 0) then
      onWheel(event)
      return true
    end
    return false
  end
  mouseX, mouseY = event.x, event.y
  local now = system.getTimer()
  if now - lastHoverCheck < 50 then
    return false
  end
  lastHoverCheck = now
  refreshHover()
  return false
end

local DIRECTIONS = { up = { 0, -1 }, down = { 0, 1 }, left = { -1, 0 }, right = { 1, 0 } }

local function onKey(event)
  if event.phase ~= "down" then
    return false
  end
  local key = event.keyName
  if composer.capturingKey then
    local handler = composer.capturingKey
    composer.capturingKey = nil
    handler(key)
    return true
  end
  if key == "f11" then
    toggleFullscreen()
    return true
  end
  if composer.navHandler and composer.navHandler(key, event) then
    return true
  end
  if navSkipped() then
    return false
  end
  if require("lua.modules.textInput").focused then
    return false
  end
  local direction = DIRECTIONS[key]
  if direction then
    unhover()
    move(direction[1], direction[2])
    return true
  end
  if (key == "enter" or key == "numPadEnter") and not event.isRepeat then
    confirm()
    return true
  end
  return false
end

function M.getFocus()
  return isFocusable(focused) and focused or nil
end

function M.setFocus(object)
  focused = object
end

function M.start()
  if started then
    return
  end
  started = true
  require("lua.modules.buttonHelper")
  local newButton = composer.newButton
  composer.newButton = function(params)
    local group = newButton(params)
    buttons[group] = params
    return group
  end
  Runtime:addEventListener("key", onKey)
  Runtime:addEventListener("enterFrame", updateHighlight)
  if require("lua.modules.pcMode").isPC then
    Runtime:addEventListener("mouse", onMouse)
  end
end

M._collect = collect
M._focused = function()
  return focused
end
M._shown = function()
  return shown
end

return M
