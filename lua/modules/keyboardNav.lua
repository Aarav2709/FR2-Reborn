local composer = require("composer")
local M = {}

-- A touch catcher covers at least this share of the screen.
local CATCHER_SHARE = 0.55
local SKIPPED_SCENES = { ["lua.scenes.gamePlay"] = true, ["lua.scenes.loadingScene"] = true }

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

local function onScreen(bounds)
  local left, top, right, bottom = screenRect()
  return bounds.xMax > left and bounds.xMin < right and bounds.yMax > top and bounds.yMin < bottom
end

-- Everything that can be pressed, in drawing order; a touch catcher drops what was
-- found before it (it is drawn over those).
local function collect()
  local left, top, right, bottom = screenRect()
  local screenArea = (right - left) * (bottom - top)
  local found, catcher = {}, nil
  local function walk(object)
    if not object.isVisible or (object.alpha or 1) <= 0.02 then
      return
    end
    if buttons[object] then
      local bounds = boundsOf(object)
      if bounds and onScreen(bounds) then
        found[#found + 1] = object
      end
      return
    end
    if object ~= display.getCurrentStage() and (hasListener(object, "touch") or hasListener(object, "tap")) then
      local bounds, width, height = boundsOf(object)
      if bounds and onScreen(bounds) then
        if width * height >= screenArea * CATCHER_SHARE then
          found = {}
          catcher = object
        else
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

-- The focused button pops: it grows a little around its centre and its text label (a
-- composer.newButton text) turns yellow. An object can show focus its own way instead:
-- object.navCustomFocus(isFocused) is called when it gains or loses the focus.
local FOCUS_GROW = 1.08
local FOCUS_TEXT = { 1, 0.72, 0.1 }
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

local function unpop()
  local object = shown
  shown = nil
  if not (object and isAlive(object)) then
    shownRestore = nil
    return
  end
  if object.navCustomFocus then
    object.navCustomFocus(false)
  elseif shownRestore then
    object.xScale, object.yScale, object.x, object.y = unpack(shownRestore)
    local text = buttonText(object)
    if text then
      text.returnToNormalColor()
    end
  end
  shownRestore = nil
end

local function pop(object)
  shown = object
  if object.navCustomFocus then
    object.navCustomFocus(true)
    return
  end
  local scaleX, scaleY, x, y = object.xScale, object.yScale, object.x, object.y
  shownRestore = { scaleX, scaleY, x, y }
  -- Grow around the centre of what is drawn (groups keep children anywhere inside).
  local bounds = object.contentBounds
  local centerX, centerY = object.parent:contentToLocal((bounds.xMin + bounds.xMax) * 0.5, (bounds.yMin + bounds.yMax) * 0.5)
  local localX, localY = (centerX - x) / scaleX, (centerY - y) / scaleY
  object.xScale, object.yScale = scaleX * FOCUS_GROW, scaleY * FOCUS_GROW
  object.x = x + localX * scaleX * (1 - FOCUS_GROW)
  object.y = y + localY * scaleY * (1 - FOCUS_GROW)
  local text = buttonText(object)
  if text then
    text:setFillColor(unpack(FOCUS_TEXT))
  end
end

-- Screens whose lists don't take the pop well (league prizes and lists, news,
-- settings): no hover or pop there; the keyboard still works them.
local NO_POP = { ["lua.overlays.league"] = true, ["lua.overlays.newsfeed"] = true, ["lua.scenes.settings"] = true }

local function popAllowed()
  local overlay = composer.getSceneName("overlay")
  return not NO_POP[overlay or composer.getSceneName("current") or ""]
end

local function updateHighlight()
  local current = (isAlive(focused) and focused.isVisible and focused.parent) and focused or nil
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

local function ensureHighlight()
end

