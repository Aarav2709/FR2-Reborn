local M = {}
local tcpClient = require("lua.network.tcpClient")
local composer = require("composer")
local joinGameTime = 0

function M.showGameInvite(data)
  local nameToShow = data.username
  if nameToShow == nil then
    print("WARNING: showGameInvite - nameToShow is nil")
    return
  end
  if composer.getSceneName("current") == "lua.scenes.lobbyCustomPlay" then
    if composer.gameHostData.serverAddress == data.a and composer.gameHostData.sessionId == data.s then
      composer.database.removeGameInvite(data.p)
      return
    end
  elseif composer.data.gameInfo.gameType == 3 and composer.gameHostData.serverAddress == data.a and composer.gameHostData.sessionId == data.s then
    composer.database.removeGameInvite(data.p)
    return
  end
  local group = display.newGroup()
  local groupRemoved = false
  local backgroundImage = display.newImageRect("images/gui/common/dropdown/bar.png", 310, 33)
  backgroundImage.anchorX = 0
  backgroundImage.anchorY = 0
  backgroundImage.x = 0
  backgroundImage.y = 0
  group:insert(backgroundImage)
  local icon = display.newImageRect("images/gui/common/dropdown/gameInvite.png", 24, 24)
  icon.x = backgroundImage.x + 40
  icon.y = backgroundImage.y + 10
  group:insert(icon)
  if 10 < string.len(nameToShow) then
    nameToShow = nameToShow:sub(1, 10) .. ".."
  end
  local textLabel = composer.newText({
    string = composer.localized.get("Join") .. nameToShow,
    size = 20,
    x = 90,
    y = 10,
    ax = 0
  })
  group:insert(textLabel)
  
  local function cleanGameInvite(obj)
    if not groupRemoved then
      groupRemoved = true
      obj:removeEventListener("tap", obj)
      obj:removeSelf()
      obj = nil
    end
  end
  
  local function joinGameDelayed()
    composer.gotoScene("lua.scenes.lobbyCustomPlay")
    composer.database.removeGameInvite(data.p)
    cleanGameInvite(group)
  end
  
  local function joinGame()
    if joinGameTime + 2000 > system.getTimer() then
      return
    end
    joinGameTime = system.getTimer()
    composer.data.gameInfo.gameType = 4
    cleanGameInvite(group)
    tcpClient.stopTCPClient()
    local currentScene = composer.getSceneName("current")
    composer.gameHostData.serverAddress = data.a
    composer.config.tcpClient = data.a
    composer.gameHostData.sessionId = data.s
    composer.gotoScene("lua.scenes.emptyScene")
    composer.removeScene(currentScene)
    timer.performWithDelay(200, joinGameDelayed, 1)
    if composer.onboarding.isActive == true then
      composer.onboarding.deactivate()
    end
    return true
  end
  
  group.x = 85
  group.y = -33
  group.tap = joinGame
  group:addEventListener("tap", group)
  composer.audio.play("dropdown")
  transition.to(group, {time = 200, y = 0})
  transition.to(group, {
    time = 200,
    delay = 4200,
    y = -33,
    onComplete = cleanGameInvite
  })
end

function M.showOnlineFriend(number)
  local group = display.newGroup()
  local groupRemoved = false
  local backgroundImage = display.newImageRect("images/gui/common/dropdown/bar.png", 310, 33)
  backgroundImage.anchorX = 0
  backgroundImage.anchorY = 0
  backgroundImage.x = 0
  backgroundImage.y = 0
  group:insert(backgroundImage)
  local icon = display.newImageRect("images/gui/common/dropdown/friends.png", 24, 24)
  icon.x = backgroundImage.x + 40
  icon.y = backgroundImage.y + 10
  group:insert(icon)
  local text
  if 1 < number then
    text = number .. composer.localized.get("FriendsOnline")
  else
    text = number .. composer.localized.get("FriendOnline")
  end
  local textLabel = composer.newText({
    string = text,
    size = 20,
    x = 90,
    y = 10,
    ax = 0
  })
  group:insert(textLabel)
  
  local function cleanOnlineFriends(obj)
    if not groupRemoved then
      groupRemoved = true
      obj:removeEventListener("tap", obj)
      obj:removeSelf()
      obj = nil
    end
  end
  
  local function seeOnlineFriends()
    local currentScene = composer.getSceneName("current")
    cleanOnlineFriends(group)
    if currentScene ~= "lua.scenes.loadingScene" then
      composer.gameHostData = {}
      composer.data.gameInfo.gameType = 3
      composer.gotoScene("lua.scenes.lobbyCustomPlay")
    else
      composer.goToLobbyCustomPlay = true
    end
    return true
  end
  
  group.x = 85
  group.y = -33
  group.tap = seeOnlineFriends
  group:addEventListener("tap", group)
  composer.audio.play("dropdown")
  transition.to(group, {time = 200, y = 0})
  transition.to(group, {
    time = 200,
    delay = 4200,
    y = -33,
    onComplete = cleanOnlineFriends
  })
