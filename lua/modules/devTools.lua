-- Developer Tools Module v3
-- Press 'D' to toggle, Click to select, Tab to cycle, Arrows to adjust

local composer = require("composer")
local M = {}

M.enabled = false
M.selectedObject = nil
M.infoText = nil
M.infoBackground = nil
M.highlightRect = nil
M.isDragging = false
M.dragOffsetX = 0
M.dragOffsetY = 0
M.objectsAtPoint = {}
M.currentObjectIndex = 1
M.touchOverlay = nil
M.scaleFactor = 4
M.undoStack = {} -- Stack of {obj, x, y, width, height} for undo
M.resizeMode = false -- Toggle between move and resize mode

local function getObjectInfo(obj)
  local info = {}

  pcall(function() info.name = obj.name end)
  pcall(function() info.id = obj.id end)
  pcall(function() info.text = obj.text end)
  pcall(function() info.filename = obj.filename end)
  pcall(function() info.x = obj.x end)
  pcall(function() info.y = obj.y end)
  pcall(function() info.width = obj.width end)
  pcall(function() info.height = obj.height end)
  pcall(function() info.alpha = obj.alpha end)
  pcall(function() info.isVisible = obj.isVisible end)
  pcall(function() info.numChildren = obj.numChildren end)

  return info
end

local function getObjectName(obj)
  local info = getObjectInfo(obj)

  if info.name and info.name ~= "" then return info.name end
  if info.id and info.id ~= "" then return tostring(info.id) end
  if info.filename and info.filename ~= "" then
    -- Extract just the filename from path
    local name = string.match(info.filename, "([^/\\]+)$") or info.filename
    return name
  end
  if info.text and info.text ~= "" then
    local shortText = string.sub(info.text, 1, 15)
    return "\"" .. shortText .. "\""
  end

  local w = math.floor(info.width or 0)
  local h = math.floor(info.height or 0)
  if w > 0 and h > 0 then
    return string.format("obj_%dx%d", w, h)
  end

  return "object"
end

local function isValidObject(obj)
  if not obj then return false end
  if obj._isDevUI then return false end

  local info = getObjectInfo(obj)

  -- Must have position
  if not info.x or not info.y then return false end

  -- Skip invisible
  if info.isVisible == false then return false end

  -- Skip fully transparent
  if info.alpha and info.alpha <= 0 then return false end

  return true
end

local function collectObjects(group, list, depth)
  depth = depth or 0
  if depth > 15 then return end

  local numChildren = 0
  pcall(function() numChildren = group.numChildren or 0 end)

  if numChildren == 0 then return end

  for i = 1, numChildren do
    local child = nil
    pcall(function() child = group[i] end)

    if child and isValidObject(child) then
      table.insert(list, {obj = child, depth = depth})

      -- Recurse into groups
      local childCount = 0
      pcall(function() childCount = child.numChildren or 0 end)
      if childCount > 0 then
        collectObjects(child, list, depth + 1)
      end
    end
  end
end

local function pointInBounds(x, y, obj)
  local bounds = nil
  pcall(function() bounds = obj.contentBounds end)

  if not bounds then return false end

  return x >= bounds.xMin and x <= bounds.xMax and
         y >= bounds.yMin and y <= bounds.yMax
end

local function getObjectArea(obj)
  local bounds = nil
  pcall(function() bounds = obj.contentBounds end)
  if not bounds then return 999999999 end

  local w = bounds.xMax - bounds.xMin
  local h = bounds.yMax - bounds.yMin
  return w * h, w, h
end

