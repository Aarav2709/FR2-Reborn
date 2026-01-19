local composer = require("composer")
local assetLoader = require("lua.modules.assetLoader")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local screenGroup = self.view
  composer.cheater = false
  
  local function btnRegisterRelease(event)
    local options = {isModal = true}
    composer.showOverlay("lua.overlays.createUser", options)
  end
  
  local function btnLoginRelease(event)
    local options = {isModal = true}
    composer.showOverlay("lua.overlays.loginUser", options)
  end
  
  local backgroundImage = display.newImageRect("images/gui/common/bgBlur.png", 480, 320)
  backgroundImage.x = display.contentWidth * 0.5
  backgroundImage.y = display.contentHeight * 0.5
  screenGroup:insert(backgroundImage)
  local logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  logo.x = display.contentWidth * 0.5
  logo.y = display.contentHeight * 0.25
  screenGroup:insert(logo)
  local btnRegister = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = composer.localized.get("NewPlayer"),
    onRelease = btnRegisterRelease,
    width = 126,
    height = 40,
    x = display.contentWidth * 0.45,
    y = 250
  })
  local btnLogin = composer.newButton({
    image = "images/gui/login/login.png",
    onRelease = btnLoginRelease,
    width = 50,
    height = 40,
    x = display.contentWidth * 0.65,
    y = 250
  })
  
  local function updateDisplayGroups()
    screenGroup:insert(btnRegister)
    screenGroup:insert(btnLogin)
  end
  
  function clean()
    display.remove(btnRegister)
    display.remove(btnLogin)
  end
  
  updateDisplayGroups()
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  local tcpSocial = require("lua.network.tcpSocial")
  composer.data.tutorial = true
  assetLoader.loadBaseSounds()
  assetLoader.loadFacebook()
  if isSimulator and composer.config.bot then
    local newName = "Guest" .. math.random(1, 1000)
    composer.database.setOnboardingPartDone(1)
    composer.commHttps.sendRegisterMessage(newName)
  end
  
  function cleanEnter()
    androidLogic.removeBackButton()
  end
  
  androidLogic.addBackButton()
  tcpSocial.toggleNetworkAlert()
  composer.commHttps.getUserOnDeviceId()
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if cleanEnter then
      cleanEnter()
      cleanEnter = nil
    end
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
