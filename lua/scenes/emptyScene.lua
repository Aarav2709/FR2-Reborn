local composer = require("composer")
local scene = composer.newScene()
local backgroundImage, searchText, layoutEmptyScene, resizeListener

function scene:create(event)
  local group = self.view
  backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  group:insert(backgroundImage)
  searchText = composer.newText({
    string = composer.localized.get("LoadingGame"),
    x = 0,
    y = 0,
    size = 27
  })
  group:insert(searchText)
  layoutEmptyScene = function()
    local contentLeft = display.screenOriginX
    local contentTop = display.screenOriginY
    local contentWidth = display.actualContentWidth
    local contentHeight = display.actualContentHeight
    local centerX = contentLeft + contentWidth * 0.5
    local centerY = contentTop + contentHeight * 0.5

    if backgroundImage then
      backgroundImage.x = centerX
      backgroundImage.y = centerY
      backgroundImage.xScale = 1
      backgroundImage.yScale = 1
      local scale = math.max(contentWidth / backgroundImage.width, contentHeight / backgroundImage.height)
      backgroundImage.xScale = scale
      backgroundImage.yScale = scale
    end
    if searchText then
      searchText.x = centerX
      searchText.y = centerY
    end
  end
  if layoutEmptyScene then
    layoutEmptyScene()
  end
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local group = self.view
  resizeListener = function()
    if layoutEmptyScene then
      layoutEmptyScene()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  local group = self.view
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
end

function scene:destroy(event)
  local group = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
