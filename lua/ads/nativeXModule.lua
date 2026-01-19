local M = {}
local provider = "nativex"
local appId = "com.dirtybit.funrun2"
local ads = require("ads")
local composer = require("composer")
local nativeXStarted = false
local isSimulator = "simulator" == system.getInfo("environment")
local videoReady = false
local adReady = false
local shouldInitAds = false
if isAndroid then
  appId = composer.config.nativeXAndroid
else
  appId = composer.config.nativeXiOS
end

local function myAdLoaded(event)
  print("myAdLoaded response ", event.response)
  print("myAdLoaded isError ", event.isError)
  print("myAdLoaded loadedPlacement ", event.response)
  local loadedPlacement = event.response
  if event.isError then
    print("Failed to load ad with Placement:", loadedPlacement)
  elseif loadedPlacement == "Video" then
    videoReady = true
  elseif loadedPlacement == "Level Completed" then
    adReady = true
  end
end

local function myAdShown(event)
  print("myVideoShown response ", event.response)
  print("myVideoShown isError ", event.isError)
  print("myVideoShown loadedPlacement ", event.response)
  local loadedPlacement = event.response
  if event.isError then
  elseif loadedPlacement == "Video" then
    composer.comm.seenVideo()
  end
  composer.adsTable.active = false
end

local function myAdDismissed()
  composer.adsTable.active = false
end

local function mySdkInit(event)
  print("mySdkInit ", event.response)
  print("mySdkInit ", event.isError)
  local sessionid = event.response
  if event.isError then
    print("SDK Failed to Initialize")
  else
    nativeXStarted = true
  end
end

local function showAds()
  print("show NativeX")
  adReady = false
  ads:setCurrentProvider(provider)
  ads.show("interstitial", {
    placement = "Level Completed"
  })
end

M.showAds = showAds

local function showVideo()
  print("show NativeX")
  composer.adsTable.active = true
  videoReady = false
  ads:setCurrentProvider(provider)
  ads.show("interstitial", {
    placement = "Video",
    adshown = myAdShown,
    addismissed = myAdDismissed
  })
end

M.showVideo = showVideo

local function loadAd()
  if nativeXStarted then
    ads:setCurrentProvider(provider)
    ads.load("interstitial", {
      placement = "Level Completed",
      adloaded = myAdLoaded
    })
  end
end

M.loadAd = loadAd

local function preloadVideo()
  if nativeXStarted then
    ads:setCurrentProvider(provider)
    ads.load("interstitial", {placement = "Video", adloaded = myAdLoaded})
  end
end

M.preloadVideo = preloadVideo

local function isAdReady()
  return adReady
end

M.isAdReady = isAdReady

local function isVideoReady()
  return videoReady
end

M.isVideoReady = isVideoReady

local function init()
  if nativeXStarted then
  elseif isSimulator then
    nativeXStarted = false
    print("WARNING: NativeX does not work on the simulator")
  elseif shouldInitAds then
    ads.init(provider, appId, {sdkinitialized = mySdkInit})
  end
end

M.init = init
return M