local function findObjectsAt(x, y)
  local allObjects = {}
  local stage = display.getCurrentStage()

  collectObjects(stage, allObjects, 0)

  print(string.format("DEV: Found %d total objects on stage", #allObjects))

  -- Filter to objects containing the touch point
  local matches = {}
  for _, item in ipairs(allObjects) do
    if pointInBounds(x, y, item.obj) then
      local area, w, h = getObjectArea(item.obj)

      -- Skip extremely small objects (likely invisible hit areas)
      if w > 5 and h > 5 then
        table.insert(matches, {
          obj = item.obj,
          depth = item.depth,
          area = area
        })
      end
    end
  end

  print(string.format("DEV: %d objects at click point (%d, %d)", #matches, x, y))

  -- Sort: deeper objects first, then smaller area
  table.sort(matches, function(a, b)
    if a.depth ~= b.depth then
      return a.depth > b.depth
    end
    return a.area < b.area
  end)

  -- Print what we found
  for i, item in ipairs(matches) do
    local name = getObjectName(item.obj)
    print(string.format("  %d: %s (depth=%d, area=%.0f)", i, name, item.depth, item.area))
  end

  return matches
end

local function createUI()
  if M.infoBackground then pcall(function() M.infoBackground:removeSelf() end) end
  if M.infoText then pcall(function() M.infoText:removeSelf() end) end

  M.infoBackground = display.newRect(display.contentCenterX, 50, 800, 80)
  M.infoBackground:setFillColor(0, 0, 0, 0.9)
  M.infoBackground.strokeWidth = 3
  M.infoBackground:setStrokeColor(0, 1, 0)
  M.infoBackground._isDevUI = true

  local modeText = M.resizeMode and "[RESIZE MODE]" or "[MOVE MODE]"
  M.infoText = display.newText({
    text = "DEV " .. modeText .. " | R=toggle mode | Z=undo | D=exit",
    x = display.contentCenterX,
    y = 50,
    width = 780,
    fontSize = 18,
    font = native.systemFontBold,
    align = "center"
  })
  M.infoText:setFillColor(0, 1, 0)
  M.infoText._isDevUI = true
end

local function updateUI()
  if not M.infoText then return end

  local obj = M.selectedObject
  local modeText = M.resizeMode and "[RESIZE]" or "[MOVE]"
  if not obj then
    M.infoText.text = "DEV " .. modeText .. " | R=toggle | Z=undo | D=exit"
    return
  end

  local info = getObjectInfo(obj)
  local name = getObjectName(obj)
  local count = #M.objectsAtPoint

  local x1080 = math.floor(info.x or 0)
  local y1080 = math.floor(info.y or 0)
  local x320 = math.floor(x1080 / M.scaleFactor)
  local y320 = math.floor(y1080 / M.scaleFactor)
  local w = math.floor(info.width or 0)
  local h = math.floor(info.height or 0)

  local cycleText = ""
  if count > 1 then
    cycleText = string.format(" [%d/%d]", M.currentObjectIndex, count)
  end

  M.infoText.text = string.format(
    "%s %s%s\nPos: (%d, %d) | @480: (%d, %d) | Size: %dx%d",
    modeText, name, cycleText, x1080, y1080, x320, y320, w, h
  )

  print("")
  print("=== SELECTED ===")
  print("Mode: " .. (M.resizeMode and "RESIZE" or "MOVE"))
  print("Name: " .. name)
  print(string.format("x=%d, y=%d (1920x1080)", x1080, y1080))
  print(string.format("x=%d, y=%d (480x320)", x320, y320))
  print(string.format("size: %dx%d", w, h))
  print("================")
end

local function updateHighlight()
  if M.highlightRect then
    pcall(function() M.highlightRect:removeSelf() end)
    M.highlightRect = nil
  end

  local obj = M.selectedObject
  if not obj then return end

  local info = getObjectInfo(obj)
  local w = (info.width or 50) + 8
  local h = (info.height or 50) + 8

  M.highlightRect = display.newRect(info.x or 0, info.y or 0, w, h)
  M.highlightRect:setFillColor(0, 0, 0, 0)
  M.highlightRect.strokeWidth = 4
  M.highlightRect:setStrokeColor(1, 1, 0)
  M.highlightRect._isDevUI = true

  -- Bring UI to front
  if M.touchOverlay then pcall(function() M.touchOverlay:toFront() end) end
  if M.infoBackground then pcall(function() M.infoBackground:toFront() end) end
  if M.infoText then pcall(function() M.infoText:toFront() end) end
end

local function saveUndo(obj)
  if not obj then return end
  local info = getObjectInfo(obj)
  table.insert(M.undoStack, {
    obj = obj,
    x = info.x,
    y = info.y,
    width = info.width,
    height = info.height
  })
  -- Limit stack size
  if #M.undoStack > 50 then
    table.remove(M.undoStack, 1)
  end
end

local function undo()
  if #M.undoStack == 0 then
    print("DEV: Nothing to undo")
    return
  end

  local last = table.remove(M.undoStack)
  if last.obj then
    pcall(function()
      last.obj.x = last.x
      last.obj.y = last.y
      if last.width then last.obj.width = last.width end
      if last.height then last.obj.height = last.height end
    end)
    M.selectedObject = last.obj
    updateHighlight()
    updateUI()
    print(string.format("DEV: Undo - restored to (%d, %d) size %dx%d", last.x, last.y, last.width or 0, last.height or 0))
  end
end

local function selectObject(obj)
  M.selectedObject = obj
  updateHighlight()
  updateUI()
end

local function cycleSelection()
  if #M.objectsAtPoint <= 1 then return end

  M.currentObjectIndex = M.currentObjectIndex + 1
  if M.currentObjectIndex > #M.objectsAtPoint then
    M.currentObjectIndex = 1
  end

  selectObject(M.objectsAtPoint[M.currentObjectIndex].obj)
end

local function onTouch(event)
  if not M.enabled then return false end

  local phase = event.phase
  local x, y = event.x, event.y

  if phase == "began" then
    print("")
    print(string.format("DEV: Touch at (%d, %d)", x, y))

    -- Check if clicking on currently selected object - if so, just drag it
    if M.selectedObject then
      if pointInBounds(x, y, M.selectedObject) then
        print("DEV: Dragging currently selected object")
        saveUndo(M.selectedObject)
        M.isDragging = true
        local info = getObjectInfo(M.selectedObject)
        M.dragOffsetX = (info.x or 0) - x
        M.dragOffsetY = (info.y or 0) - y
        display.getCurrentStage():setFocus(M.touchOverlay)
        return true
      end
    end

    -- Otherwise, find new objects at this point
    M.objectsAtPoint = findObjectsAt(x, y)
    M.currentObjectIndex = 1

    if #M.objectsAtPoint > 0 then
      local obj = M.objectsAtPoint[1].obj
      saveUndo(obj) -- Save position before moving
      selectObject(obj)
      M.isDragging = true

      local info = getObjectInfo(obj)
      M.dragOffsetX = (info.x or 0) - x
      M.dragOffsetY = (info.y or 0) - y

      display.getCurrentStage():setFocus(M.touchOverlay)
    else
      print("DEV: No objects found at this location")
    end
    return true

  elseif phase == "moved" then
    if M.isDragging and M.selectedObject then
      pcall(function()
        M.selectedObject.x = x + M.dragOffsetX
        M.selectedObject.y = y + M.dragOffsetY
      end)
      updateHighlight()
    end
    return true

  elseif phase == "ended" or phase == "cancelled" then
    M.isDragging = false
    display.getCurrentStage():setFocus(nil)
    if M.selectedObject then
      updateUI()
    end
    return true
  end

  return true
end

local function onKey(event)
  if event.phase ~= "up" then return false end

  if event.keyName == "d" then
    if M.enabled then
      M.disable()
    else
      M.enable()
    end
    return true
  end

  if not M.enabled then return false end

  if event.keyName == "tab" then
    cycleSelection()
    return true
  end

  -- Z to undo
  if event.keyName == "z" then
    undo()
    return true
  end

  -- R to toggle resize/move mode
  if event.keyName == "r" then
    M.resizeMode = not M.resizeMode
    local modeText = M.resizeMode and "RESIZE" or "MOVE"
    print("DEV: Switched to " .. modeText .. " mode")
    updateUI()
    return true
  end

  if M.selectedObject then
    local step = 4
    if event.isShiftDown then step = 40 end

    local changed = false

    if M.resizeMode then
      -- Resize mode: arrows change width/height
      if event.keyName == "up" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.height = math.max(10, M.selectedObject.height - step) end)
        changed = true
      elseif event.keyName == "down" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.height = M.selectedObject.height + step end)
        changed = true
      elseif event.keyName == "left" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.width = math.max(10, M.selectedObject.width - step) end)
        changed = true
      elseif event.keyName == "right" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.width = M.selectedObject.width + step end)
        changed = true
      end
    else
      -- Move mode: arrows change position
      if event.keyName == "up" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.y = M.selectedObject.y - step end)
        changed = true
      elseif event.keyName == "down" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.y = M.selectedObject.y + step end)
        changed = true
      elseif event.keyName == "left" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.x = M.selectedObject.x - step end)
        changed = true
      elseif event.keyName == "right" then
        saveUndo(M.selectedObject)
        pcall(function() M.selectedObject.x = M.selectedObject.x + step end)
        changed = true
      end
    end

    if changed then
      updateHighlight()
      updateUI()
      return true
    end
  end

  return false
