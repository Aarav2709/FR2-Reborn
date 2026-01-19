require("sqlite3")
local crypto = require("crypto")
local composer = require("composer")
local json = require("json")
local base64 = require("lua.iap.base64")
composer.databaseData = {
  friends = {},
  friendRequests = {},
  items = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
    [5] = {},
    [6] = {},
    [7] = {}
  },
  money = nil
}
local path = system.pathForFile("data.sqlite3", system.DocumentsDirectory)
local db
local M = {}

local function setupTables()
  db = sqlite3.open(path)
  local createTables = [[
CREATE TABLE IF NOT EXISTS user_settings (id INTEGER PRIMARY KEY, username VARCHAR(15), usernameCode INTEGER);
                            CREATE TABLE IF NOT EXISTS playerIdToken (id INTEGER PRIMARY KEY, playerId VARCHAR(64), token VARCHAR(64));
                                                        CREATE TABLE IF NOT EXISTS user_avatar (id INTEGER PRIMARY KEY, avatar INTEGER, skin INTEGER, hat INTEGER, face INTEGER, neck INTEGER, item INTEGER, boots INTEGER);
                            CREATE TABLE IF NOT EXISTS receipts (id INTEGER PRIMARY KEY, encodedTransaction TEXT, hash VARCHAR(32) UNIQUE, storeType INTEGER);
                                                        CREATE TABLE IF NOT EXISTS iap_confirm (id INTEGER PRIMARY KEY, value INTEGER);
                                                        CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, sound INTEGER);
                                                        CREATE TABLE IF NOT EXISTS deviceSync (id INTEGER PRIMARY KEY, value INTEGER);
                            CREATE TABLE IF NOT EXISTS marketItemId (id INTEGER PRIMARY KEY, value INTEGER);
                                                        CREATE TABLE IF NOT EXISTS facebook (id INTEGER PRIMARY KEY, facebookId INTEGER);
                                                        CREATE TABLE IF NOT EXISTS adTime (id INTEGER PRIMARY KEY, value INTEGER);
                            CREATE TABLE IF NOT EXISTS marketNotification (id INTEGER PRIMARY KEY, version INTEGER, number INTEGER);
                            CREATE TABLE IF NOT EXISTS push_enabled (id INTEGER PRIMARY KEY, gameInvite INTEGER, friendRequest INTEGER, general INTEGER);    
                            CREATE TABLE IF NOT EXISTS onboarding (part INTEGER PRIMARY KEY, done INTEGER default 0);
                            CREATE TABLE IF NOT EXISTS onboardingIntro (id INTEGER PRIMARY KEY, done INTEGER default 0);                   
    ]]
  db:exec(createTables)
  db:close()
  db = nil
end

function M.updatePlayerInfo(username, usernameCode)
  local currentPlayerInfo = M.getPlayerInformation()
  M.setPlayerInformation(username, usernameCode, currentPlayerInfo.playerId, currentPlayerInfo.token)
end

local function setPlayerInformation(username, usernameCode, playerId, token)
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO user_settings VALUES(1, \"" .. username .. "\", " .. usernameCode .. ");")
  if token and playerId then
    db:exec("INSERT OR REPLACE INTO playerIdToken VALUES(1, \"" .. playerId .. "\", \"" .. token .. "\");")
  end
  db:close()
  db = nil
end

M.setPlayerInformation = setPlayerInformation

local function setPlayerIdAndToken(playerId, token)
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO playerIdToken VALUES(1, \"" .. playerId .. "\", \"" .. token .. "\");")
  db:close()
  db = nil
end

M.setPlayerIdAndToken = setPlayerIdAndToken

local function getPlayerInformation()
  db = sqlite3.open(path)
  local playerInformation = {}
  for row in db:nrows("SELECT username, usernameCode FROM user_settings;") do
    playerInformation.usernameCode = row.usernameCode
    playerInformation.username = row.username
  end
  for row in db:nrows("SELECT playerId, token FROM playerIdToken;") do
    playerInformation.playerId = row.playerId
    playerInformation.token = row.token
  end
  db:close()
  db = nil
  if not playerInformation.token then
    print("WARNING: NO TOKEN")
    return nil
  end
  return playerInformation
end

M.getPlayerInformation = getPlayerInformation