end

function M.showFriendRequest(data, isGift)
  local group = display.newGroup()
  local groupRemoved = false
  local backgroundImage = display.newImageRect("images/gui/common/dropdown/bar.png", 310, 33)
  backgroundImage.anchorX = 0
  backgroundImage.anchorY = 0
  backgroundImage.x = 0
  backgroundImage.y = 0
  group:insert(backgroundImage)
  local icon
  if isGift then
    icon = display.newImageRect("images/gui/common/dropdown/mysterybox.png", 24, 24)
  else
    icon = display.newImageRect("images/gui/common/dropdown/friendReq.png", 24, 24)
  end
  icon.x = backgroundImage.x + 40
  icon.y = backgroundImage.y + 10
  group:insert(icon)
  local nameToShow = data.n
  if nameToShow == nil then
    nameToShow = ""
  end
  if 10 < string.len(nameToShow) then
    nameToShow = nameToShow:sub(1, 10) .. ".."
  end
  local textLabel = composer.newText({
    string = nameToShow,
    size = 20,
    x = 90,
    y = 10,
    ax = 0
  })
  group:insert(textLabel)
  
  local function cleanFriendRequest(obj)
    if not groupRemoved then
      groupRemoved = true
      obj:removeEventListener("tap", obj)
      obj:removeSelf()
      obj = nil
    end
  end
  
  local function tapRequest(event)
    composer.showOverlay("lua.overlays.messages", {isModal = true})
    cleanFriendRequest(group)
    return true
  end
  
  group.x = 85
  group.y = -33
  group.tap = tapRequest
  group:addEventListener("tap", group)
  composer.audio.play("dropdown")
  transition.to(group, {time = 200, y = 0})
  transition.to(group, {
    time = 200,
    delay = 4200,
    y = -33,
    onComplete = cleanFriendRequest
  })
end

function M.showAchivement(data)
  local group = display.newGroup()
  local groupRemoved = false
  local backgroundImage = display.newImageRect("images/gui/common/dropdown/barAchievement.png", 310, 33)
  backgroundImage.anchorX = 0
  backgroundImage.anchorY = 0
  backgroundImage.x = 0
  backgroundImage.y = 0
  group:insert(backgroundImage)
  data[2] = data[2] + 1
  local text = ""
  local iconPath
  if data[2] == 1 then
    text = composer.awards.getDailyChallengeName(data[3])
    composer.data.dailyToClaim = composer.data.dailyToClaim + 1
    local icon = composer.awards.getDailyChallengeImage(data[3])
    iconPath = "images/gui/challenges/iconsDaily/" .. icon .. ".png"
  elseif data[2] == 2 then
    text = composer.awards.getAchievementName(data[3], data[4])
    composer.data.achievementToClaim = composer.data.achievementToClaim + 1
    local icon = composer.awards.getAchievementImage(data[3])
    iconPath = "images/gui/challenges/iconsAchiv/" .. icon .. ".png"
  end
  local icon = display.newImageRect(iconPath, 55, 55)
  if icon == nil then
    icon = display.newImageRect("images/gui/challenges/iconsDaily/1.png", 55, 55)
  end
  icon.x = backgroundImage.x + 40
  icon.y = backgroundImage.y + 26
  group:insert(icon)
  local textLabel = composer.newText({
    string = text,
    size = 20,
    x = 180,
    y = 10,
    ax = 0.5
  })
  group:insert(textLabel)
  
  local function cleanAchivementsDropdwon(obj)
    if not groupRemoved then
      groupRemoved = true
      composer.showingDailyChallange = false
      obj:removeEventListener("tap", obj)
      obj:removeSelf()
      obj = nil
    end
  end
  
  local function tapRequest(event)
    composer.showOverlay("lua.overlays.achievementsScene", {isModal = true})
    cleanAchivementsDropdwon(group)
    return true
  end
  
  group.x = 85
  group.y = -33
  group.tap = tapRequest
  group:addEventListener("tap", group)
  composer.audio.play("dropdown_achievement")
  composer.showingDailyChallange = true
  transition.to(group, {time = 200, y = 0})
  transition.to(group, {
    time = 200,
    delay = 4200,
    y = -33,
    onComplete = cleanAchivementsDropdwon
  })
end

return M
