local composer = require("composer")
local assetLoader = require("lua.modules.assetLoader")
local scene = composer.newScene()
local clean, cleanEnter
local backgroundImage, logo, btnRegister, btnLogin
local layoutStartScreen, resizeListener

function scene:create(event)
  local screenGroup = self.view
  composer.cheater = false

  local function btnRegisterRelease(event)
    local options = { isModal = true }
    composer.showOverlay("lua.overlays.createUser", options)
  end

  local function btnLoginRelease(event)
    local options = { isModal = true }
    composer.showOverlay("lua.overlays.loginUser", options)
  end

  backgroundImage = display.newImageRect("images/gui/common/bgMain_blur.png", 480, 320)
  screenGroup:insert(backgroundImage)
  logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  screenGroup:insert(logo)
  btnRegister = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = composer.localized.get("NewPlayer"),
    onRelease = btnRegisterRelease,
    width = 126,
    height = 40,
    x = 0,
    y = 0
  })
  btnLogin = composer.newButton({
    image = "images/gui/login/login.png",
    onRelease = btnLoginRelease,
    width = 50,
    height = 40,
    x = 0,
    y = 0
  })

  layoutStartScreen = function()
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
    if logo then
      logo.x = centerX
      logo.y = contentTop + contentHeight * 0.25
    end
    if btnRegister then
      btnRegister.x = contentLeft + contentWidth * 0.45
      btnRegister.y = contentTop + contentHeight * 0.78
    end
    if btnLogin then
      btnLogin.x = contentLeft + contentWidth * 0.65
      btnLogin.y = contentTop + contentHeight * 0.78
    end
  end

  local function updateDisplayGroups()
    screenGroup:insert(btnRegister)
    screenGroup:insert(btnLogin)
  end

  function clean()
    display.remove(btnRegister)
    display.remove(btnLogin)
  end

  updateDisplayGroups()
  if layoutStartScreen then
    layoutStartScreen()
  end
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

  resizeListener = function()
    if layoutStartScreen then
      layoutStartScreen()
    end
  end
  Runtime:addEventListener("resize", resizeListener)
  resizeListener()

  androidLogic.addBackButton()
  tcpSocial.toggleNetworkAlert()
  composer.commHttps.getUserOnDeviceId()
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if resizeListener then
      Runtime:removeEventListener("resize", resizeListener)
      resizeListener = nil
    end
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
