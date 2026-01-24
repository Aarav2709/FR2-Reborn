local composer = require("composer")
local scene = composer.newScene()
local cleanEnter
local backgroundImage, layoutBufferScene, resizeListener

function scene:create(event)
  local group = self.view
  backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 1920, 1080)
  group:insert(backgroundImage)
  layoutBufferScene = function()
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
  end
  if layoutBufferScene then
    layoutBufferScene()
  end
  print("Creating bufferscene")
end

function scene:show(event)
  print("Enter bufferscene")
  local phase = event.phase
  if phase == "will" then
    return
  end
  local group = self.view
  local statedClean = false
  local startGameTimer
  resizeListener = function()
    if layoutBufferScene then
      layoutBufferScene()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()

  local function startGame()
    composer.gotoScene("lua.scenes.gamePlay")
    composer.removeScene("lua.scenes.bufferScene")
  end

  function cleanEnter()
    statedClean = true
    if startGameTimer then
      timer.cancel(startGameTimer)
      startGameTimer = nil
    end
  end

  print("Starting timer")
  startGame()
end

function scene:hide(event)
  print("Exit bufferscene")
  local phase = event.phase
  if phase == "did" then
    return
  end
  local group = self.view
  if resizeListener then
    Runtime:removeEventListener("resize", resizeListener)
    resizeListener = nil
  end
  if cleanEnter then
    cleanEnter()
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
