local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local group = self.view
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  group:insert(backgroundImage)
  local searchText = composer.newText({
    string = composer.localized.get("LoadingGame"),
    x = display.contentWidth * 0.5,
    y = display.contentHeight * 0.5,
    size = 27
  })
  group:insert(searchText)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local group = self.view
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    return
  end
  local group = self.view
end

function scene:destroy(event)
  local group = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