end

function M.enable()
  M.enabled = true

  -- Create touch capture overlay
  if M.touchOverlay then pcall(function() M.touchOverlay:removeSelf() end) end

  M.touchOverlay = display.newRect(
    display.contentCenterX,
    display.contentCenterY,
    display.actualContentWidth + 1000,
    display.actualContentHeight + 1000
  )
  M.touchOverlay:setFillColor(1, 0, 0, 0.01) -- Slight red tint to verify it's there
  M.touchOverlay._isDevUI = true
  M.touchOverlay:addEventListener("touch", onTouch)
  M.touchOverlay:toFront()

  createUI()
  M.infoBackground:toFront()
  M.infoText:toFront()

  print("")
  print("========================================")
  print("  DEV TOOLS v4 ENABLED")
  print("========================================")
  print("  Click     = Select object")
  print("  Drag      = Move object")
  print("  Tab       = Cycle objects at point")
  print("  R         = Toggle MOVE/RESIZE mode")
  print("  Arrows    = Move or Resize (4px)")
  print("  Shift+Arr = Move or Resize (40px)")
  print("  Z         = Undo")
  print("  D         = Disable")
  print("========================================")
  print("")
end

function M.disable()
  M.enabled = false
  M.selectedObject = nil
  M.isDragging = false
  M.objectsAtPoint = {}
  M.undoStack = {} -- Clear undo history
  M.resizeMode = false -- Reset to move mode

  if M.touchOverlay then
    pcall(function()
      M.touchOverlay:removeEventListener("touch", onTouch)
      M.touchOverlay:removeSelf()
    end)
    M.touchOverlay = nil
  end
  if M.infoBackground then
    pcall(function() M.infoBackground:removeSelf() end)
    M.infoBackground = nil
  end
  if M.infoText then
    pcall(function() M.infoText:removeSelf() end)
    M.infoText = nil
  end
  if M.highlightRect then
    pcall(function() M.highlightRect:removeSelf() end)
    M.highlightRect = nil
  end

  print("DEV TOOLS DISABLED")
end

function M.init()
  Runtime:addEventListener("key", onKey)
  print("")
  print(">>> Dev Tools v3 loaded - Press D to enable <<<")
  print("")
end

M.init()
composer.devTools = M

return M