local function setAvatarData(avatarData, networkFormat)
  if networkFormat then
    avatarData = composer.monsterConverter.fromServerFormat(avatarData)
  end
  composer.debugger.debugTable("database", "setMonsterData :", avatarData)
  local tablefill
  if avatarData == nil or avatarData == "null" then
    tablefill = "INSERT OR REPLACE INTO user_avatar VALUES(1,101,0,0,0,0,0,0);"
  else
    tablefill = "INSERT OR REPLACE INTO user_avatar VALUES(1," .. avatarData[1] .. ", " .. avatarData[2] .. ", " .. avatarData[3] .. ", " .. avatarData[4] .. ", " .. avatarData[5] .. ", " .. avatarData[6] .. ", " .. avatarData[7] .. ");"
  end
  db = sqlite3.open(path)
  db:exec(tablefill)
  db:close()
  db = nil
  composer.databaseData.avatarData = avatarData
end

M.setAvatarData = setAvatarData

local function getAvatarData()
  if composer.databaseData.avatarData then
    return composer.databaseData.avatarData
  else
    db = sqlite3.open(path)
    local avatarData = {}
    for row in db:nrows("SELECT avatar, skin, hat, face, neck, item, boots FROM user_avatar;") do
      avatarData = {
        row.avatar,
        row.skin,
        row.hat,
        row.face,
        row.neck,
        row.item,
        row.boots
      }
    end
    db:close()
    db = nil
    composer.databaseData.avatarData = avatarData
    return avatarData
  end
end

M.getAvatarData = getAvatarData

local function getNumberOfGameInvites()
  if composer.databaseData.gameInvites then
    return #composer.databaseData.gameInvites
  end
  return 0
end

M.getNumberOfGameInvites = getNumberOfGameInvites

local function removeOldGameInvites()
  if composer.databaseData.gameInvites then
    for i = 1, #composer.databaseData.gameInvites do
      if os.time() > composer.databaseData.gameInvites[i].addTime + 100 then
        table.remove(composer.databaseData.gameInvites, i)
        removeOldGameInvites()
        return
      end
    end
  end
end

