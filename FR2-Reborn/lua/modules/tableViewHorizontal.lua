local screenW, screenH = 330, display.contentHeight
local viewableScreenW, viewableScreenH = display.viewableContentWidth, display.viewableContentHeight
local screenOffsetW, screenOffsetH = display.contentWidth - display.viewableContentWidth, display.contentHeight - display.viewableContentHeight
local centerScreenX = 240
local currentTarget, detailScreen, velocity, currentDefault, currentOver, prevY, onScrollEnd, numberOfItems, delta, startPos, prevPos
local startTime, lastTime, prevTime = 0, 0, 0
local M = {}

local function showHighlight(event)
  local timePassed = system.getTimer() - startTime
  if 100 < timePassed then
    currentDefault.isVisible = false
    currentOver.isVisible = true
    Runtime:removeEventListener("enterFrame", showHighlight)
  end
end

M.showHighlight = showHighlight

local function trackVelocity(event)
  local timePassed = event.time - prevTime
  prevTime = prevTime + timePassed
  if prevY then
    velocity = (currentTarget.x - prevY) / timePassed
  end
  prevY = currentTarget.x
end

M.trackVelocity = trackVelocity

local function in_table(e, t)
  for _, v in pairs(t) do
    if v == e then
      return true
    end
  end
  return false
end

M.in_table = in_table

local function scrollList(event)
  local friction = 0.9
  local timePassed = event.time - lastTime
  lastTime = lastTime + timePassed
  if math.abs(velocity) < 0.05 then
    velocity = 0
    Runtime:removeEventListener("enterFrame", scrollList)
  end
  velocity = velocity * friction
  currentTarget.x = math.floor(currentTarget.x + velocity * timePassed)
  local upperLimit = currentTarget.left
  local bottomLimit = screenW - currentTarget.width - currentTarget.right
  if upperLimit < currentTarget.x then
    velocity = 0
    onScrollEnd(1)
    Runtime:removeEventListener("enterFrame", scrollList)
    currentTarget.tween = transition.to(currentTarget, {
      time = 400,
      x = upperLimit,
      transition = easing.outQuad
    })
  elseif bottomLimit > currentTarget.x and bottomLimit < 0 then
    velocity = 0
    onScrollEnd(numberOfItems)
    Runtime:removeEventListener("enterFrame", scrollList)
    currentTarget.tween = transition.to(currentTarget, {
      time = 400,
      x = bottomLimit,
      transition = easing.outQuad
    })
  elseif bottomLimit > currentTarget.x then
    velocity = 0
    onScrollEnd(numberOfItems)
    Runtime:removeEventListener("enterFrame", scrollList)
    currentTarget.tween = transition.to(currentTarget, {
      time = 400,
      x = bottomLimit,
      transition = easing.outQuad
    })
  elseif velocity == 0 then
    local numberOfCells = math.round(math.abs((centerScreenX - currentTarget.x) / currentTarget[1].width))
    onScrollEnd(numberOfCells + 1)
    local nearestCellPosition = centerScreenX - currentTarget[1].width * numberOfCells
    Runtime:removeEventListener("enterFrame", scrollList)
    currentTarget.tween = transition.to(currentTarget, {
      time = 200,
      x = nearestCellPosition,
      transition = easing.outQuad
    })
  end
  return true
end

M.scrollList = scrollList

local function newListItemHandler(self, event)
  local t = currentTarget
  local phase = event.phase
  local default = self.default
  local over = self.over
  local left = self.left
  local right = self.right
  local upperLimit, bottomLimit = left, screenW - currentTarget.width - right
  local result = true
  if phase == "began" then
    if event.x > 100 then
      display.getCurrentStage():setFocus(self)
      self.isFocus = true
      startPos = event.x
      prevPos = event.x
      delta, velocity = 0, 0
      if currentTarget.tween then
        transition.cancel(currentTarget.tween)
      end
      Runtime:removeEventListener("enterFrame", scrollList)
      Runtime:addEventListener("enterFrame", trackVelocity)
      if over then
        currentDefault = default
        currentOver = over
        startTime = system.getTimer()
        Runtime:addEventListener("enterFrame", showHighlight)
      end
    end
  elseif self.isFocus then
    if phase == "moved" then
      Runtime:removeEventListener("enterFrame", showHighlight)
      if over then
        default.isVisible = true
        over.isVisible = false
      end
      delta = event.x - prevPos
      prevPos = event.x
      if upperLimit < t.x or bottomLimit > t.x then
        t.x = t.x + delta / 2
      else
        t.x = t.x + delta
      end
    elseif phase == "ended" or phase == "cancelled" then
      lastTime = event.time
      local dragDistance = event.x - startPos
      Runtime:removeEventListener("enterFrame", trackVelocity)
      Runtime:addEventListener("enterFrame", scrollList)
      local bounds = self.stageBounds
      local x, y = event.x, event.y
      local isWithinBounds = x >= bounds.xMin and x <= bounds.xMax and y >= bounds.yMin and y <= bounds.yMax
      if isWithinBounds and dragDistance < 10 and -10 < dragDistance then
        onScrollEnd(self.data.index, true)
        local newX = centerScreenX - self.width * (self.data.index - 1)
        local timeVal = 400
        velocity = 0
        Runtime:removeEventListener("enterFrame", scrollList)
        currentTarget.tween = transition.to(currentTarget, {
          time = 400,
          x = newX,
          transition = easing.outQuad
        })
        velocity = 0
        result = self.onRelease(event)
      end
      display.getCurrentStage():setFocus(nil)
      self.isFocus = false
      if over then
        default.isVisible = true
        over.isVisible = false
        Runtime:removeEventListener("enterFrame", showHighlight)
      end
    end
  end
  return result
