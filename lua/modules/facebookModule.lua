local composer = require("composer")
local M = {}
local delayedAttemps = 0
local delayedTimer, callback
M.libFacebook = require("lua.modules.facebook_lib")
M.libFacebook.FB_App_ID = composer.config.facebookAppId
M.libFacebook.FB_Access_Token = composer.config.facebookToken

local function changeToShortNames(friendList)
  for _, record in ipairs(friendList) do
    local nameSplit = {}
    record.name:split(" ", nameSplit)
    local shortName = nameSplit[1]
    for i = 2, #nameSplit do
      shortName = shortName .. " " .. nameSplit[i]:sub(1, 1) .. "."
    end
    record.name = shortName
  end
  return friendList
end

local function sortFacebookFriends(friendList)
  local function sortFunction(a, b)
    return a.name < b.name
  end
  
  table.sort(friendList, sortFunction)
  return friendList
end

local function matchFacebookFriendsWithServerFriends(friendInstalled)
  local friends = composer.database.getFriends()
  for i = 1, #friendInstalled do
    local isFriendAlready = false
    for j = 1, #friends do
      if friends[j].f and tonumber(friends[j].f) == tonumber(friendInstalled[i].id) then
        isFriendAlready = true
        friends[j].facebookName = friendInstalled[i].name
      end
    end
    if not isFriendAlready then
      composer.comm.addFacebookFriend(friendInstalled[i].id)
    end
  end
  composer.debugger.debugTable("facebook", "friends matched", friends)
end

local function onShowDialogComplete(event)
end

local function invitePlayerToDownloadApp()
  M.libFacebook.showDialog({
    app_id = composer.config.facebookAppId,
    message = composer.localized.get("Text"),
    title = composer.localized.get("title")
  }, onShowDialogComplete)
end

M.invitePlayerToDownloadApp = invitePlayerToDownloadApp

local function onListFriendsComplete(event)
  if event.isError then
    composer.debugger.debugPrint("facebook", "List Friends - Error, details: " .. event.response.error.message)
  elseif event.response.data then
    local friendList = event.response.data
    composer.debugger.debugPrint("facebook", "Facebook friends Length: " .. #friendList)
    friendList = sortFacebookFriends(friendList)
    friendList = changeToShortNames(friendList)
    local friendInstalled = {}
    local friendNotInstalled = {}
    for _, record in ipairs(friendList) do
      if record.installed then
        friendInstalled[#friendInstalled + 1] = {
          id = record.id,
          name = record.name,
          installed = true
        }
      else
        friendNotInstalled[#friendNotInstalled + 1] = {
          id = record.id,
          name = record.name,
          installed = false
        }
      end
    end
    matchFacebookFriendsWithServerFriends(friendInstalled)
    composer.debugger.debugPrint("facebook", "Sorted facebook friends name")
    composer.database.setFacebookFriends(friendInstalled)
    composer.database.setFacebookFriendsNotInstalled(friendNotInstalled)
  end
end

local function getFacebookFriends()
  composer.debugger.debugPrint("facebook", "getFacebookFriends")
  M.libFacebook.request("me/friends", "GET", {
    fields = "name,installed"
  }, onListFriendsComplete)
end

M.getFacebookFriends = getFacebookFriends

local function stopDelayedTimer()
  if delayedTimer then
    timer.cancel(delayedTimer)
    delayedTimer = nil
  end
end

M.stopDelayedTimer = stopDelayedTimer

local function onListMeComplete(event)
  if event.isError then
    composer.config.facebookMissmatch = true
    if callback then
      local data = {isError = true}
      callback(data)
    else
      composer.createCustomOverlay(2)
    end
    composer.debugger.debugPrint("facebook", "List Me - Error, details: " .. event.response.error.message)
  elseif event.response.id then
    composer.debugger.debugPrint("facebook", "Set Facebook id: " .. event.response.id)
    if composer.config.loginMessage then
      composer.commHttps.loginWithFacebook(composer.config.facebookToken, event.response.id)
    elseif composer.database.getFacebookId() then
      if tonumber(composer.database.getFacebookId()) == tonumber(event.response.id) then
        composer.config.facebookMissmatch = false
        if composer.config.authenticate then
          getFacebookFriends()
        elseif delayedAttemps < 5 then
          local function closure()
            local sameEvent = event
            
            onListMeComplete(sameEvent)
          end
          
          print("WARNING: delayed facebook friend check")
          delayedTimer = timer.performWithDelay(2000, closure, 1)
          delayedAttemps = delayedAttemps + 1
        end
      else
        composer.config.facebookMissmatch = true
      end
    else
      composer.commHttps.registerFacebook(composer.config.facebookToken, event.response.id)
    end
  else
    composer.config.facebookMissmatch = true
    composer.alytics.newEvent("design", {
      event_id = "facebook:idIsNil",
      area = composer.getSceneName("current")
    })
  end
end

local function sendErrorToComm()
  local httpsFormat = require("lua.network.httpsMessageFormat")
  local data = {}
  data.m = httpsFormat.loginWithFacebook()
  data.r = 19
  composer.commHttps.httpsReceiveFunction(data)
end

local function onLoginComplete(event)
  if event.phase ~= "login" then
    composer.debugger.debugPrint("facebook", "Facebook login not successful")
    if composer.getSceneName("overlay") == "lua.overlay.loginUser" then
      if callback then
        local data = {isError = true}
        callback(data)
      end
    else
      composer.createCustomOverlay(3)
    end
  elseif event.isError then
    if composer.getSceneName("overlay") == "lua.overlay.loginUser" then
      sendErrorToComm()
    else
      composer.createCustomOverlay(4)
    end
    composer.debugger.debugPrint("facebook", "Facebook login error - details: " .. event.response.error.message)
  else
    if event.token then
      composer.config.facebookToken = event.token
    end
    M.libFacebook.request("me", "GET", {fields = "name"}, onListMeComplete)
  end
end

local function onLogoutComplete(event)
end

local function login(permissions, fbCallback)
  delayedAttemps = 0
  M.libFacebook.login(permissions, onLoginComplete)
  callback = fbCallback
end

M.login = login

local function logout()
  M.libFacebook.logout(onLogoutComplete)
end

M.logout = logout

local function fetchFriends()
  if M.libFacebook.isLoggedIn() then
    M.libFacebook.request("me/friends", "GET", {
      fields = "name,installed"
    }, onListFriendsComplete)
  else
    login()
  end
end

M.fetchFriends = fetchFriends

local function isLoggedIn()
  return M.libFacebook.isLoggedIn()
end

M.isLoggedIn = isLoggedIn
return M
