local M = {}
local ads = require("ads")
local composer = require("composer")
local chance = 1
M.shouldInitAds = false
M.adIsLoaded = false
M.videoAdIsLoaded = false
M.adIsStarted = false
local fullscreenAdId, videoAdId
local adProvider = "admob"

local function admobListener(event)
  print("")
  print("admobFullscreenListener")
  print("event.name ", event.name)
  print("event.response ", event.response)
  print("event.phase ", event.phase)
  print("event.type ", event.type)
  print("event.isError ", event.isError)
  if event.phase == "shown" then
    M.adIsLoaded = false
    M.videoAdIsLoaded = false
  elseif event.phase == "refresh" then
    M.adIsLoaded = true
    M.videoAdIsLoaded = true
  elseif event.phase == "loaded" then
    M.adIsLoaded = true
    M.videoAdIsLoaded = true
  end
end

local function initAds()
  if "simulator" == system.getInfo("environment") then
    print("WARNING: admod not supported on the simulator")
  elseif composer.adsTable.use and M.shouldInitAds then
    if isAndroid then
      fullscreenAdId = composer.config.admobFullscreenAndroid
      videoAdId = composer.config.admobVideoAndroid
    else
      fullscreenAdId = composer.config.admobFullscreeiOS
      videoAdId = composer.config.admobVideoiOS
    end
    M.shouldInitAds = false
    M.adIsStarted = true
    print("init admob")
    ads.init(adProvider, fullscreenAdId, admobListener)
    print("admob loaded")
  end
end

M.initAds = initAds

local function isAdReady()
  if M.adIsStarted then
    return M.adIsLoaded
  else
    return false
  end
end

M.isAdReady = isAdReady

local function preloadAds(newChance)
  if newChance then
    chance = newChance
  end
  if M.adIsStarted and not isAdReady() then
    print("load ad")
    ads:setCurrentProvider(adProvider)
    ads.load("interstitial", {appId = fullscreenAdId})
  end
end

M.preloadAds = preloadAds

local function showAds()
  print("try to show ad")
  if isAdReady() and not composer.adsTable.active then
    ads:setCurrentProvider(adProvider)
    ads.show("interstitial", {appId = fullscreenAdId})
    composer.database.usedAds()
  end
end

M.showAds = showAds

local function hideAds()
  if not M.adIsStarted or composer.adsTable.active then
  end
  composer.adsTable.active = false
end

M.hideAds = hideAds

local function getChance()
  if M.adIsStarted then
    return chance
  else
    return 0
  end
end

M.getChance = getChance

function M.isVideoReady()
  if M.adIsStarted then
    return M.videoAdIsLoaded
  end
  return false
end

function M.preloadVideo()
  if M.adIsStarted and not M.isVideoReady() then
    print("load video admob")
    ads:setCurrentProvider(adProvider)
    ads.load("interstitial", {appId = videoAdId})
  end
end

function M.showVideo()
  print("try to show video")
  if M.isVideoReady() and not composer.adsTable.active then
    print("show video admob")
    ads:setCurrentProvider(adProvider)
    ads.show("interstitial", {appId = videoAdId})
  end
end

return M