end

M.newListItemHandler = newListItemHandler

local function newListItem(params)
  local data = params.data
  local default = params.default
  local over = params.over
  local onRelease = params.onRelease
  local left = params.left
  local right = params.right
  local callback = params.callback
  local id = params.id
  local height = params.height
  local width = params.width
  local thisItem = display.newGroup()
  local backgroundRect = display.newRect(0, -height, width, height * 2)
  backgroundRect.anchorX = 0
  backgroundRect.anchorY = 0
  backgroundRect:setFillColor(1, 1, 1, 0.01)
  thisItem:insert(backgroundRect)
  thisItem.id = id
  thisItem.data = data
  thisItem.onRelease = onRelease
  thisItem.left = left
  thisItem.right = right
  if data.price or data.tier then
    local t = callback(data)
    thisItem:insert(t)
    thisItem.group = t
  end
  thisItem.touch = newListItemHandler
  thisItem:addEventListener("touch", thisItem)
  return thisItem
end

M.newListItem = newListItem

local function newList(params)
  local textSize = 16
  local data = params.data
  local over = params.over
  local onRelease = params.onRelease
  local left = params.left or 20
  local right = params.right or 48
  local cat = params.cat
  local order = params.order or {}
  local categoryBackground = params.categoryBackground
  local backgroundShadow = params.backgroundShadow
  local callback = params.callback or function(item)
    local t = display.newText(item, 0, 0, native.systemFontBold, textSize)
    t:setFillColor(1, 1, 1)
    t.x = math.floor(t.width / 2) + 20
    t.y = 24
    return t
  end
  local listView = display.newGroup()
  local prevY, prevH = 0, 0
  local j = 1
  local c = {}
  local dataTable = {}
  local offset = 12
  while true do
    local h = order[j]
    if h then
      local g = display.newGroup()
      local b
      if categoryBackground then
        b = display.newImage(categoryBackground, true)
      else
        b = display.newRect(0, 0, screenW, textSize * 1.5)
        b:setFillColor(0, 0, 0, 0.39215686274509803)
      end
      g:insert(b)
      local labelShadow = display.newText(h, 0, 0, native.systemFontBold, textSize)
      labelShadow:setFillColor(0, 0, 0, 0.5019607843137255)
      g:insert(labelShadow, true)
      labelShadow.x = labelShadow.width * 0.5 + 1 + offset + screenOffsetW * 0.5
      labelShadow.y = textSize * 0.8 + 1
      local t = display.newText(h, 0, 0, native.systemFontBold, textSize)
      t:setFillColor(1, 1, 1)
      g:insert(t)
      t.x = t.width * 0.5 + offset + screenOffsetW * 0.5
      t.y = textSize * 0.8
      listView:insert(g)
      g.x = 0
      g.y = prevY + prevH
      prevY = g.y
      prevH = g.height
      table.insert(c, g)
      c[#c].yInit = g.y
    end
    for i = 1, #data do
      if data[i][cat] == h then
        local thisItem = newListItem({
          data = data[i],
          default = data[i].image,
          over = over,
          onRelease = onRelease,
          left = left,
          right = right,
          callback = callback,
          id = i,
          height = params.height,
          width = params.width
        })
        dataTable[i] = thisItem
        listView:insert(1, thisItem)
        thisItem.x = prevY + prevH
        thisItem.y = 0 + screenOffsetW * 0.5
        prevY = thisItem.x
        prevH = thisItem.width
      end
    end
    j = j + 1
    if not order[j] then
      break
    end
  end
  if backgroundShadow then
  end
  listView.y = 0
  listView.left = left
  listView.right = right
  listView.c = c
  listView.dataTable = dataTable
  currentTarget = listView
  numberOfItems = #data
  if params.onScrollEnd then
    onScrollEnd = params.onScrollEnd
  else
    function onScrollEnd(i)
      print("Missing onScrollEnd function " .. i)
    end
  end
  
  function listView:cleanUp()
    Runtime:removeEventListener("enterFrame", scrollList)
    Runtime:removeEventListener("enterFrame", showHighlight)
    Runtime:removeEventListener("enterFrame", trackVelocity)
    local i
    for i = listView.numChildren, 1, -1 do
      listView[i]:removeEventListener("touch", newListItemHandler)
      listView:remove(i)
      listView[i] = nil
    end
  end
  
  function listView:scrollTo(itemNumber)
    local newX = centerScreenX - self[1].width * (itemNumber - 1)
    local timeVal = 400
    velocity = 0
    Runtime:removeEventListener("enterFrame", scrollList)
    self.tween = transition.to(self, {
      time = 400,
      x = newX,
      transition = easing.outQuad
    })
  end
  
  function listView:startAt(itemNumber)
    self.x = centerScreenX - self[1].width * (itemNumber - 1)
  end
  
  return listView
end

M.newList = newList
return M
