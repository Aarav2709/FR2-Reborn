local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local videoModule = require("lua.ads.videoModule")
  local challangesTable, achievementsTable, earnCoinTable, closeOverlayButton
  local dailyTable = {}
  local activeTableInt = 1
  local allAchivements, allEarnCoins, checkIfAdsShoudBeRemoved
  local statedClean = false
  local dailySorted = false
  local achSorted = false
  local earnCoinsSorted = false
  local money = composer.database.getMoney()
  local claimingDaily = {}
  local claimingAchivements = {}
  local claimingEarnCoins = {}
  composer.overlayWithNetwork = true
  if event.params and event.params.activeTable then
    activeTableInt = event.params.activeTable
  elseif composer.data.dailyToClaim > 0 then
    activeTableInt = 1
  elseif 0 < composer.data.achievementToClaim then
    activeTableInt = 2
  end
  local moneyText = composer.newText({
    string = "",
    size = 16,
    color = {
      1,
      1,
      1
    }
  })
  local alphaBackground = display.newRect(0, 0, display.contentWidth, display.contentHeight)
  alphaBackground.anchorX = 0
  alphaBackground.anchorY = 0
  alphaBackground:setFillColor(0, 0, 0, 0.5882352941176471)
  alphaBackground.x = 0
  alphaBackground.y = 0
  local tableBackground = display.newImageRect("images/gui/friends/mainWindow.png", 330, 320)
  tableBackground.anchorX = 0.5
  tableBackground.anchorY = 0
  tableBackground.x = 240
  tableBackground.y = 0
  local tablePaperBackground = display.newImageRect("images/gui/challenges/mainWindowPaperlist.png", 330, 320)
  tablePaperBackground.anchorX = 0.5
  tablePaperBackground.anchorY = 0
  tablePaperBackground.x = 240
  tablePaperBackground.y = 0
  local tableTitleBakground = display.newImageRect("images/gui/friends/header.png", 306, 38)
  tableTitleBakground.anchorX = 0.5
  tableTitleBakground.anchorY = 0
  tableTitleBakground.x = 240
  tableTitleBakground.y = 0
  local backgroundCoins = display.newImageRect("images/gui/market/currentCoins.png", 70, 53)
  backgroundCoins.anchorX = 0
  backgroundCoins.anchorY = 0
  backgroundCoins.x = 410
  backgroundCoins.y = 0
  local infoText = composer.newText({
    string = composer.localized.get("Friends"),
    size = 30,
    x = display.contentWidth * 0.5,
    y = 16,
    color = {
      1,
      1,
      1
    }
  })
  local dailyActive = display.newImageRect("images/gui/challenges/buttonDaily.png", 62, 62)
  dailyActive.anchorX = 0
  dailyActive.anchorY = 0
  dailyActive.x = 40
  dailyActive.y = 60
  local achievementsActive = display.newImageRect("images/gui/challenges/buttonAchievements.png", 62, 62)
  achievementsActive.anchorX = 0
  achievementsActive.anchorY = 0
  achievementsActive.x = 40
  achievementsActive.y = 125
  achievementsActive.isVisible = false
  local earnCoinActive = display.newImageRect("images/gui/challenges/buttonEarncoins.png", 62, 62)
  earnCoinActive.anchorX = 0
  earnCoinActive.anchorY = 0
  earnCoinActive.x = 40
  earnCoinActive.y = 190
  earnCoinActive.isVisible = false
  local infoTextServer = composer.newText({
    string = composer.localized.get("Loading"),
    size = 20,
    x = display.contentWidth * 0.5,
    y = 150
  })
  
  local function updateMoneyText(newMoney)
    moneyText.text = newMoney
    moneyText.anchorX = 0
    moneyText.anchorY = 0.5
    moneyText.x = 430
    moneyText.y = 40
  end
  
  local function refreshMoney()
    local newMoney = composer.database.getMoney()
    updateMoneyText(newMoney)
    if newMoney > money then
      money = newMoney
      transition.to(moneyText, {
        time = 100,
        xScale = 1.2,
        yScale = 1.2
      })
      transition.to(moneyText, {
        time = 100,
        delay = 200,
        xScale = 1,
        yScale = 1
      })
    end
  end
  
  local showDailyCount = 0
  
  local function showDaily()
    dailyActive.isVisible = true
    achievementsActive.isVisible = false
    earnCoinActive.isVisible = false
    if 1 < showDailyCount then
      composer.analytics.newEvent("design", {
        event_id = "tab:daily",
        area = composer.config.fullVersion
      })
    end
    infoText.text = composer.localized.get("DailyChallenges")
    showDailyCount = showDailyCount + 1
  end
  
  local function showAchievements()
    achievementsActive.isVisible = true
    dailyActive.isVisible = false
    earnCoinActive.isVisible = false
    composer.analytics.newEvent("design", {
      event_id = "tab:achievements",
      area = composer.config.fullVersion
    })
    infoText.text = composer.localized.get("Achievements")
  end
  
  local function showEarnCoins()
    earnCoinActive.isVisible = true
    achievementsActive.isVisible = false
    dailyActive.isVisible = false
    composer.analytics.newEvent("design", {
      event_id = "tab:earnCoins",
      area = composer.config.fullVersion
    })
    infoText.text = composer.localized.get("EarnCoins")
  end
  
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
    if activeTableInt == 1 then
      challangesTable.cleanTable()
    elseif activeTableInt == 2 then
      achievementsTable.cleanTable()
    elseif activeTableInt == 3 then
      earnCoinTable.cleanTable()
    end
  end
  
  local function setActiveTable(newTable, overrideSortTable)
    if statedClean then
      return
    end
    cleanTable(activeTableInt)
    activeTableInt = newTable
    composer.playerInfo.awardsTable = activeTableInt
    if infoTextServer.isVisible then
      return
    end
    if newTable == 1 then
      if overrideSortTable or not dailySorted then
        dailySorted = true
        sortTable(dailyTable)
      end
      challangesTable.createTable(dailyTable, group)
      challangesTable.getTable():setIsLocked(true)
      showDaily()
    elseif newTable == 2 then
      if overrideSortTable or not achSorted then
        achSorted = true
        sortTable(allAchivements)
      end
      achievementsTable.createTable(allAchivements, group)
      showAchievements()
    elseif newTable == 3 then
      if overrideSortTable or not earnCoinsSorted then
        earnCoinsSorted = true
        sortTable(allEarnCoins)
      end
      checkIfAdsShoudBeRemoved()
      earnCoinTable.createTable(allEarnCoins, group)
      showEarnCoins()
    end
    group:insert(closeOverlayButton)
  end
  
  function checkIfAdsShoudBeRemoved(needToRefresh)
    if statedClean then
      return
    end
    for i = 1, #allEarnCoins do
      if allEarnCoins[i].video and videoModule.isVideoReady() == false then
        table.remove(allEarnCoins, i)
        if needToRefresh and activeTableInt == 3 then
          setActiveTable(3, true)
        end
        return
      end
    end
  end
  
  local function showDailyButtonEvent()
    setActiveTable(1)
  end
  
  local showDailyButton = composer.newButton({
    x = dailyActive.x + 31,
    y = dailyActive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/challenges/buttonDailyInactive.png",
    onRelease = showDailyButtonEvent,
    noFill = true
  })
  
  local function showAchievementsButtonEvent()
    setActiveTable(2)
  end
  
  local showAchievementsButton = composer.newButton({
    x = achievementsActive.x + 31,
    y = achievementsActive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/challenges/buttonAchievementsInactive.png",
    onRelease = showAchievementsButtonEvent,
    noFill = true
  })
  
  local function showEarnCoinsButtonEvent()
    setActiveTable(3)
  end
  
  local showEarnCoinsButton = composer.newButton({
    x = earnCoinActive.x + 31,
    y = earnCoinActive.y + 31,
    width = 62,
    height = 62,
    image = "images/gui/challenges/buttonEarncoinsInactive.png",
    onRelease = showEarnCoinsButtonEvent,
    noFill = true
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
  
  closeOverlayButton = composer.newButton({
    x = 370,
    y = 34,
    width = 43,
    height = 38,
    image = "images/gui/common/buttonClosePopup.png",
    onRelease = closeOverlayButtonEvent
  })
  
  local function refreshTable()
    if activeTableInt == 1 then
      challangesTable.refreshTable()
    elseif activeTableInt == 2 then
      achievementsTable.refreshTable()
    elseif activeTableInt == 3 then
      earnCoinTable.refreshTable()
    end
    group:insert(closeOverlayButton)
  end
  
  local function addBoostItems()
    local boostItems = {}
    local boughtItems = composer.database.getItems()
    composer.storeConfig.addBoostItem(boostItems)
    for i = 1, #boostItems do
      if boostItems[i].mysteryBox then
      else
        local newId = #allEarnCoins + 1
        boostItems[i].goal = 1
        boostItems[i].image = "1"
        boostItems[i].id = newId
        boostItems[i].boost = true
        boostItems[i].text = composer.localized.get("Forever")
        if boughtItems[tostring(boostItems[i].key)] then
          boostItems[i].serverStatus = {p = 1, c = 1}
          boostItems[i].owned = true
        end
        allEarnCoins[newId] = boostItems[i]
      end
    end
  end
  
  local function tableCallback(clamied, progression, challengeId, stage, challenge, isSpinReward, link)
    if progression == 1 and clamied == 0 then
      if challenge.spinReward then
        local options = {
          isModal = true,
          params = {tableActive = activeTableInt, challengeId = challengeId}
        }
        composer.showOverlay("lua.overlays.spinningWheel", options)
      elseif activeTableInt == 1 then
        if tonumber(challengeId) == 1 then
        elseif claimingDaily[tonumber(challengeId)] and claimingDaily[tonumber(challengeId)] == 1 then
          print("WARNING: already tried to claim ", challengeId)
        else
          claimingDaily[tonumber(challengeId)] = 1
          composer.comm.claimDailyChallenge(challengeId)
        end
      elseif activeTableInt == 2 then
        if claimingAchivements[tonumber(challengeId)] and claimingAchivements[tonumber(challengeId)] == 1 then
          print("WARNING: already tried to claim ", challengeId)
        else
          claimingAchivements[tonumber(challengeId)] = 1
          composer.comm.claimAchievement(challengeId)
        end
      elseif activeTableInt == 3 then
        if claimingEarnCoins[tonumber(challengeId)] and claimingEarnCoins[tonumber(challengeId)] == 1 then
          print("WARNING: already tried to claim ", challengeId)
        elseif tonumber(challengeId) == 1 then
          videoModule.showAd()
          timer.performWithDelay(700, checkIfAdsShoudBeRemoved, 1)
        elseif challenge.boost then
          if not challenge.owned then
            local options = {
              isModal = true,
              params = {item = challenge}
            }
            composer.showOverlay("lua.overlays.marketBuy", options)
          end
          print("challenge ", challenge.key)
        elseif challenge.link then
          composer.data.openURL = true
          claimingEarnCoins[tonumber(challengeId)] = 1
          composer.comm.claimEarnCoins(challengeId)
          system.openURL(challenge.link)
        end
      else
        print("invalid table", activeTableInt)
      end
    end
  end
  
  challangesTable = tableHelper.new(124, 36, 250, 284, 70, nil, "challenge", tableCallback, 10)
  achievementsTable = tableHelper.new(124, 36, 250, 284, 70, nil, "challenge", tableCallback, 10)
  earnCoinTable = tableHelper.new(124, 36, 250, 284, 70, nil, "challenge", tableCallback, 10)
  
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
    if data.m == tcpFormat.getEarnCoins() then
      infoTextServer.isVisible = false
      local earnCoinsProgression = {}
      for i = 1, #data.a do
        for id, earnCoin in pairs(allEarnCoins) do
          if tonumber(earnCoin.id) == tonumber(data.a[i]) then
            allEarnCoins[id].serverStatus = {p = 1, c = 1}
          end
        end
      end
      addBoostItems()
      checkIfAdsShoudBeRemoved()
      if activeTableInt == 3 then
        setActiveTable(3, true)
      end
    elseif data.m == tcpFormat.claimEarnCoins() then
      if data.i then
        for i, value in pairs(allEarnCoins) do
          if tonumber(data.i) == tonumber(value.id) then
            value.serverStatus = {c = 1, p = 1}
            claimingEarnCoins[tonumber(data.i)] = 0
          end
        end
        composer.audio.play("collect_achievement")
        refreshTable()
        refreshMoney()
        composer.analytics.newEvent("design", {
          event_id = "claim:earnCoins:" .. tostring(data.i),
          value = tonumber(data.i),
          area = composer.config.fullVersion
        })
      end
    elseif data.m == tcpFormat.getAchievementList() then
      infoTextServer.isVisible = false
      local achievementsProgression = {}
      composer.data.achievementToClaim = 0
      for i, value in pairs(data.a) do
        for id, achivements in pairs(allAchivements) do
          if tonumber(achivements.id) == tonumber(i) then
            allAchivements[id].serverStatus = value
            if allAchivements[id].serverStatus.p == 1 and allAchivements[id].serverStatus.c == 0 then
              composer.data.achievementToClaim = composer.data.achievementToClaim + 1
            end
          end
        end
      end
      if activeTableInt == 2 then
        setActiveTable(2, true)
      end
    elseif data.m == tcpFormat.claimAchievement() then
      if data.i and data.a then
        for i, value in pairs(allAchivements) do
          if tonumber(data.i) == tonumber(value.id) then
            value.serverStatus = data.a
            claimingAchivements[tonumber(data.i)] = 0
          end
        end
        composer.data.achievementToClaim = composer.data.achievementToClaim - 1
        if 0 > composer.data.achievementToClaim then
          composer.data.achievementToClaim = 0
        end
        composer.audio.play("collect_achievement")
        refreshTable()
        refreshMoney()
        composer.analytics.newEvent("design", {
          event_id = "claim:achievment:" .. tostring(data.i),
          value = tonumber(data.i),
          area = composer.config.fullVersion
        })
      end
    elseif data.m == tcpFormat.claimDailyChallenge() then
      if data.i then
        infoTextServer.isVisible = false
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
        refreshMoney()
        composer.analytics.newEvent("design", {
          event_id = "claim:daily:" .. tostring(data.i),
          value = tonumber(data.i),
          area = composer.config.fullVersion
        })
      end
    elseif data.m == tcpFormat.getDailyChallenge() then
      infoTextServer.isVisible = false
      createDailyChallengeTable(data.a, data.t)
      if activeTableInt == 1 then
        setActiveTable(1, true)
      end
    elseif data.m == tcpFormat.seenVideo() then
      refreshMoney()
    end
  end
  
  local function updateDisplayGroup()
    group:insert(alphaBackground)
    group:insert(tableBackground)
    group:insert(tablePaperBackground)
    group:insert(showDailyButton)
    group:insert(showAchievementsButton)
    group:insert(showEarnCoinsButton)
    group:insert(dailyActive)
    group:insert(achievementsActive)
    group:insert(earnCoinActive)
    group:insert(tableTitleBakground)
    group:insert(infoText)
    group:insert(closeOverlayButton)
    group:insert(infoTextServer)
    group:insert(backgroundCoins)
    group:insert(moneyText)
  end
  
  local function addListeners()
    alphaBackground:addEventListener("touch", closeOnTouchEvent)
    tableBackground:addEventListener("touch", doNothingOnTouchEvent)
  end
  
  function clean()
    statedClean = true
    cleanTable(activeTableInt)
    display.remove(showDailyButton)
    display.remove(showAchievementsButton)
    display.remove(showEarnCoinsButton)
    alphaBackground:removeEventListener("touch", closeOnTouchEvent)
    tableBackground:removeEventListener("touch", doNothingOnTouchEvent)
    composer.overlayWithNetwork = false
  end
  
  allAchivements = composer.awards.getAchievements()
  allEarnCoins = composer.awards.getEarnCoins()
  updateDisplayGroup()
  addListeners()
  updateMoneyText(money)
  if activeTableInt == 1 then
    showDaily()
  elseif activeTableInt == 2 then
    showAchievements()
  elseif activeTableInt == 3 then
    showEarnCoins()
  end
  composer.comm.setCallback(tcpCallback)
  composer.comm.getAchievementList()
  composer.comm.getDailyChallenge()
  composer.comm.getEarnCoins()
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
