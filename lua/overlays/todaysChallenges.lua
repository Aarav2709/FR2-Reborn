local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local challangesTable, closeOverlayButton
  local dailyTable = {}
  local activeTableInt = 1
  local statedClean = false
  local dropdownGroup = display.newGroup()
  local claimingDaily = {}
  composer.overlayWithNetwork = true
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/mainMenu/windowDailyChallenges.png", 300, 291)
  tableBackground.anchorX = 0.5
  tableBackground.anchorY = 0
  tableBackground.x = 240
  tableBackground.y = 0
  local infoText = composer.newText({
    string = composer.localized.get("TodaysChallenges"),
    size = 20,
    x = display.contentWidth * 0.5,
    y = 22,
    color = {
      1,
      1,
      1
    }
  })
  
  local function sortTable(newTable)
    table.sort(newTable, function(a, b)
      local aStatus = 0
      local bStatus = 0
      if a.header then
        aStatus = 2
      end
      if b.header then
        bStatus = 2
      end
      if a.serverStatus then
        aStatus = a.serverStatus.p
        if a.serverStatus.c == 1 then
          aStatus = -1
        end
      end
      if b.serverStatus then
        bStatus = b.serverStatus.p
        if b.serverStatus.c == 1 then
          bStatus = -1
        end
      end
      return aStatus > bStatus
    end)
  end
  
  local function cleanTable()
    challangesTable.cleanTable()
  end
  
  local function setActiveTable()
    if statedClean then
      return
    end
    cleanTable()
    composer.playerInfo.awardsTable = 1
    sortTable(dailyTable)
    challangesTable.createTable(dailyTable, dropdownGroup)
    challangesTable.getTable():setIsLocked(true)
    infoText.text = composer.localized.get("TodaysChallenges")
    dropdownGroup:insert(closeOverlayButton)
  end
  
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
  
  closeOverlayButton = composer.newButton({
    x = 370,
    y = 34,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeOverlayButtonEvent
  })
  
  local function refreshTable()
    challangesTable.refreshTable()
    group:insert(closeOverlayButton)
  end
  
  local function tableCallback(clamied, progression, challengeId, stage, isSpinReward)
    if progression == 1 and clamied == 0 and isSpinReward then
      local options = {
        isModal = true,
        params = {tableActive = activeTableInt, challengeId = challengeId}
      }
      composer.showOverlay("lua.overlays.spinningWheel", options)
    end
  end
  
  challangesTable = tableHelper.new(124, 30, 250, 284, 70, nil, "challenge", tableCallback, 10)
  
  local function getTimeLeftInText(timeLeft)
    if timeLeft then
      local minutes = math.floor(timeLeft / 60)
      local hours = math.floor(minutes / 60)
      minutes = minutes - hours * 60
      if minutes < 10 then
        minutes = "0" .. minutes
      end
      local text = hours .. "h " .. minutes .. "m"
      return text
    end
    return "12h 14m"
  end
  
  local function createDailyChallengeTable(dailyChallenges, timeLeft)
    composer.data.dailyToClaim = 0
    dailyTable = {}
    dailyTable[1] = {}
    dailyTable[1].timeLeft = getTimeLeftInText(timeLeft)
    dailyTable[1].header = true
    for i, value in pairs(dailyChallenges) do
      local dailyChallenge = composer.awards.getDailyChallenge(tonumber(i))
      if dailyChallenge and not dailyChallenge.hidden then
        local index = #dailyTable + 1
        dailyTable[index] = dailyChallenge
        dailyTable[index].id = i
        dailyTable[index].serverStatus = value
        dailyTable[index].serverStatus.p = dailyTable[index].serverStatus.p / dailyChallenge.goal
        if dailyTable[index].serverStatus.p == 1 and dailyTable[index].serverStatus.c == 0 then
          composer.data.dailyToClaim = composer.data.dailyToClaim + 1
        end
      end
    end
  end
  
  local function tcpCallback(data)
    if statedClean then
      return
    end
    if data.m == tcpFormat.claimDailyChallenge() and data.i then
      for i, value in pairs(dailyTable) do
        if tonumber(data.i) == tonumber(value.id) then
          value.serverStatus = {c = 1, p = 1}
          claimingDaily[tonumber(data.i)] = 0
        end
      end
      composer.data.dailyToClaim = composer.data.dailyToClaim - 1
      if 0 > composer.data.dailyToClaim then
        composer.data.dailyToClaim = 0
      end
      composer.audio.play("collect_achievement")
      refreshTable()
      composer.analytics.newEvent("design", {
        event_id = "claim:daily:" .. tostring(data.i),
        value = tonumber(data.i),
        area = composer.config.fullVersion
      })
    end
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    dropdownGroup:insert(tableBackground)
    dropdownGroup:insert(infoText)
    dropdownGroup:insert(closeOverlayButton)
    group:insert(dropdownGroup)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", closeOnTouchEvent)
    tableBackground:addEventListener("touch", doNothingOnTouchEvent)
  end
  
  function clean()
    statedClean = true
    cleanTable()
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    composer.overlayWithNetwork = false
  end
  
  updateDisplayGroup()
  addListeners()
  createDailyChallengeTable(composer.todayChallenges.data, composer.todayChallenges.time)
  setActiveTable()
  composer.comm.setCallback(tcpCallback)
  composer.bouncer.down(dropdownGroup)
end

function scene:show(event)
  local phase = event.phase
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.isOverlay(false)
  end
  
  androidLogic.isOverlay(true)
  composer.todayChallenges.shouldShow = false
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
    if event.parent and event.parent.overlayEnded then
      event.parent:overlayEnded()
    end
    return
  end
  cleanEnter()
end

function scene:destroy(event)
  local group = self.view
  clean()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
