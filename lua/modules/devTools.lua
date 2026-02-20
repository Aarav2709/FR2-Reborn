
local composer = require("composer")
local M = {}

local colTitleBg = { 0.18, 0.45, 0.85, 1 }
local colMenuBg = { 0.08, 0.08, 0.08, 0.9 }
local colText = { 1, 1, 1, 1 }
local colHeader = { 1, 0.78, 0, 1 }
local colShortcut = { 0.7, 0.7, 0.7, 1 }

M.enabled = false
M.selectedObject = nil
M.infoText = nil
M.infoBackground = nil
M.highlightRect = nil
M.isDragging = false
M.isResizing = false
M.isPanning = false
M.resizeHandle = nil
M.dragOffsetX = 0
M.dragOffsetY = 0
M.dragStartX = 0
M.dragStartY = 0
M.dragStartWidth = 0
M.dragStartHeight = 0
M.objectsAtPoint = {}
M.currentObjectIndex = 1
M.touchOverlay = nil
M.scaleFactor = 4
M.undoStack = {}
M.resizeMode = false

M.viewGroup = nil
M.zoomLevel = 1
M.panX = 0
M.panY = 0
M.minZoom = 0.1
M.maxZoom = 2.0
M.panStartX = 0
M.panStartY = 0

M.handles = {}
M.handleSize = 16

M.objectIdCounter = 0
M.objectIdMap = {}
setmetatable(M.objectIdMap, {__mode = "k"})

M.showHidden = false

M.objectListPanel = nil
M.objectListItems = {}
M.hudDragX = 0
M.hudDragY = 0
M.infoLines = {}
M.hudPosX = 20
M.hudPosY = 40

local function getUniqueId(obj)
  if not obj then return "nil" end

  if not M.objectIdMap[obj] then
    M.objectIdCounter = M.objectIdCounter + 1
    M.objectIdMap[obj] = M.objectIdCounter
  end

  return M.objectIdMap[obj]
end

local function getObjectInfo(obj)
  local info = {}

  pcall(function() info.name = obj.name end)
  pcall(function() info.devName = obj.devName or obj._devName end)
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
  pcall(function() info.contentBounds = obj.contentBounds end)
  pcall(function() info.parent = obj.parent end)

  return info
end

local function getObjectName(obj)
  local info = getObjectInfo(obj)
  local uniqueId = getUniqueId(obj)
  local baseName = ""

  if info.devName and info.devName ~= "" then
    baseName = info.devName
  elseif info.name and info.name ~= "" then
    baseName = info.name
  elseif info.filename and info.filename ~= "" then
    baseName = string.match(info.filename, "([^/\\]+)$") or info.filename
    baseName = string.gsub(baseName, "%.%w+$", "")
  elseif info.text and info.text ~= "" then
    local shortText = string.sub(info.text, 1, 12)
    baseName = "txt_" .. shortText
  else
    local w = math.floor(info.width or 0)
    local h = math.floor(info.height or 0)
    if w > 0 and h > 0 then
      baseName = string.format("rect_%dx%d", w, h)
    else
      baseName = "obj"
    end
  end

  return string.format("%s#%d", baseName, uniqueId)
end

local function isValidObject(obj, includeHidden)
  if not obj then return false end
  if obj._isDevUI then return false end

  local info = getObjectInfo(obj)

  if not info.x or not info.y then return false end

  if not includeHidden then
    if info.isVisible == false then return false end
    if info.alpha and info.alpha <= 0 then return false end
  end

  return true
end

local function getObjectZIndex(obj)
  local info = getObjectInfo(obj)
  local parent = info.parent
  if not parent then return 0 end

  local numChildren = 0
  pcall(function() numChildren = parent.numChildren or 0 end)

  for i = 1, numChildren do
    local child = nil
    pcall(function() child = parent[i] end)
    if child == obj then
      return i
    end
  end
  return 0
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

    if child and isValidObject(child, M.showHidden) then
      local info = getObjectInfo(child)
      table.insert(list, {
        obj = child,
        depth = depth,
        zIndex = i,
        isHidden = (info.isVisible == false) or (info.alpha and info.alpha <= 0)
      })

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

  local adjX = (x - display.contentCenterX) / M.zoomLevel + display.contentCenterX - M.panX
  local adjY = (y - display.contentCenterY) / M.zoomLevel + display.contentCenterY - M.panY

  return adjX >= bounds.xMin and adjX <= bounds.xMax and
         adjY >= bounds.yMin and adjY <= bounds.yMax
