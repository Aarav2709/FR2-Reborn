local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  composer.createCustomOverlay(1)
  composer.gotoScene("lua.scenes.mainMenu")
end

scene:addEventListener("create", scene)
return scene
