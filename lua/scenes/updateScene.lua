local composer = require("composer")
local scene = composer.newScene()
local clean

function scene:create(event)
  local screenGroup = self.view
  local androidLogic = require("lua.modules.androidBackButton")
  composer.cheater = false
  
  local function btnUpdateRelease(event)
    if isAndroid then
      local address = "market://details?id=com.dirtybit.funrun2"
      if system.getInfo("targetAppStore") == "amazon" then
        address = "amzn://apps/android?p=com.dirtybit.funrun2"
      end
      system.openURL(address)
    else
      system.openURL("https://itunes.apple.com/us/app/fun-run-2-multiplayer-race/id920482331?l=nb&ls=1&mt=8")
    end
  end
  
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  local logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  logo.x = display.contentWidth * 0.5
  logo.y = display.contentHeight * 0.25
  local infoText = composer.newText({
    string = composer.localized.get("PleaseUpdateApp"),
    size = 20,
    x = 240,
    y = 200
  })
  local btnUpdate = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = composer.localized.get("Update"),
    onRelease = btnUpdateRelease,
    width = 126,
    height = 40,
    x = display.contentWidth * 0.5,
    y = 250
  })
  
  local function updateDisplayGroups()
    screenGroup:insert(backgroundImage)
    screenGroup:insert(logo)
    screenGroup:insert(btnUpdate)
    screenGroup:insert(infoText)
  end
  
  function clean()
    display.remove(btnUpdate)
    androidLogic.removeBackButton()
  end
  
  updateDisplayGroups()
  androidLogic.addBackButton()
  composer.comm.stopTCPSocial(true)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
  elseif phase == "did" then
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
  elseif phase == "did" then
  end
end

function scene:destroy(event)
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
