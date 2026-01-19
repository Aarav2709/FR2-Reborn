local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter, overlayEndedData

function scene:create(event)
  local setGameModeFunction = event.params.setGameModeFunction
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local mapTable
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/customplay/settingsWindow.png", 251, 320)
  tableBackground.x = 240
  tableBackground.y = 160
  local tableTitleBakground = display.newImageRect("images/gui/customplay/settingsHeader.png", 226, 36)
  tableTitleBakground.anchorY = 0
  tableTitleBakground.x = 240
  tableTitleBakground.y = 0
  local infoText = composer.newText({
    string = composer.localized.get("SelectLevel"),
    x = tableBackground.x,
    y = 16,
    size = 20,
    color = {
      1,
      1,
      1
    }
  })
  
  local function closeOverlayButtonEvent()
    composer.hideOverlay()
  end
  
  local function closeOnTouchEvent(event)
    if event.phase == "ended" then
      composer.hideOverlay()
    end
    return true
  end
  
  local function doNothingOnTouchEvent(event)
    return true
  end
  
  local closeOverlayButton = composer.newButton({
    x = 340,
    y = 35,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeOverlayButtonEvent
  })
  
  local function tableCallback(mapId)
    composer.hideOverlay()
    if mapId then
      setGameModeFunction(0, mapId)
    end
  end
  
  mapTable = tableHelper.new(150, 36, 180, 284, 100, nil, "map", tableCallback)
  mapTable.createTable(composer.data.mapInfo, group)
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    group:insert(tableBackground)
    group:insert(mapTable.getTable())
    group:insert(tableTitleBakground)
    group:insert(infoText)
    group:insert(closeOverlayButton)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", closeOnTouchEvent)
    tableBackground:addEventListener("touch", doNothingOnTouchEvent)
  end
  
  function clean()
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    mapTable.cleanTable()
  end
  
  updateDisplayGroup()
  addListeners()
end

function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase
  if phase == "will" then
  elseif phase == "did" then
    local androidLogic = require("lua.modules.androidBackButton")
    
    function cleanEnter()
      androidLogic.isOverlay(false)
    end
    
    androidLogic.isOverlay(true)
  end
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase
  if phase == "will" then
    cleanEnter()
  elseif phase == "did" and event.parent and event.parent.overlayEnded then
    event.parent:overlayEnded(overlayEndedData)
    overlayEndedData = nil
  end
end

function scene:destroy(event)
  local sceneGroup = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
