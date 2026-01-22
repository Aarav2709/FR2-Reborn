local composer = require("composer")
local scene = composer.newScene()
local clean
local backgroundImage, logo, infoText, btnUpdate
local layoutUpdateScene, resizeListener

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

  backgroundImage = display.newImageRect("images/gui/common/bgMain_blur.png", 1920, 1080)
  logo = display.newImageRect("images/gui/common/logo.png", 224, 135)
  infoText = composer.newText({
    string = composer.localized.get("PleaseUpdateApp"),
    size = 20,
    x = 0,
    y = 0
  })
  btnUpdate = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = composer.localized.get("Update"),
    onRelease = btnUpdateRelease,
    width = 126,
    height = 40,
    x = 0,
    y = 0
  })

  layoutUpdateScene = function()
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
    if infoText then
      infoText.x = centerX
      infoText.y = contentTop + contentHeight * (200 / 320)
    end
    if btnUpdate then
      btnUpdate.x = centerX
      btnUpdate.y = contentTop + contentHeight * (250 / 320)
    end
  end

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
  if layoutUpdateScene then
    layoutUpdateScene()
  end
  androidLogic.addBackButton()
  composer.comm.stopTCPSocial(true)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    resizeListener = function()
      if layoutUpdateScene then
        layoutUpdateScene()
      end
    end
    Runtime:addEventListener("resize", resizeListener)
    resizeListener()
  elseif phase == "did" then
  end
end

function scene:hide(event)
  local phase = event.phase
  if phase == "will" then
    if resizeListener then
      Runtime:removeEventListener("resize", resizeListener)
      resizeListener = nil
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
