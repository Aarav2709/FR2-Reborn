local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 1920, 1080)
  backgroundImage.x = 0
  backgroundImage.y = 0
  sceneGroup:insert(backgroundImage)

  local comingSoonText = composer.newText({
    string = "Coming Soon...",
    size = 28,
    color = { 1, 1, 1 }
  })
  comingSoonText.x = display.contentWidth * 0.5
  comingSoonText.y = display.contentHeight * 0.5
  sceneGroup:insert(comingSoonText)
end

scene:addEventListener("create", scene)
return scene