end

local function screenToWorld(x, y)
  local worldX = (x - display.contentCenterX) / M.zoomLevel + display.contentCenterX - M.panX
  local worldY = (y - display.contentCenterY) / M.zoomLevel + display.contentCenterY - M.panY
  return worldX, worldY
end

local function worldToLocal(obj, worldX, worldY)
  if not obj then return worldX, worldY end

  local parent = obj.parent
  if parent and parent.contentToLocal then
    local ok, localX, localY = pcall(parent.contentToLocal, parent, worldX, worldY)
    if ok then
      return localX, localY
    end
  end

  return worldX, worldY
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

  local matches = {}
  local worldX, worldY = screenToWorld(x, y)

  for _, item in ipairs(allObjects) do
    local bounds = nil
    pcall(function() bounds = item.obj.contentBounds end)

    if bounds then
      if worldX >= bounds.xMin and worldX <= bounds.xMax and
         worldY >= bounds.yMin and worldY <= bounds.yMax then
        local area, w, h = getObjectArea(item.obj)

        if w > 5 and h > 5 then
          table.insert(matches, {
            obj = item.obj,
            depth = item.depth,
            area = area,
            zIndex = item.zIndex,
            isHidden = item.isHidden
          })
        end
      end
    end
  end

  print(string.format("DEV: %d objects at world point (%.0f, %.0f)", #matches, worldX, worldY))

  table.sort(matches, function(a, b)
    if a.depth ~= b.depth then
      return a.depth > b.depth
    end
    return a.area < b.area
  end)

  for i, item in ipairs(matches) do
    local name = getObjectName(item.obj)
    local hiddenTag = item.isHidden and " [HIDDEN]" or ""
    print(string.format("  %d: %s (z=%d)%s", i, name, item.zIndex, hiddenTag))
  end

  return matches
end

local function removeHandles()
  for _, handle in pairs(M.handles) do
    pcall(function() handle:removeSelf() end)
  end
  M.handles = {}
end

local function createHandle(x, y, handleType)
  local handle = display.newRect(x, y, M.handleSize, M.handleSize)
  handle:setFillColor(1, 0.5, 0, 1)
  handle.strokeWidth = 2
  handle:setStrokeColor(1, 1, 1)
  handle._isDevUI = true
  handle._handleType = handleType
  return handle
end

local function updateHandles()
  removeHandles()

  if not M.resizeMode or not M.selectedObject then return end

  local obj = M.selectedObject
  local bounds = nil
  pcall(function() bounds = obj.contentBounds end)
  if not bounds then return end

  local xMin = (bounds.xMin + M.panX - display.contentCenterX) * M.zoomLevel + display.contentCenterX
  local xMax = (bounds.xMax + M.panX - display.contentCenterX) * M.zoomLevel + display.contentCenterX
  local yMin = (bounds.yMin + M.panY - display.contentCenterY) * M.zoomLevel + display.contentCenterY
  local yMax = (bounds.yMax + M.panY - display.contentCenterY) * M.zoomLevel + display.contentCenterY
  local midX = (xMin + xMax) / 2
  local midY = (yMin + yMax) / 2

  M.handles.topLeft = createHandle(xMin, yMin, "topLeft")
  M.handles.topCenter = createHandle(midX, yMin, "topCenter")
  M.handles.topRight = createHandle(xMax, yMin, "topRight")
  M.handles.middleLeft = createHandle(xMin, midY, "middleLeft")
  M.handles.middleRight = createHandle(xMax, midY, "middleRight")
  M.handles.bottomLeft = createHandle(xMin, yMax, "bottomLeft")
  M.handles.bottomCenter = createHandle(midX, yMax, "bottomCenter")
  M.handles.bottomRight = createHandle(xMax, yMax, "bottomRight")

  for _, handle in pairs(M.handles) do
    handle:toFront()
  end

  if M.touchOverlay then pcall(function() M.touchOverlay:toFront() end) end
  if M.infoBackground then pcall(function() M.infoBackground:toBack() end) end
  if M.infoText then pcall(function() M.infoText:toFront() end) end
end

local function getHandleAtPoint(x, y)
  for name, handle in pairs(M.handles) do
    local hx, hy = handle.x, handle.y
    local halfSize = M.handleSize / 2 + 4
    if x >= hx - halfSize and x <= hx + halfSize and
       y >= hy - halfSize and y <= hy + halfSize then
      return name
    end
  end
  return nil
end

local function createUI()
  if M.hudGroup then display.remove(M.hudGroup); M.hudGroup = nil end

  M.hudGroup = display.newGroup()
  M.hudGroup.x, M.hudGroup.y = M.hudPosX, M.hudPosY
  M.hudGroup.alpha = 0

  local hudWidth = 260
  local hudHeight = 160
  local padding = 10

  local bg = display.newRect(M.hudGroup, 0, 0, hudWidth, hudHeight)
  bg.anchorX, bg.anchorY = 0, 0
  bg:setFillColor(unpack(colMenuBg))
  M.infoBackground = bg

  local titleBar = display.newRect(M.hudGroup, 0, -22, hudWidth, 22)
  titleBar.anchorX, titleBar.anchorY = 0, 0
  titleBar:setFillColor(unpack(colTitleBg))
  titleBar.isHitTestable = true

  local titleText = display.newText({
    parent = M.hudGroup,
    text = "DEV",
    x = padding, y = -11,
    font = native.systemFontBold, fontSize = 12
  })
  titleText.anchorX = 0

  M.infoText = display.newText({
    parent = M.hudGroup,
    text = "",
    x = padding, y = padding,
    width = hudWidth - (padding * 2),
    font = native.systemFont, fontSize = 13,
    align = "left"
  })
  M.infoText.anchorX, M.infoText.anchorY = 0, 0
  M.infoText.isVisible = false

  local function onDrag(event)
    if event.phase == "began" then
      display.getCurrentStage():setFocus(titleBar)
      titleBar.isFocus = true
      M.hudDragX = event.x - M.hudGroup.x
      M.hudDragY = event.y - M.hudGroup.y
    elseif titleBar.isFocus and event.phase == "moved" then
      M.hudGroup.x = event.x - M.hudDragX
      M.hudGroup.y = event.y - M.hudDragY
      M.hudPosX = M.hudGroup.x
      M.hudPosY = M.hudGroup.y
    else
      display.getCurrentStage():setFocus(nil)
      titleBar.isFocus = false
      M.hudPosX = M.hudGroup.x
      M.hudPosY = M.hudGroup.y
    end
    return true
  end
  titleBar:addEventListener("touch", onDrag)

  transition.to(M.hudGroup, { time = 300, alpha = 1, y = 60, transition = easing.outQuad })
end

local function updateUI()
  local obj = M.selectedObject
  local modeText = M.resizeMode and "RESIZE" or "MOVE"
  local hiddenText = M.showHidden and "ON" or "OFF"

  for i = 1, #M.infoLines do
    if M.infoLines[i] then
      display.remove(M.infoLines[i])
    end
  end
  M.infoLines = {}

  local padding = 10
  local lineY = padding
  local lineGap = 14
  local width = 260 - (padding * 2)

  local function addLine(text, color, size, indent)
    local t = display.newText({
      parent = M.hudGroup,
      text = text,
      x = padding + (indent or 0),
      y = lineY,
      width = width - (indent or 0),
      font = native.systemFont,
      fontSize = size or 12,
      align = "left"
    })
    t.anchorX, t.anchorY = 0, 0
    t:setFillColor(unpack(color))
    M.infoLines[#M.infoLines + 1] = t
    lineY = lineY + lineGap
  end

  addLine("STATUS", colHeader, 12, 0)
  addLine(string.format("Mode: %s", modeText), colText, 12, 8)
  addLine(string.format("Zoom: %.0f%%", M.zoomLevel * 100), colText, 12, 8)
  addLine(string.format("Hidden: %s", hiddenText), colText, 12, 8)
  addLine(string.format("Base: %.0f, %.0f  %.0fx%.0f", display.screenOriginX, display.screenOriginY, display.actualContentWidth, display.actualContentHeight), colText, 12, 8)
  lineY = lineY + 6
  addLine("SELECTION", colHeader, 12, 0)
  if obj then
    local info = getObjectInfo(obj)
    local name = getObjectName(obj)
    local zIndex = getObjectZIndex(obj)
    local cycle = #M.objectsAtPoint > 1 and string.format(" (%d/%d)", M.currentObjectIndex, #M.objectsAtPoint) or ""
    local localX = math.floor(info.x or 0)
    local localY = math.floor(info.y or 0)
    local globalX, globalY
    local baseX, baseY, pctX, pctY
    local rightOffset, bottomOffset
    pcall(function() globalX, globalY = obj:localToContent(0, 0) end)
    if globalX and globalY then
      baseX = globalX - display.screenOriginX
      baseY = globalY - display.screenOriginY
      if display.actualContentWidth ~= 0 and display.actualContentHeight ~= 0 then
        pctX = (baseX / display.actualContentWidth) * 100
        pctY = (baseY / display.actualContentHeight) * 100
      end
      rightOffset = (display.screenOriginX + display.actualContentWidth) - globalX
      bottomOffset = (display.screenOriginY + display.actualContentHeight) - globalY
    end
    local isHidden = (info.isVisible == false) or (info.alpha and info.alpha <= 0)
    local hiddenTag = isHidden and " [HIDDEN]" or ""
    addLine(string.format("Target: %s%s%s", name, cycle, hiddenTag), colText, 12, 8)
    addLine(string.format("Layer: %d", zIndex), colText, 12, 8)
    lineY = lineY + 6
    addLine("TRANSFORM", colHeader, 12, 0)
    addLine(string.format("Pos L: %d, %d", localX, localY), colText, 12, 8)
    if globalX and globalY then
      addLine(string.format("Pos G: %d, %d", math.floor(globalX), math.floor(globalY)), colText, 12, 8)
      addLine(string.format("Pos Base: %d, %d", math.floor(baseX), math.floor(baseY)), colText, 12, 8)
      addLine(string.format("Pos %%: %.1f%%, %.1f%%", pctX or 0, pctY or 0), colText, 12, 8)
      addLine(string.format("From Edges: L%d T%d R%d B%d", math.floor(baseX), math.floor(baseY), math.floor(rightOffset or 0), math.floor(bottomOffset or 0)), colText, 12, 8)
    else
      addLine("Pos G: --", colText, 12, 8)
      addLine("Pos Base: --", colText, 12, 8)
      addLine("Pos %: --", colText, 12, 8)
      addLine("From Edges: --", colText, 12, 8)
    end
  else
    addLine("Target: None", colText, 12, 8)
    lineY = lineY + 6
    addLine("TRANSFORM", colHeader, 12, 0)
    addLine("Pos L: --", colText, 12, 8)
    addLine("Pos G: --", colText, 12, 8)
    addLine("Pos Base: --", colText, 12, 8)
    addLine("Pos %: --", colText, 12, 8)
    addLine("From Edges: --", colText, 12, 8)
  end

  if M.infoBackground then
    M.infoBackground.height = lineY + padding
  end

  M.hudGroup:toFront()
end

local function updateHighlight()
  if M.highlightRect then
    pcall(function() M.highlightRect:removeSelf() end)
    M.highlightRect = nil
  end

  local obj = M.selectedObject
  if not obj then
    removeHandles()
    return
  end

  local bounds = nil
  pcall(function() bounds = obj.contentBounds end)
  if not bounds then return end

  local info = getObjectInfo(obj)
  local isHidden = (info.isVisible == false) or (info.alpha and info.alpha <= 0)

  local xMin = (bounds.xMin + M.panX - display.contentCenterX) * M.zoomLevel + display.contentCenterX
  local xMax = (bounds.xMax + M.panX - display.contentCenterX) * M.zoomLevel + display.contentCenterX
  local yMin = (bounds.yMin + M.panY - display.contentCenterY) * M.zoomLevel + display.contentCenterY
  local yMax = (bounds.yMax + M.panY - display.contentCenterY) * M.zoomLevel + display.contentCenterY

  local w = xMax - xMin + 8
  local h = yMax - yMin + 8
  local cx = (xMin + xMax) / 2
  local cy = (yMin + yMax) / 2

  M.highlightRect = display.newRect(cx, cy, w, h)
  M.highlightRect:setFillColor(0, 0, 0, 0)
  M.highlightRect.strokeWidth = 3

  if isHidden then
    M.highlightRect:setStrokeColor(1, 0, 1)
  elseif M.resizeMode then
    M.highlightRect:setStrokeColor(1, 0.5, 0)
  else
    M.highlightRect:setStrokeColor(1, 1, 0)
  end
  M.highlightRect._isDevUI = true

  updateHandles()

  if M.touchOverlay then pcall(function() M.touchOverlay:toFront() end) end
  if M.infoBackground then pcall(function() M.infoBackground:toBack() end) end
  if M.infoText then pcall(function() M.infoText:toFront() end) end
end

local function applyZoom()
  local stage = display.getCurrentStage()
  updateHighlight()
  updateUI()
end

local function saveUndo(obj)
  if not obj then return end
  local info = getObjectInfo(obj)
  local zIndex = getObjectZIndex(obj)
  table.insert(M.undoStack, {
    obj = obj,
    x = info.x,
    y = info.y,
    width = info.width,
    height = info.height,
    zIndex = zIndex
  })
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
      local ux = tonumber(last.x) or 0
      local uy = tonumber(last.y) or 0
      local uw = tonumber(last.width) or 0
      local uh = tonumber(last.height) or 0
      print(string.format("DEV: Undo - restored to (%d, %d) size %dx%d", ux, uy, uw, uh))
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

local function moveZOrder(direction)
  local obj = M.selectedObject
  if not obj then return end

  local info = getObjectInfo(obj)
  local parent = info.parent
  if not parent then return end

  saveUndo(obj)

  if direction == "front" then
    pcall(function() obj:toFront() end)
    print("DEV: Moved to front")
  elseif direction == "back" then
    pcall(function() obj:toBack() end)
    print("DEV: Moved to back")
  elseif direction == "up" then
    local currentZ = getObjectZIndex(obj)
    local numChildren = 0
    pcall(function() numChildren = parent.numChildren or 0 end)

    if currentZ < numChildren then
      local objAbove = nil
      pcall(function() objAbove = parent[currentZ + 1] end)
      if objAbove then
        pcall(function() obj:toFront() end)
        print("DEV: Moved up (z-index: " .. getObjectZIndex(obj) .. ")")
      end
    end
  elseif direction == "down" then
    local currentZ = getObjectZIndex(obj)
    if currentZ > 1 then
      pcall(function() obj:toBack() end)
      print("DEV: Moved down (z-index: " .. getObjectZIndex(obj) .. ")")
    end
  end

  updateUI()
end

local function applyResize(handleType, dx, dy)
  local obj = M.selectedObject
  if not obj then return end

  local newWidth = M.dragStartWidth
  local newHeight = M.dragStartHeight

  dx = dx / M.zoomLevel
  dy = dy / M.zoomLevel

  if handleType == "topLeft" then
    newWidth = math.max(20, M.dragStartWidth - dx)
    newHeight = math.max(20, M.dragStartHeight - dy)
  elseif handleType == "topCenter" then
    newHeight = math.max(20, M.dragStartHeight - dy)
  elseif handleType == "topRight" then
    newWidth = math.max(20, M.dragStartWidth + dx)
    newHeight = math.max(20, M.dragStartHeight - dy)
  elseif handleType == "middleLeft" then
    newWidth = math.max(20, M.dragStartWidth - dx)
  elseif handleType == "middleRight" then
    newWidth = math.max(20, M.dragStartWidth + dx)
  elseif handleType == "bottomLeft" then
    newWidth = math.max(20, M.dragStartWidth - dx)
    newHeight = math.max(20, M.dragStartHeight + dy)
  elseif handleType == "bottomCenter" then
    newHeight = math.max(20, M.dragStartHeight + dy)
  elseif handleType == "bottomRight" then
    newWidth = math.max(20, M.dragStartWidth + dx)
    newHeight = math.max(20, M.dragStartHeight + dy)
  end

  pcall(function()
    obj.width = newWidth
    obj.height = newHeight
  end)
end

local function onTouch(event)
  if not M.enabled then return false end

  local phase = event.phase
  local x, y = event.x, event.y

  if phase == "began" then
    if event.isPrimaryButtonDown == false or event.isMiddleButtonDown then
      M.isPanning = true
      M.panStartX = x
      M.panStartY = y
      display.getCurrentStage():setFocus(M.touchOverlay)
      return true
    end

    print("")
    print(string.format("DEV: Touch at screen (%d, %d)", x, y))

    if M.resizeMode and M.selectedObject then
      local handle = getHandleAtPoint(x, y)
      if handle then
        print("DEV: Dragging resize handle: " .. handle)
        saveUndo(M.selectedObject)
        M.isResizing = true
        M.resizeHandle = handle
        M.dragStartX = x
        M.dragStartY = y
        local info = getObjectInfo(M.selectedObject)
        M.dragStartWidth = info.width or 100
        M.dragStartHeight = info.height or 100
        display.getCurrentStage():setFocus(M.touchOverlay)
        return true
      end
    end

    if M.selectedObject then
      local bounds = nil
      pcall(function() bounds = M.selectedObject.contentBounds end)
      if bounds then
        local worldX, worldY = screenToWorld(x, y)
        if worldX >= bounds.xMin and worldX <= bounds.xMax and
           worldY >= bounds.yMin and worldY <= bounds.yMax then
          print("DEV: Dragging currently selected object")
          saveUndo(M.selectedObject)
          M.isDragging = true
          local info = getObjectInfo(M.selectedObject)
          local localX, localY = worldToLocal(M.selectedObject, worldX, worldY)
          M.dragOffsetX = (info.x or 0) - localX
          M.dragOffsetY = (info.y or 0) - localY
          display.getCurrentStage():setFocus(M.touchOverlay)
          return true
        end
      end
    end

    M.objectsAtPoint = findObjectsAt(x, y)
    M.currentObjectIndex = 1

    if #M.objectsAtPoint > 0 then
      local obj = M.objectsAtPoint[1].obj
      saveUndo(obj)
      selectObject(obj)
      M.isDragging = true

      local info = getObjectInfo(obj)
      local worldX, worldY = screenToWorld(x, y)
      local localX, localY = worldToLocal(obj, worldX, worldY)
      M.dragOffsetX = (info.x or 0) - localX
      M.dragOffsetY = (info.y or 0) - localY

      display.getCurrentStage():setFocus(M.touchOverlay)
    else
      print("DEV: No objects found at this location")
    end
    return true

  elseif phase == "moved" then
    if M.isPanning then
      local dx = x - M.panStartX
      local dy = y - M.panStartY
      M.panX = M.panX + dx / M.zoomLevel
      M.panY = M.panY + dy / M.zoomLevel
      M.panStartX = x
      M.panStartY = y
      updateHighlight()
      return true
    elseif M.isResizing and M.selectedObject and M.resizeHandle then
      local dx = x - M.dragStartX
      local dy = y - M.dragStartY
      applyResize(M.resizeHandle, dx, dy)
      updateHighlight()
    elseif M.isDragging and M.selectedObject then
      local worldX, worldY = screenToWorld(x, y)
      local localX, localY = worldToLocal(M.selectedObject, worldX, worldY)
      pcall(function()
        M.selectedObject.x = localX + M.dragOffsetX
        M.selectedObject.y = localY + M.dragOffsetY
      end)
      updateHighlight()
    end
    return true

  elseif phase == "ended" or phase == "cancelled" then
    M.isDragging = false
    M.isResizing = false
    M.isPanning = false
    M.resizeHandle = nil
    display.getCurrentStage():setFocus(nil)
    if M.selectedObject then
      updateUI()
      updateHighlight()
    end
    return true
  end

  return true
end

local function onMouseWheel(event)
  if not M.enabled then return false end

  local scrollY = event.scrollY or 0

  if scrollY > 0 then
    M.zoomLevel = math.min(M.maxZoom, M.zoomLevel + 0.1)
  elseif scrollY < 0 then
    M.zoomLevel = math.max(M.minZoom, M.zoomLevel - 0.1)
  end

  print(string.format("DEV: Zoom level: %.0f%%", M.zoomLevel * 100))
  applyZoom()
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

  if event.keyName == "z" then
    undo()
    return true
  end

  if event.keyName == "r" then
    M.resizeMode = not M.resizeMode
    local modeText = M.resizeMode and "RESIZE" or "MOVE"
    print("DEV: Switched to " .. modeText .. " mode")
    createUI()
    updateHighlight()
    updateUI()
    return true
  end

  if event.keyName == "h" then
    M.showHidden = not M.showHidden
    print("DEV: Show hidden objects: " .. tostring(M.showHidden))
    createUI()
    updateUI()
    return true
  end

  if event.keyName == "[" or event.keyName == "leftBracket" then
    moveZOrder("back")
    return true
  end

  if event.keyName == "]" or event.keyName == "rightBracket" then
    moveZOrder("front")
    return true
  end

  if event.keyName == "0" then
    M.zoomLevel = 1
    M.panX = 0
    M.panY = 0
    print("DEV: Reset zoom and pan")
    applyZoom()
    return true
  end

  if event.keyName == "=" or event.keyName == "+" then
    M.zoomLevel = math.min(M.maxZoom, M.zoomLevel + 0.1)
    applyZoom()
    return true
  end

  if event.keyName == "-" then
    M.zoomLevel = math.max(M.minZoom, M.zoomLevel - 0.1)
    applyZoom()
    return true
  end

  if M.selectedObject then
    local step = 1
    if event.isShiftDown then step = 10 end

    local changed = false

    if M.resizeMode then
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
  M.objectIdCounter = 0
  M.objectIdMap = {}
  setmetatable(M.objectIdMap, {__mode = "k"})
  M.zoomLevel = 1
  M.panX = 0
  M.panY = 0

  if M.touchOverlay then pcall(function() M.touchOverlay:removeSelf() end) end

  M.touchOverlay = display.newRect(
    display.contentCenterX,
    display.contentCenterY,
    display.actualContentWidth + 2000,
    display.actualContentHeight + 2000
  )
  M.touchOverlay:setFillColor(0, 0, 0, 0.01)
  M.touchOverlay._isDevUI = true
  M.touchOverlay:addEventListener("touch", onTouch)
  M.touchOverlay:toFront()

  Runtime:addEventListener("mouse", onMouseWheel)

  createUI()
  if M.hudGroup then M.hudGroup:toFront() end
  if M.infoText then M.infoText:toFront() end

  print("")
  print("================================================")
  print("  DEV TOOLS v6 ENABLED")
  print("================================================")
  print("  Each object has a unique ID (#1, #2...)")
  print("")
  print("  SELECTION:")
  print("    Click       = Select object")
  print("    Tab         = Cycle overlapping objects")
  print("    H           = Toggle hidden objects")
  print("")
  print("  MOVE/RESIZE:")
  print("    Drag        = Move object")
  print("    R           = Toggle MOVE/RESIZE mode")
  print("    Arrows      = Move/Resize (4px)")
  print("    Shift+Arr   = Move/Resize (40px)")
  print("")
  print("  Z-ORDER (layering):")
  print("    ]           = Bring to front")
  print("    [           = Send to back")
  print("")
  print("  ZOOM/PAN:")
  print("    Scroll      = Zoom in/out")
  print("    +/-         = Zoom in/out")
  print("    Middle-drag = Pan view")
  print("    0           = Reset zoom/pan")
  print("")
  print("  OTHER:")
  print("    Z           = Undo")
  print("    D           = Disable dev tools")
  print("================================================")
  print("")
end

function M.disable()
  M.enabled = false
  M.selectedObject = nil
  M.isDragging = false
  M.isResizing = false
  M.isPanning = false
  M.resizeHandle = nil
  M.objectsAtPoint = {}
  M.undoStack = {}
  M.resizeMode = false
  M.showHidden = false
  M.zoomLevel = 1
  M.panX = 0
  M.panY = 0

  Runtime:removeEventListener("mouse", onMouseWheel)
  removeHandles()

  if M.hudGroup then
    transition.to(M.hudGroup, {
      time = 200,
      alpha = 0,
      y = 40,
      onComplete = function()
        display.remove(M.hudGroup)
        M.hudGroup = nil
        M.infoText = nil
      end
    })
  end

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
  if M.highlightRect then
    pcall(function() M.highlightRect:removeSelf() end)
    M.highlightRect = nil
  end

  print("DEV TOOLS DISABLED")
end

function M.init()
  Runtime:addEventListener("key", onKey)
  print("")
  print(">>> Dev Tools v6 loaded - Press D to enable <<<")
  print("")
end

M.init()
composer.devTools = M

return M