-- Moves the focus to the nearest candidate in a direction (dx, dy one of -1, 0, 1).
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
    -- First press: start from the button nearest the middle of the screen.
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
  if hasListener(object, "tap") then
    object:dispatchEvent({ name = "tap", numTaps = 1, target = object, x = x, y = y })
    return
  end
  local began = { name = "touch", phase = "began", target = object, x = x, y = y, xStart = x, yStart = y, id = "keyboard" }
  object:dispatchEvent(began)
  if isAlive(object) then
    object:dispatchEvent({ name = "touch", phase = "ended", target = object, x = x, y = y, xStart = x, yStart = y, id = "keyboard" })
  end
  display.getCurrentStage():setFocus(nil)
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
  local mode = native.getProperty("windowMode")
  native.setProperty("windowMode", mode == "fullscreen" and "normal" or "fullscreen")
end

-- Mouse hover (PC UI): the button under the cursor takes the focus (and pops).
local hovered
local lastHoverCheck = 0

local function unhover()
  if hovered and focused == hovered then
    focused = nil
  end
  hovered = nil
end

local function hover(object)
  hovered = object
  focused = object
end

-- Mouse wheel (PC): scrolls the list under the cursor. Scroll views and table views
-- move by a step; the shop's item strip (tableViewHorizontal) moves one item.
local WHEEL_STEP = 60

local function scrollUnder(x, y, amount)
  local target
  local function walk(object)
    if not object.isVisible then
      return
    end
    local bounds = object.contentBounds
    if (object.step or (object.getContentPosition and (object.scrollToPosition or object.scrollToY))) and bounds and x >= bounds.xMin and x <= bounds.xMax
        and y >= bounds.yMin and y <= bounds.yMax then
      target = object
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
  if not target then
    return
  end
  if target.step then
    target:step(amount > 0 and 1 or -1)
    return
  end
  pcall(function()
    -- (A table view gives just its y; a scroll view gives x and y.)
    local contentY
    if target.scrollToY then
      contentY = target:getContentPosition()
    else
      local _
      _, contentY = target:getContentPosition()
    end
    -- (The widget keeps its visible and scrollable heights on its view.)
    local view = rawget(target, "_view") or target
    local lowest = math.min(0, (view._height or 0) - (view._scrollHeight or 0))
    local newY = math.max(lowest, math.min(0, contentY - (amount > 0 and 1 or -1) * WHEEL_STEP))
    if target.scrollToY then
      target:scrollToY({ y = newY, time = 120 })
    else
      target:scrollToPosition({ y = newY, time = 120 })
    end
  end)
end

local function onMouse(event)
  local wheel = (event.scrollY and event.scrollY ~= 0 and event.scrollY) or (event.scrollX and event.scrollX ~= 0 and event.scrollX)
  if wheel then
    scrollUnder(event.x, event.y, wheel)
    return true
  end
  local now = system.getTimer()
  if now - lastHoverCheck < 50 then
    return false
  end
  lastHoverCheck = now
  if SKIPPED_SCENES[composer.getSceneName("current") or ""] and not composer.getSceneName("overlay") then
    unhover()
    return false
  end
  if not popAllowed() then
    unhover()
    return false
  end
  local candidates = collect()
  local found
  for i = #candidates, 1, -1 do
    local bounds = candidates[i].contentBounds
    if event.x >= bounds.xMin and event.x <= bounds.xMax and event.y >= bounds.yMin and event.y <= bounds.yMax then
      found = candidates[i]
      break
    end
  end
  if found then
    ensureHighlight()
    hover(found)
  elseif hovered then
    unhover()
    focused = nil
  end
  return false
end

local DIRECTIONS = { up = { 0, -1 }, down = { 0, 1 }, left = { -1, 0 }, right = { 1, 0 } }

local function onKey(event)
  if event.phase ~= "down" then
    return false
  end
  local key = event.keyName
  if key == "f11" then
    toggleFullscreen()
    return true
  end
  if SKIPPED_SCENES[composer.getSceneName("current") or ""] and not composer.getSceneName("overlay") then
    return false
  end
  local direction = DIRECTIONS[key]
  if direction then
    unhover()
    ensureHighlight()
    move(direction[1], direction[2])
    return true
  end
  if (key == "enter" or key == "numPadEnter") and not event.isRepeat then
    ensureHighlight()
    confirm()
    return true
  end
  return false
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

return M
