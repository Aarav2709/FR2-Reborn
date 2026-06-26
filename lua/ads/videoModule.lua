local M = {}
local composer = require("composer")
local videoSelection = require("lua.ads.videoSelection")
local vungleModule, admobModule, chartboostModule, nativeXModule, adrallyModule
local vungleChance = 0
local admobChance = 0
local chartboostChance = 0
local videoChance = 0
local nativeXChance = 0
local adrallyChance = 0
local isLoaded = false
local haveSetChance = false
local haveSentMessage = false

local function haveSeenVideo()
  if haveSentMessage then
    return
  elseif composer.comm and composer.comm.isOnline() then
    composer.comm.seenVideo()
    haveSentMessage = true
  else
    print("WARNING: failed to send video message, will attempt 4 times")
  end
end

local function callback(data)
  if data.getCoins then
    print("send message to server")
    haveSentMessage = false
    haveSeenVideo()
    if not haveSentMessage then
      timer.performWithDelay(800, haveSeenVideo, 3)
    end
  end
end

local function setChance(newVungleChance, newAdmobChance, newChartboostChance, newNativeXChance, newAdrallyChance)
  if composer.config.platform == "z" or haveSetChance then
    return
  end
  haveSetChance = true
  local chanceState = videoSelection.buildChanceState({
    vungle = newVungleChance,
    admob = newAdmobChance,
    chartboost = newChartboostChance,
    nativeX = newNativeXChance,
    adrally = newAdrallyChance
  })
  videoChance = chanceState.total
  if newVungleChance then
    vungleChance = chanceState.vungle
    vungleModule = require("lua.ads.vungleModule")
  end
  if newAdmobChance then
    admobChance = chanceState.admob
    admobModule = require("lua.ads.admobModule")
  end
  if newChartboostChance then
    chartboostChance = chanceState.chartboost
    chartboostModule = require("lua.ads.chartboostModule")
  end
  if newNativeXChance then
    nativeXChance = chanceState.nativeX
    nativeXModule = require("lua.ads.nativeXModule")
  end
  if newAdrallyChance then
    adrallyChance = chanceState.adrally
    adrallyModule = require("lua.ads.adrallyModule")
  end
end

M.setChance = setChance

local function init()
  if composer.config.platform == "z" or isLoaded then
    return
  end
  if vungleModule then
    vungleModule.init()
  end
  if admobModule then
    admobModule.initAds()
  end
  if chartboostModule then
    chartboostModule.initAds()
  end
  if nativeXModule then
    nativeXModule.init()
  end
  if adrallyModule then
    adrallyModule.init()
  end
  isLoaded = true
end

M.init = init

local function isVideoReady()
  if not isLoaded then
    return false
  end
  local videoReady = false
  local readyVideos = {}
  if composer.videosLeft < 1 then
    return false
  end
  if videoSelection.appendReadyVideo(readyVideos, admobModule, admobChance, function(module)
    return module.isVideoReady()
  end) then
    videoReady = true
    print("Admob video ready")
  end
  if videoSelection.appendReadyVideo(readyVideos, vungleModule, vungleChance, function(module)
    return module.isAdReady()
  end) then
    videoReady = true
    print("Vungle video ready")
  end
  if videoSelection.appendReadyVideo(readyVideos, chartboostModule, chartboostChance, function(module)
    return module.isVideoReady()
  end) then
    videoReady = true
    print("Chartboost video ready")
  end
  if videoSelection.appendReadyVideo(readyVideos, nativeXModule, nativeXChance, function(module)
    return module.isVideoReady()
  end) then
    videoReady = true
    print("NativeX video ready")
  end
  if videoSelection.appendReadyVideo(readyVideos, adrallyModule, adrallyChance, function(module)
    return module.isVideoReady()
  end) then
    videoReady = true
    print("Adrally video ready")
  end
  if videoReady == false then
    print("WARNING: no video ready")
  end
  return videoReady, readyVideos
end

M.isVideoReady = isVideoReady

local function showAd()
  print("showAd")
  if not isLoaded then
    return
  end
  print("vungleChance ", vungleChance)
  print("admobChance ", admobChance)
  print("chartboostChance ", chartboostChance)
  print("nativeXChance ", nativeXChance)
  print("adrallyChance ", adrallyChance)
  print("videoChance ", videoChance)
  if not (0 < videoChance) then
    return
  end
  local randomNumber = math.random(0, videoChance)
  local videoReady, listOfSuppliers = isVideoReady()
  if videoReady then
    if #listOfSuppliers == 1 then
      listOfSuppliers[1].ad.showVideo()
      return
    else
      local selectedSupplier = videoSelection.selectReadyVideo(listOfSuppliers, randomNumber)
      if selectedSupplier then
        selectedSupplier.ad.showVideo()
        composer.videosLeft = composer.videosLeft - 1
        return
      end
    end
    print("WARNING: failed to show video")
  else
    print("There was no video")
  end
end

M.showAd = showAd

local function loadAd()
  if isLoaded and composer.wifiOn then
    if vungleModule and 0 < vungleChance then
      vungleModule.loadAd()
    end
    if admobModule and 0 < admobChance then
      admobModule.preloadVideo()
    end
    if chartboostModule and 0 < chartboostChance then
      chartboostModule.preloadVideo()
    end
    if nativeXModule and 0 < nativeXChance then
      nativeXModule.preloadVideo()
    end
    if adrallyModule and 0 < adrallyChance then
      adrallyModule.preloadVideo()
    end
  end
end

M.loadAd = loadAd
return M
