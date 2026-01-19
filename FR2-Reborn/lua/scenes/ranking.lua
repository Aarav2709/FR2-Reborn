local composer = require("composer")
local scene = composer.newScene()
local clean, cleanEnter

function scene:create(event)
  local group = self.view
  local tableHelper = require("lua.modules.tableHelper")
  local trailHelper = require("lua.modules.trails")
  local monsterLoader = require("spine-corona.monsterLoader")
  local tcpFormat = require("lua.network.tcpMessageFormat")
  local selectedRowIndex, monsterShowing, rankingTable
  local tableActive = 0
  local textGroup = display.newGroup()
  local rankingList
  local mySelfDataTable = {}
  local itemTrailRef, itemTrailSelected, weelkyList, friendsList, globalList, setUpTable, tableCallback
  local startedClean = false
  local prizeInfo = {}
  local weeklyListName = "dino league"
  local globalListName = "global"
  local friendListName = "friends"
  
  local function copyList(listToCopy)
    local chanceList = {}
    local index = 1
    for i = 1, #listToCopy do
      chanceList[i] = listToCopy[i]
      if not chanceList[i].tier then
        chanceList[i].index = index
        index = index + 1
      end
    end
    return chanceList
  end
  
  local background = display.newImageRect("images/gui/ranking/main.png", 480, 320)
  background.anchorX = 0
  background.anchorY = 0
  background.x = 0
  background.y = 0
  local tableBackground = display.newImageRect("images/gui/ranking/cell.png", 480, 320)
  tableBackground.x = display.contentWidth * 0.5
  tableBackground.y = display.contentHeight * 0.5
  local selectedTableImage = display.newImageRect("images/gui/ranking/marker.png", 67, 44)
  selectedTableImage.x = 302
  selectedTableImage.y = 26
  local xDistance = 50
  local avatarName = composer.newText({
    string = "",
    size = 24,
    x = 122,
    y = 18,
    color = {
      1,
      1,
      1
    }
  })
  local games = composer.newText({
    string = composer.localized.get("Games"),
    size = 14,
    x = 40,
    y = 44,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local gamesNumber = composer.newText({
    string = "?",
    size = 14,
    x = games.x + xDistance,
    y = games.y,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local wins = composer.newText({
    string = composer.localized.get("Wins"),
    size = 14,
    x = 40,
    y = 56,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local winsNumber = composer.newText({
    string = "?",
    size = 14,
    x = wins.x + xDistance,
    y = wins.y,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local kills = composer.newText({
    string = composer.localized.get("Kills"),
    size = 14,
    x = 40,
    y = 68,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local killsNumber = composer.newText({
    string = "?",
    size = 14,
    x = kills.x + xDistance,
    y = kills.y,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local deaths = composer.newText({
    string = composer.localized.get("Deaths"),
    size = 14,
    x = 130,
    y = 44,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local deathsNumber = composer.newText({
    string = "?",
    size = 14,
    x = deaths.x + xDistance,
    y = deaths.y,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local suicides = composer.newText({
    string = composer.localized.get("Suicides"),
    size = 14,
    x = 130,
    y = 56,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local suicidesNumber = composer.newText({
    string = "?",
    size = 14,
    x = suicides.x + xDistance,
    y = suicides.y,
    ax = 0,
    color = {
      1,
      1,
      1
    }
  })
  local prizeButtonTextTime = composer.newText({
    string = "?d ?h ?m",
    size = 12,
    x = 306,
    y = 36
  })
  local selfName = composer.newText({
    string = "",
    size = 13,
    x = 300,
    y = 68,
    ax = 0
  })
  local selfRating = composer.newText({
    string = "",
    size = 13,
    x = 465,
    y = 68,
    ax = 1
  })
  
  local function updateMonsterStats(playerData)
    if playerData then
      if playerData.ae then
        gamesNumber.text = playerData.ae
      end
      if playerData.wr then
        winsNumber.text = math.round(playerData.wr * 100) .. "%"
      end
      if playerData.z then
        killsNumber.text = playerData.z
      end
      if playerData.aa then
        deathsNumber.text = playerData.aa
      end
      if playerData.ab then
        suicidesNumber.text = playerData.ab
      end
      if playerData.u then
        avatarName.text = playerData.u
      end
    end
  end
  
  local function cleanMonsters()
    if monsterShowing then
      monsterShowing.clean()
      monsterShowing = nil
    end
    if itemTrailRef then
      timer.cancel(itemTrailRef)
      itemTrailRef = nil
    end
  end
  
  local function createItemEffect()
    trailHelper.createTrail(itemTrailSelected, monsterShowing.getGroup().x - 5, monsterShowing.getGroup().y - 50, group)
    group:insert(monsterShowing.getGroup())
  end
  
  local function createMonsterModules(data, playerData)
    if data == nil then
      return
    end
    cleanMonsters()
    local monsterData = composer.monsterConverter.fromServerFormat(data)
    itemTrailSelected = monsterData[6]
    monsterShowing = monsterLoader.new(monsterData)
    local monsterGroup = monsterShowing.getGroup()
    monsterGroup.xScale = 0.5
    monsterGroup.yScale = 0.5
    monsterGroup.x = 140
    monsterGroup.y = 250
    if 0 < itemTrailSelected then
      itemTrailRef = timer.performWithDelay(200, createItemEffect, 0)
    end
    group:insert(monsterGroup)
  end
  
  local function updateSelfText(isSelected)
    if selfName == nil or selfRating == nil then
      print("WARNING: selfName is ", selfName)
      print("WARNING: selfRating is ", selfRating)
      return
    end
    if mySelfDataTable[tableActive] and selfRating.text ~= mySelfDataTable[tableActive].r then
      selfName.text = mySelfDataTable[tableActive].u
      selfRating.text = mySelfDataTable[tableActive].r
    end
    if isSelected then
      selfName:setFillColor(0.2, 0.432, 0.12)
    else
      selfName:setFillColor(0, 0, 0)
    end
  end
  
  local function getTimeLeftInText(timeLeft)
    if timeLeft then
      local minutes = math.floor(timeLeft / 60)
      local hours = math.floor(minutes / 60)
      local days = math.floor(hours / 24)
      minutes = minutes - hours * 60
      hours = hours - days * 24
      local text = days .. "d " .. hours .. "h " .. minutes .. "m"
      return text
    end
    return ""
  end
  
  local function btnBackRelease()
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene("lua.scenes.ranking")
  end
  
  local backButton = composer.newButton({
    image = "images/gui/common/buttonHome.png",
    width = 90,
    height = 57,
    onRelease = btnBackRelease,
    x = 50,
    y = 292
  })
  
  local function weeklyButtonRelease()
    if tableActive == 1 then
      return
    end
    tableActive = 1
    if weelkyList then
      setUpTable(nil, weelkyList)
    else
      composer.comm.getRankingListOnName(weeklyListName)
    end
  end
  
  local weeklyButton = composer.newButton({
    image = "images/transparent.png",
    width = 67,
    height = 44,
    onRelease = weeklyButtonRelease,
    x = 304,
    y = 26
  })
  
  local function friendsButtonRelease()
    if tableActive == 2 then
      return
    end
    tableActive = 2
    if friendsList then
      setUpTable(nil, friendsList)
    else
      composer.comm.getRankingListOnName(friendListName)
    end
  end
  
  local friendsButton = composer.newButton({
    image = "images/transparent.png",
    width = 67,
    height = 44,
    onRelease = friendsButtonRelease,
    x = 373,
    y = 26
  })
  
  local function globalButtonRelease()
    if tableActive == 3 then
      return
    end
    tableActive = 3
    if globalList then
      setUpTable(nil, globalList)
    else
      composer.comm.getRankingListOnName(globalListName)
    end
  end
  
  local globalButton = composer.newButton({
    image = "images/transparent.png",
    width = 67,
    height = 44,
    onRelease = globalButtonRelease,
    x = 443,
    y = 26
  })
  
  local function selfButtonRelease()
    if mySelfDataTable[tableActive] then
      tableCallback(nil, nil, mySelfDataTable[tableActive])
    end
  end
  
  local selfButton = composer.newButton({
    image = "images/transparent.png",
    width = 200,
    height = 22,
    onRelease = selfButtonRelease,
    x = 378,
    y = 70
  })
  
  local function prizeButtonEvent()
    local options = {
      isModal = true,
      params = {prize = prizeInfo}
    }
    composer.showOverlay("lua.overlays.weeklyPrizes", options)
  end
  
  local prizeButton = composer.newButton({
    image = "images/gui/ranking/prizes.png",
    width = 60,
    height = 56,
    onRelease = prizeButtonEvent,
    x = 238,
    y = 294
  })
  
  local function deselectAll()
    if rankingList then
      for i = 1, #rankingList do
        rankingList[i].isSelected = false
      end
    end
  end
  
  local function updateSelectedRow()
    if selectedRowIndex == nil then
      return
    end
    if rankingTable.getTable() == nil then
      return
    end
    local oldRow = rankingTable.getTable():getRowAtIndex(selectedRowIndex)
    if rankingList[selectedRowIndex] then
      rankingList[selectedRowIndex].isSelected = false
    end
    if oldRow and oldRow.setSelected then
      oldRow.setSelected(false)
    end
  end
  
  local function addWeeklyListCells()
    local firstTier = {}
    firstTier.tier = true
    firstTier.imagePath = "images/gui/ranking/tier1.png"
    table.insert(rankingList, 1, firstTier)
    if 3 < #rankingList then
      local secondTier = {}
      secondTier.tier = true
      secondTier.imagePath = "images/gui/ranking/tier2.png"
      table.insert(rankingList, 3, secondTier)
    end
    if 7 < #rankingList then
      local thirdTier = {}
      thirdTier.tier = true
      thirdTier.imagePath = "images/gui/ranking/tier3.png"
      table.insert(rankingList, 7, thirdTier)
    end
    if 14 < #rankingList then
      local forthTier = {}
      forthTier.tier = true
      forthTier.imagePath = "images/gui/ranking/tier4.png"
      table.insert(rankingList, 14, forthTier)
    end
    if 25 < #rankingList then
      local fifthTier = {}
      fifthTier.tier = true
      fifthTier.imagePath = "images/gui/ranking/tier5.png"
      table.insert(rankingList, 25, fifthTier)
    end
  end
  
  function tableCallback(playerData, index, selfData)
    updateSelectedRow()
    if selfData then
      updateMonsterStats(selfData)
      createMonsterModules(selfData.fa)
      updateSelfText(true)
    elseif index then
      selectedRowIndex = index
      rankingList[selectedRowIndex].isSelected = true
      updateMonsterStats(playerData)
      createMonsterModules(playerData.fa)
      updateSelfText(false)
    end
  end
  
  local function updateDisplayGroup()
    group:insert(background)
    textGroup:insert(avatarName)
    textGroup:insert(games)
    textGroup:insert(gamesNumber)
    textGroup:insert(kills)
    textGroup:insert(killsNumber)
    textGroup:insert(deaths)
    textGroup:insert(deathsNumber)
    textGroup:insert(wins)
    textGroup:insert(winsNumber)
    textGroup:insert(suicides)
    textGroup:insert(suicidesNumber)
    group:insert(textGroup)
    group:insert(weeklyButton)
    group:insert(globalButton)
    group:insert(friendsButton)
    group:insert(selectedTableImage)
    group:insert(selfButton)
    group:insert(selfRating)
    group:insert(selfName)
    group:insert(backButton)
    group:insert(prizeButton)
    group:insert(prizeButtonTextTime)
    if monsterShowing then
      group:insert(monsterShowing.getGroup())
    end
  end
  
  function setUpTable(newData, oldData)
    if rankingTable and rankingTable.cleanTable then
      rankingTable.cleanTable()
    end
    if newData then
      rankingList = newData.a.l
      if tableActive == 1 then
        addWeeklyListCells()
        weelkyList = copyList(rankingList)
      elseif tableActive == 2 then
        friendsList = copyList(rankingList)
      elseif tableActive == 3 then
        globalList = copyList(rankingList)
      end
      mySelfDataTable[tableActive] = newData.a.i
    elseif oldData then
      rankingList = oldData
    end
    if tableActive == 1 then
      selectedTableImage.x = 302
    elseif tableActive == 2 then
      selectedTableImage.x = 373
    elseif tableActive == 3 then
      selectedTableImage.x = 443
    end
    tableCallback(nil, nil, mySelfDataTable[tableActive])
    deselectAll()
    rankingTable.createTable(rankingList, group)
    group:insert(rankingTable.getTable())
    updateDisplayGroup()
  end
  
  local function tcpCallback(data)
    if startedClean then
      return
    end
    if data.m == tcpFormat.getRankingListOnName() then
      if data.a.n == weeklyListName then
        tableActive = 1
      elseif data.a.n == friendListName then
        tableActive = 2
      elseif data.a.n == globalListName then
        tableActive = 3
      end
      setUpTable(data)
      if data.t then
        prizeButtonTextTime.text = getTimeLeftInText(data.t)
      end
      if data.p then
        prizeInfo = data.p
      end
    end
  end
  
  function clean()
    startedClean = true
    if rankingList then
      for i = 1, #rankingList do
        rankingList[i].isSelected = false
      end
      rankingList = nil
    end
    display.remove(backButton)
    display.remove(prizeButton)
    display.remove(weeklyButton)
    display.remove(friendsButton)
    display.remove(globalButton)
    display.remove(selfButton)
    cleanMonsters()
    if rankingTable then
      rankingTable.cleanTable()
    end
  end
  
  group:insert(tableBackground)
  rankingTable = tableHelper.new(280, 86, 200, 234, 30, nil, "ranking", tableCallback)
  updateDisplayGroup()
  composer.comm.setCallback(tcpCallback)
  composer.comm.getRankingListOnName(weeklyListName)
end

function scene:show(event)
  local screenGroup = self.view
  local phase = event.phase
  if phase == "will" then
    return
  end
  local androidLogic = require("lua.modules.androidBackButton")
  
  function cleanEnter()
    androidLogic.removeBackButton()
  end
  
  androidLogic.addBackButton("lua.scenes.mainMenu", "lua.scenes.ranking")
end

function scene:hide(event)
  local phase = event.phase
  if phase == "did" then
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