function M.addNewGameInvite(invite)
  if not composer.databaseData.gameInvites then
    composer.databaseData.gameInvites = {}
  end
  for i = 1, #composer.databaseData.gameInvites do
    if composer.databaseData.gameInvites[i].p == invite.p then
      composer.databaseData.gameInvites[i] = invite
      composer.databaseData.gameInvites[i].addTime = os.time()
      return
    end
  end
  composer.databaseData.gameInvites[#composer.databaseData.gameInvites + 1] = invite
  composer.databaseData.gameInvites[#composer.databaseData.gameInvites].addTime = os.time()
  removeOldGameInvites()
end

function M.removeGameInvite(playerId)
  if composer.databaseData.gameInvites then
    local indexToRemove
    for i = 1, #composer.databaseData.gameInvites do
      if playerId == composer.databaseData.gameInvites[i].p then
        indexToRemove = i
      end
    end
    if indexToRemove then
      table.remove(composer.databaseData.gameInvites, indexToRemove)
    end
  end
end

function M.getGameInvites()
  removeOldGameInvites()
  if composer.databaseData.gameInvites then
    return composer.databaseData.gameInvites
  else
    return {}
  end
end

function M.addNewMysteryBox(data)
  if composer.databaseData.addNewMysteryBoxs then
    composer.databaseData.addNewMysteryBoxs[#composer.databaseData.addNewMysteryBoxs + 1] = data
  else
    composer.databaseData.addNewMysteryBoxs = {}
    composer.databaseData.addNewMysteryBoxs[1] = data
  end
end

function M.removeMysteryBox(data)
  if composer.databaseData.addNewMysteryBoxs then
    for i = 1, #composer.databaseData.addNewMysteryBoxs do
      if composer.databaseData.addNewMysteryBoxs[i].i == data then
        table.remove(composer.databaseData.addNewMysteryBoxs, i)
        return
      end
    end
  end
end

function M.setMysteryBoxes(listOfData)
  composer.databaseData.addNewMysteryBoxs = {}
  if listOfData then
    for i = 1, #listOfData do
      composer.databaseData.addNewMysteryBoxs[i] = listOfData[i]
    end
  end
end

function M.getMysteryBoxes()
  if composer.databaseData.addNewMysteryBoxs then
    return composer.databaseData.addNewMysteryBoxs
  end
  return {}
end

local function checkForFriendsWithSameName()
  local sameNameId = {}
  for i = 1, #composer.databaseData.friends do
    composer.databaseData.friends[i].n2 = nil
    for j = i + 1, #composer.databaseData.friends do
      if composer.databaseData.friends[i].n == composer.databaseData.friends[j].n then
        sameNameId[#sameNameId + 1] = i
        sameNameId[#sameNameId + 1] = j
      end
    end
  end
  for i = 1, #sameNameId do
    composer.databaseData.friends[sameNameId[i]].n2 = composer.databaseData.friends[sameNameId[i]].n .. "#" .. composer.databaseData.friends[sameNameId[i]].t
  end
end

local function removeDuplicateFriendRequests()
  for i = 1, #composer.databaseData.friends do
    if M.removeFriendRequest(composer.databaseData.friends[i].p) then
      composer.comm.deleteFriendRequest(composer.databaseData.friends[i].p)
    end
  end
end

function M.addNewFriend(friend)
  if composer.databaseData.friends then
    for i = 1, #composer.databaseData.friends do
      if composer.databaseData.friends[i].p == friend.p then
        M.removeFriendRequest(friend.p)
        return
      end
    end
    composer.databaseData.friends[#composer.databaseData.friends + 1] = friend
  else
    composer.databaseData.friends = {}
    composer.databaseData.friends[#composer.databaseData.friends + 1] = friend
  end
  checkForFriendsWithSameName()
  M.removeFriendRequest(friend.p)
end

function M.setFriends(friends)
  composer.databaseData.friends = friends
  checkForFriendsWithSameName()
end

function M.removeFriend(playerId)
  if composer.databaseData.friends then
    local indexToRemove
    for i = 1, #composer.databaseData.friends do
      if playerId == composer.databaseData.friends[i].p then
        indexToRemove = i
      end
    end
    if indexToRemove then
      table.remove(composer.databaseData.friends, indexToRemove)
    end
  end
  checkForFriendsWithSameName()
end

local function getFriends()
  if composer.databaseData.friends then
    removeDuplicateFriendRequests()
    composer.debugger.debugTable("database", "getFriends :", composer.databaseData.friends)
    return composer.databaseData.friends
  else
    return {}
  end
end

M.getFriends = getFriends

local function getFriend(playerId)
  if composer.databaseData.friends then
    for i = 1, #composer.databaseData.friends do
      if playerId == composer.databaseData.friends[i].p then
        return composer.databaseData.friends[i]
      end
    end
  end
  return {}
end

M.getFriend = getFriend

local function addFriendRequest(username, playerId)
  playerId = tonumber(playerId)
  composer.databaseData.friendRequests[playerId] = username
end

M.addFriendRequest = addFriendRequest

local function getNumberOfFriendRequests()
  local i = 0
  for k, v in pairs(composer.databaseData.friendRequests) do
    i = i + 1
  end
  return i
end

M.getNumberOfFriendRequests = getNumberOfFriendRequests

function M.setFriendRequests(friendRequests)
  composer.databaseData.friendRequests = friendRequests
end

function M.getFriendRequests()
  if composer.databaseData.friendRequests then
    return composer.databaseData.friendRequests
  else
    return {}
  end
end

function M.removeFriendRequest(playerId)
  if composer.databaseData.friendRequests then
    for i = 1, #composer.databaseData.friendRequests do
      if playerId == composer.databaseData.friendRequests[i].p then
        return table.remove(composer.databaseData.friendRequests, i)
      end
    end
  end
  return nil
end

function M.addNewFriendRequest(friend)
  if composer.databaseData.friendRequests then
    for i = 1, #composer.databaseData.friendRequests do
      if friend.p == composer.databaseData.friendRequests[i].p then
        return false
      end
    end
    composer.databaseData.friendRequests[#composer.databaseData.friendRequests + 1] = friend
  else
    composer.databaseData.friendRequests = {}
    composer.databaseData.friendRequests[#composer.databaseData.friendRequests + 1] = friend
  end
  return true
end

function M.changeOnlineState(friendId, state)
  for i = 1, #composer.databaseData.friends do
    if friendId == composer.databaseData.friends[i].p then
      composer.databaseData.friends[i].state = state
    end
  end
end

function M.setAllOnlineFriendsState(friends)
  local foundFriend = false
  if composer.databaseData and composer.databaseData.friends then
    for i = 1, #friends do
      for j = 1, #composer.databaseData.friends do
        if friends[i].p == composer.databaseData.friends[j].p then
          composer.databaseData.friends[j].state = friends[i].s
          foundFriend = true
        end
      end
    end
  end
  if not foundFriend and 0 < #friends and friends[1].delay == nil then
    local function closure()
      if friends and friends[1] then
        friends[1].delay = true
        
        M.setAllOnlineFriendsState(friends)
      end
    end
    
    timer.performWithDelay(2000, closure, 1)
  end
end

local function setItems(items)
  composer.databaseData.items = items
  local avatarData = getAvatarData()
  M.setNewDefaultSkinForAvatar(avatarData.avatar, avatarData.skin)
end

M.setItems = setItems

function M.setNewDefaultSkinForAvatar(avatarId, skinId)
  if composer.databaseData.items then
    for key, item in pairs(composer.databaseData.items) do
      if tonumber(key) == tonumber(avatarId) then
        item.s = skinId
      end
    end
  end
end

function M.getDefaultSkinForAvatar(avatarId)
  if composer.databaseData.items then
    for key, item in pairs(composer.databaseData.items) do
      if tonumber(key) == tonumber(avatarId) and item.s then
        return item.s
      end
    end
  end
  return 0
end

function M.getWinsForAvatar(avatarId)
  if composer.databaseData.items then
    for key, item in pairs(composer.databaseData.items) do
      if tonumber(key) == tonumber(avatarId) and item.w then
        return item.w
      end
    end
  end
  return 0
end

function M.updateWinsForAvatar()
  local avatarData = getAvatarData()
  composer.debugger.debugTable("database", "getAvatarData :", avatarData)
  local avatarId = avatarData[1]
  if composer.databaseData.items then
    for key, item in pairs(composer.databaseData.items) do
      if tonumber(key) == tonumber(avatarId) and item.w then
        item.w = item.w + 1
      end
    end
  end
end

local function getItems()
  return composer.databaseData.items
end

M.getItems = getItems

local function addItem(itemId)
  local itemString = "" .. itemId
  if composer.databaseData.items then
    composer.databaseData.items[itemString] = {}
  end
end

M.addItem = addItem

local function increaseMoney(money)
  composer.databaseData.money = composer.databaseData.money + money
end

M.increaseMoney = increaseMoney

local function decreaseMoney(money)
  composer.databaseData.money = composer.databaseData.money - money
end

M.decreaseMoney = decreaseMoney

local function setMoney(money)
  composer.databaseData.money = money
end

M.setMoney = setMoney

local function getMoney()
  if composer.databaseData.money then
    return composer.databaseData.money
  else
    return 0
  end
end

M.getMoney = getMoney

function M.encodeTransaction(transaction)
  local transactionJsonObject = json.encode(transaction)
  local transactionBase64 = base64.encode(transactionJsonObject)
  local receiptHash = crypto.digest(crypto.md5, transaction.receipt)
  return transactionBase64, receiptHash
end

function M.addReceipt(transaction, storeType)
  local db = sqlite3.open(path)
  local transactionBase64, receiptHash = M.encodeTransaction(transaction)
  db:exec("INSERT INTO receipts(encodedTransaction, hash, storeType) VALUES(\"" .. transactionBase64 .. "\", \"" .. receiptHash .. "\", " .. storeType .. ");")
  db:close()
  db = nil
end

function M.removeReceipt(receipt)
  local db = sqlite3.open(path)
  local receiptHash = crypto.digest(crypto.md5, receipt)
  local tablefill = "DELETE FROM receipts WHERE hash = \"" .. receiptHash .. "\";"
  db:exec(tablefill)
  db:close()
  db = nil
end

function M.getReceipts()
  local db = sqlite3.open(path)
  local transactions = {}
  for row in db:nrows("SELECT encodedTransaction, hash, storeType FROM receipts;") do
    if row.storeType and row.encodedTransaction then
      local transactionBase64 = base64.decode(row.encodedTransaction)
      local transactionTable = json.decode(transactionBase64)
      transactions[#transactions + 1] = {
        transactionData = transactionTable,
        storeType = row.storeType
      }
    end
  end
  db:close()
  db = nil
  return transactions
end

local function addIAPSocialServerConfirm()
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO iap_confirm VALUES(1, 1);")
  db:close()
  db = nil
end

M.addIAPSocialServerConfirm = addIAPSocialServerConfirm

local function hasIAPSocialServerConfirm()
  db = sqlite3.open(path)
  local receipts = {}
  local hasIAP = false
  for row in db:nrows("SELECT value FROM iap_confirm;") do
    if row.value == 1 then
      hasIAP = true
    end
  end
  db:close()
  db = nil
  return hasIAP
end

M.hasIAPSocialServerConfirm = hasIAPSocialServerConfirm

local function removeIAPSocialServerConfirm()
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO iap_confirm VALUES(1, 0);")
  db:close()
  db = nil
end

M.removeIAPSocialServerConfirm = removeIAPSocialServerConfirm

local function setSound(state)
  if state == 1 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO settings VALUES(1, 1);")
    db:close()
    db = nil
    composer.soundState = 1
  elseif state == 0 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO settings VALUES(1, 0);")
    db:close()
    db = nil
    composer.soundState = 0
  end
end

M.setSound = setSound

local function getSound()
  if composer.soundState then
    return composer.soundState
  else
    db = sqlite3.open(path)
    local state = 1
    for row in db:nrows("SELECT id, sound FROM settings;") do
      if row.id == 1 then
        state = row.sound
      end
    end
    if state == nil then
      state = 1
    end
    db:close()
    db = nil
    composer.soundState = state
    return state
  end
end

M.getSound = getSound

local function setViolence(state)
  if state == 1 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO settings VALUES(2, 1);")
    db:close()
    db = nil
    composer.violenceState = 1
  elseif state == 0 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO settings VALUES(2, 0);")
    db:close()
    db = nil
    composer.violenceState = 0
  end
end

M.setViolence = setViolence

local function getViolence()
  if composer.violenceState then
    return composer.violenceState
  else
    db = sqlite3.open(path)
    local state = 1
    local foundViolenceInDB = false
    for row in db:nrows("SELECT id, sound FROM settings;") do
      if row.id == 2 then
        state = row.sound
        foundViolenceInDB = true
      end
    end
    db:close()
    db = nil
    if not foundViolenceInDB then
      setViolence(1)
    end
    composer.violenceState = state
    return state
  end
end

M.getViolence = getViolence

function M.setMarketItemId(newId)
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO marketItemId VALUES(1, " .. newId .. ");")
  db:close()
  db = nil
  composer.databaseData.marketItemId = newId
end

function M.getMarketItemId()
  if composer.databaseData.marketItemId then
    return composer.databaseData.marketItemId
  else
    db = sqlite3.open(path)
    local marketId = composer.config.serverVersion - 1
    for row in db:nrows("SELECT value FROM marketItemId;") do
      marketId = row.value
    end
    db:close()
    db = nil
    composer.databaseData.marketItemId = marketId
    return composer.databaseData.marketItemId
  end
end

local function setDeviceSyncState(state)
  if state == 1 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO deviceSync VALUES(1, 1);")
    db:close()
    db = nil
    composer.deviceSyncState = 1
  elseif state == 2 then
    db = sqlite3.open(path)
    db:exec("INSERT OR REPLACE INTO deviceSync VALUES(1, 2);")
    db:close()
    db = nil
    composer.deviceSyncState = 2
  end
end

M.setDeviceSyncState = setDeviceSyncState

local function getDeviceSyncState()
  if composer.deviceSyncState then
    return composer.deviceSyncState
  else
    db = sqlite3.open(path)
    local state = 0
    for row in db:nrows("SELECT value FROM deviceSync;") do
      state = row.value
    end
    if state == nil then
      state = 0
    end
    db:close()
    db = nil
    composer.deviceSyncState = state
    return state
  end
end

M.getDeviceSyncState = getDeviceSyncState

local function usedAds()
  local time = os.time()
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO adTime VALUES(1,\"" .. time .. "\");")
  db:close()
  db = nil
  composer.adsTable.time = time
end

M.usedAds = usedAds

local function getLastTimeAds()
  local time = 0
  if 0 < composer.adsTable.time then
    time = composer.adsTable.time
  else
    db = sqlite3.open(path)
    for row in db:nrows("SELECT value FROM adTime;") do
      time = row.value
    end
    if time == nil then
      time = 0
    end
    composer.adsTable.time = time
    db:close()
    db = nil
  end
  return time
end

M.getLastTimeAds = getLastTimeAds

local function setFacebookId(facebookId)
  facebookId = string.format("%.0f", facebookId)
  db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO facebook VALUES(1, " .. facebookId .. ");")
  db:close()
  db = nil
  composer.databaseData.facebookId = facebookId
end

M.setFacebookId = setFacebookId

function M.removeFacebookId()
  local db = sqlite3.open(path)
  db:exec("DELETE FROM facebook;")
  db:close()
  db = nil
end

local function getFacebookId()
  if composer.databaseData.facebookId then
    return composer.databaseData.facebookId
  else
    db = sqlite3.open(path)
    local facebookId
    for row in db:nrows("SELECT facebookId FROM facebook;") do
      facebookId = row.facebookId
    end
    db:close()
    db = nil
    composer.databaseData.facebookId = facebookId
    return facebookId
  end
end

M.getFacebookId = getFacebookId

function M.setFacebookFriends(facebookFriends)
  composer.debugger.debugTable("database", "setFacebookFriends :" .. #facebookFriends, facebookFriends)
  composer.data.facebookFriends = facebookFriends
end

function M.getFacebookFriends()
  if composer.data.facebookFriends then
    return composer.data.facebookFriends
  else
    return {}
  end
end

function M.setFacebookFriendsNotInstalled(facebookFriendsNotInstalled)
  composer.data.facebookFriendsNotInstalled = facebookFriendsNotInstalled
end

function M.getFacebookFriendsNotInstalled()
  if composer.data.facebookFriendsNotInstalled then
    return composer.data.facebookFriendsNotInstalled
  else
    return {}
  end
end

local function getMarketNotification()
  local marketNotificationConfig = composer.config.newItems
  if composer.databaseData.marketNotification then
    return composer.databaseData.marketNotification
  else
    db = sqlite3.open(path)
    local marketNotification = {version = 0, number = 0}
    for row in db:nrows("SELECT version, number FROM marketNotification;") do
      marketNotification = {
        version = row.version,
        number = row.number
      }
    end
    if marketNotificationConfig.version ~= marketNotification.version then
      local tablefill = "INSERT OR REPLACE INTO marketNotification VALUES(1," .. marketNotificationConfig.version .. ", " .. marketNotificationConfig.number .. ");"
      db = sqlite3.open(path)
      db:exec(tablefill)
      composer.databaseData.marketNotification = marketNotificationConfig
    else
      composer.databaseData.marketNotification = marketNotification
    end
    db:close()
    db = nil
    return composer.databaseData.marketNotification
  end
end

M.getMarketNotification = getMarketNotification

local function resetMarketNotification()
  local tablefill = "UPDATE marketNotification set number = 0;"
  db = sqlite3.open(path)
  db:exec(tablefill)
  db:close()
  db = nil
  if composer.databaseData.marketNotification and composer.databaseData.marketNotification.number then
    composer.databaseData.marketNotification.number = 0
  end
end

M.resetMarketNotification = resetMarketNotification

function M.setPushEnableStatus(gameInvite, friendRequest, general)
  local db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO push_enabled VALUES(1, " .. gameInvite .. ", " .. friendRequest .. ", " .. general .. ");")
  db:close()
  db = nil
end

function M.getPushEnableStatus()
  local pushGame, pushFriend, pushGeneral
  local db = sqlite3.open(path)
  for row in db:nrows("SELECT gameInvite, friendRequest, general FROM push_enabled;") do
    pushGame = row.gameInvite
    pushFriend = row.friendRequest
    pushGeneral = row.general
  end
  db:close()
  db = nil
  return pushGame, pushFriend, pushGeneral
end

function M.introOnboardingIsActive()
  local db = sqlite3.open(path)
  local onboardingActive = true
  for row in db:nrows("SELECT part, done FROM onboarding") do
    if row.done and row.done == 1 and row.part == 1 then
      onboardingActive = false
    end
  end
  db:close()
  db = nil
  return onboardingActive
end

function M.onboardingPartIsActive(part)
  local db = sqlite3.open(path)
  local partActive = true
  for row in db:nrows("SELECT part, done FROM onboarding") do
    if row.done and row.done == 1 and row.part == part then
      partActive = false
    end
  end
  db:close()
  db = nil
  return partActive
end

function M.setOnboardingPartDone(part)
  local db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO onboarding VALUES(" .. part .. ",1);")
  db:close()
  db = nil
end

function M.getOnboardingIntroPart()
  local db = sqlite3.open(path)
  local activePart = "0"
  for row in db:nrows("SELECT id, done FROM onboardingIntro;") do
    if row.done and row.id == 1 then
      activePart = "" .. row.done
    end
  end
  db:close()
  db = nil
  return activePart
end

function M.setOnboardingIntroPartDone(part)
  local db = sqlite3.open(path)
  db:exec("INSERT OR REPLACE INTO onboardingIntro VALUES(1," .. part .. ");")
  db:close()
  db = nil
end

function M.initPlayerVariables()
  composer.data.gameInfo = {}
  composer.data.gameInfo.stats = {}
  composer.data.gameInfo.players = {}
  composer.gameHostData = {}
  composer.data.iapOverlayActive = false
  composer.data.playerInfo = {}
  composer.data.achievementProgress = {}
  composer.data.achievementToClaim = 0
  composer.data.dailyToClaim = 0
  composer.data.openURL = false
  composer.showingDailyChallange = false
  composer.showingSendGift = false
  composer.playerInfo = {}
  composer.playerInfo.awards = {}
  composer.videosLeft = 15
  composer.gamesPlayed = 0
  composer.goToLobbyCustomPlay = false
  composer.showFriendsOnline = true
  composer.adsTable = {}
  composer.adsTable.use = false
  composer.adsTable.active = false
  composer.adsTable.time = 0
  composer.adsTable.showTime = 4000
  composer.adsTable.refreshRate = 72000
  composer.adsTable.chances = {}
  composer.facebookLogin = false
  composer.todayChallenges = {}
  composer.todayChallenges.shouldShow = true
  setupTables()
  
  -- OFFLINE MOD: Otomatik oyuncu oluştur
  if composer.config.offlineMode then
    M.createDefaultOfflinePlayer()
  end
end

-- OFFLINE MOD: Varsayılan oyuncu oluştur
function M.createDefaultOfflinePlayer()
  local playerInfo = M.getPlayerInformation()
  if not playerInfo then
    print("OFFLINE MOD: Varsayılan oyuncu oluşturuluyor...")
    M.setPlayerInformation("Oyuncu", 1234, "OFFLINE_PLAYER_" .. os.time(), "offline_token_123")
    M.setAvatarData({1, 0, 0, 0, 0, 0, 0}, false) -- Varsayılan avatar c1s0
    M.setMoney(10000) -- Başlangıç parası
    M.setSound(1) -- Ses açık
    M.setViolence(1) -- Şiddet açık
    print("OFFLINE MOD: Varsayılan oyuncu oluşturuldu!")
  end
end


local function reset()
  M.initPlayerVariables()
  local receipts = M.getReceipts()
  local numberOfReceipts = 0
  for k, v in pairs(receipts) do
    numberOfReceipts = numberOfReceipts + 1
  end
  composer.databaseData = {
    friends = {},
    friendRequests = {},
    items = {
      [1] = {},
      [2] = {},
      [3] = {},
      [4] = {},
      [5] = {},
      [6] = {}
    },
    money = nil
  }
  db = sqlite3.open(path)
  db:exec("DELETE FROM user_settings;")
  db:exec("DELETE FROM playerIdToken;")
  db:exec("DELETE FROM facebook;")
  db:exec("DELETE FROM user_avatar;")
  db:exec("DELETE FROM receipts;")
  db:exec("DELETE FROM onboarding;")
  db:exec("DELETE FROM onboardingIntro;")
  db:exec("DELETE FROM adTime;")
  db:exec("DELETE FROM marketNotification;")
  db:exec("DELETE FROM push_enabled;")
  db:exec("DELETE FROM marketItemId;")
  db:close()
  db = nil
  return true
end

M.reset = reset

local function resetWithoutReceipts()
  composer.databaseData = {
    friends = {},
    friendRequests = {},
    items = {
      [1] = {},
      [2] = {},
      [3] = {},
      [4] = {},
      [5] = {},
      [6] = {}
    },
    money = nil
  }
  db = sqlite3.open(path)
  db:exec("DELETE FROM user_settings;")
  db:exec("DELETE FROM facebook;")
  db:exec("DELETE FROM user_avatar;")
  db:close()
  db = nil
end

M.resetWithoutReceipts = resetWithoutReceipts
return M
