local M = {}
local provider = "adrally"
local adrally = require("plugin.adrally")
local appId = "com.dirtybit.funrun2"
local composer = require("composer")
local adrallyStarted = false
local initCalled = false
local isSimulator = "simulator" == system.getInfo("environment")
local videoLoaded = false
local adLoaded = false
local shouldStartAdrally = true
local videoActive = false
local checkForVideoLoad = false
local checkForFullscreenLoad = false
local videoZone = "video"
local fullscreenZone = "fullscreen"
local adType = "interstitial"
if isAndroid then
  appId = composer.config.adrallyAndroid
else
  appId = composer.config.adrallyiOS
end

local function showAds()
  if adrallyStarted then
    print("show Adrally ads")
    composer.adsTable.active = true
    adLoaded = false
    adrally.show(adType, {zone = fullscreenZone})
  end
end

M.showAds = showAds

local function hideAds()
  composer.adsTable.active = false
end

M.hideAds = hideAds

local function isAdReady()
  if isSimulator then
    return false
  elseif adLoaded then
    return true
  elseif adrallyStarted then
    checkForFullscreenLoad = true
    adrally.checkLoaded(adType, {zone = fullscreenZone})
    return false
  else
    return adrallyStarted
  end
end

M.isAdReady = isAdReady

local function loadAd()
  if adrallyStarted then
    if adLoaded then
      return false
    end
    print("try to load adrally fullscreen ads")
    adrally.load(adType, {zone = fullscreenZone})
  end
end

M.loadAd = loadAd

local function getChance()
  if M.adIsStarted then
    if composer.adsTable.chances.fuseAdChance then
      return composer.adsTable.chances.fuseAdChance
    end
    return 0
  else
    return 0
  end
end

M.getChance = getChance

local function showVideo()
  if adrallyStarted then
    print("show Adrally video")
    composer.adsTable.active = true
    videoLoaded = false
    videoActive = true
    adrally.show(adType, {zone = videoZone})
  end
end

M.showVideo = showVideo

local function isVideoReady()
  if isSimulator then
    return false
  elseif videoLoaded then
    return true
  elseif adrallyStarted then
    checkForVideoLoad = true
    adrally.checkLoaded(adType, {zone = videoZone})
    return false
  else
    return adrallyStarted
  end
end

M.isVideoReady = isVideoReady

local function preloadVideo()
  if adrallyStarted then
    if videoLoaded then
      return false
    end
    print("try to load adrally video ads")
    adrally.load(adType, {zone = videoZone})
  end
end

M.preloadVideo = preloadVideo

local function functionAdListener(event)
  print("")
  print("Adrally feedback")
  print("phase ", event.phase)
  print("provider ", event.provider)
  print("isError ", event.isError)
  print("response ", event.response)
  print("type ", event.type)
  if event.phase == "init" then
    adrallyStarted = true
  elseif event.phase == "loaded" then
    if event.isError then
      checkForFullscreenLoad = false
      checkForVideoLoad = false
    elseif checkForFullscreenLoad then
      checkForFullscreenLoad = false
      adLoaded = true
    elseif checkForVideoLoad then
      checkForVideoLoad = false
      videoLoaded = true
    end
  elseif event.phase == "completed" and videoActive then
    videoActive = false
    if composer.adsTable.boostVideoActive then
      composer.adsTable.boostVideoActive = false
      local seenVideoEvent = {
        name = "seenVideoAdEvent"
      }
      Runtime:dispatchEvent(seenVideoEvent)
      timer.performWithDelay(500, composer.comm.seenBoostVideo)
    else
      timer.performWithDelay(500, composer.comm.seenVideo)
    end
    composer.adsTable.active = false
  end
end

local function init()
  print("init adrally")
  if adrallyStarted then
    print("allready connected")
  elseif isSimulator then
    adrallyStarted = false
    print("WARNING: Adrally does not work on the simulator")
  elseif not initCalled and shouldStartAdrally then
    initCalled = true
    print("started init call")
    adrally.init(provider, appId, functionAdListener)
  end
end

M.init = init
return M
