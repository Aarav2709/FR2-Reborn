local composer = require("composer")
local scene = composer.newScene()
local cleanEnter

function scene:create(event)
  local group = self.view
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  group:insert(backgroundImage)
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
