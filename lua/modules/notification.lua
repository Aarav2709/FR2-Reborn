local composer = require("composer")
local notificationPlugin = require("plugin.notifications")
local M = {}
local messageType
local queuedLocalPushNotifications = {}
local inactivityText3Days = {
  "Want to race?",
  "Miss the feel of sawblades?"
}
local inactivityText7Days = {
  "Let's race!",
  "You just got magneted back into this game"
}

local function notificationListener(event)
  if event.type == "remote" then
    print("remote notification")
  elseif event.type == "local" then
    print("local notification")
  elseif event.type == "remoteRegistration" then
    local platform
    if "Android" == system.getInfo("platformName") then
      platform = 1
    else
      platform = 0
    end
    local remotePushToken = {}
    remotePushToken.t = event.token
    remotePushToken.p = platform
    composer.pushToken = remotePushToken
  end
  composer.debugger.debugTable("notification", "Push - event: ", event)
  if event.custom then
    local data = event.custom
    if data and data.m then
      messageType = data.m
      if tonumber(messageType) == 1 then
        composer.gameHostData.serverAddress = data.a
        composer.gameHostData.sessionId = data.s
        composer.config.tcpClient = composer.gameHostData.serverAddress
      end
    else
      print("push data on wrong format", data)
    end
  end
end

M.notificationListener = notificationListener

local function increaseBadgeNumber(amount)
  local badgeNumber = native.getProperty("applicationIconBadgeNumber")
  badgeNumber = badgeNumber + amount
  native.setProperty("applicationIconBadgeNumber", badgeNumber)
end

M.increaseBadgeNumber = increaseBadgeNumber

local function decreaseBadgeNumber(amount)
  local badgeNumber = native.getProperty("applicationIconBadgeNumber")
  badgeNumber = badgeNumber - amount
  native.setProperty("applicationIconBadgeNumber", badgeNumber)
end

M.decreaseBadgeNumber = decreaseBadgeNumber

local function setBadgeNumber(amount)
  native.setProperty("applicationIconBadgeNumber", amount)
end

M.setBadgeNumber = setBadgeNumber

local function resetBadgeNumber()
  native.setProperty("applicationIconBadgeNumber", 0)
end

M.resetBadgeNumber = resetBadgeNumber

local function checkForPushNotification()
  if messageType == nil then
    return
  end
  local currentScene = composer.getSceneName("current")
  if currentScene == "lua.scenes.loadingScene" then
    return
  end
  print("checkForPushNotification ", messageType)
  if tonumber(messageType) == 1 then
    composer.data.gameInfo.gameType = 4
    composer.gotoScene("lua.scenes.lobbyCustomPlay")
  elseif tonumber(messageType) == 2 then
    local options = {isModal = true}
    composer.showOverlay("lua.overlays.messages", options)
  elseif tonumber(messageType) == 3 then
    composer.gotoScene("lua.scenes.marketplace")
  elseif tonumber(messageType) == 4 then
  elseif tonumber(messageType) == 5 then
  end
  messageType = nil
end

M.checkForPushNotification = checkForPushNotification

local function clean()
  Runtime:removeEventListener("notification", notificationListener)
end

M.clean = clean

local function getRandomNotificationText(array)
  local randomIndex = math.random(1, #array)
  return array[randomIndex]
end

local function addLocalPushNotification(timeToPush, textArray)
  if not (composer.database and composer.database.getPlayerInformation) or not composer.database.getPushEnableStatus then
    return
  end
  local playerInformation = composer.database.getPlayerInformation()
  if not playerInformation or not playerInformation.username then
    return
  end
  local pushGame, pushFriend, pushGeneral = composer.database.getPushEnableStatus()
  if pushGeneral ~= 1 then
    return
  end
  local options = {
    alert = getRandomNotificationText(textArray)
  }
  local notificationID = notificationPlugin.scheduleNotification(timeToPush, options)
  queuedLocalPushNotifications[#queuedLocalPushNotifications + 1] = notificationID
end

function queue3DayNotification()
  local timeToPush = 259200
  addLocalPushNotification(timeToPush, inactivityText3Days)
end

M.queue3DayNotification = queue3DayNotification

function queue7DayNotification()
  local timeToPush = 604800
  addLocalPushNotification(timeToPush, inactivityText7Days)
end

M.queue7DayNotification = queue7DayNotification

function clearLocalPushNotificationQueue()
  for i = 1, #queuedLocalPushNotifications do
    notificationPlugin.cancelNotification(queuedLocalPushNotifications[i])
  end
  queuedLocalPushNotifications = {}
end

M.clearLocalPushNotificationQueue = clearLocalPushNotificationQueue

local function startPush()
  Runtime:addEventListener("notification", notificationListener)
end

startPush()
composer.notification = M
