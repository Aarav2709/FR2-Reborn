local M = {}
local composer = require("composer")
local vungleModule, admobModule, chartboostModule, nativeXModule, adrallyModule
local vungleChance = 0
local admobChance = 0
local chartboostChance = 0
local videoChance = 0
local nativeXChance = 0
local adrallyChacne = 0
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

local function setChance(newVungleChance, newAdmobChance, newChartboostChance, newNativeXChacne, newAdrallyChance)
  if composer.config.platform == "z" or haveSetChance then
    return
  end
  haveSetChance = true
  videoChance = 0
  if newVungleChance then
    vungleChance = newVungleChance * 10
    videoChance = videoChance + vungleChance
    vungleModule = require("lua.ads.vungleModule")
  end
  if newAdmobChance then
    admobChance = newAdmobChance * 10
    videoChance = videoChance + admobChance
    admobModule = require("lua.ads.admobModule")
  end
  if newChartboostChance then
    chartboostChance = newChartboostChance * 10
    videoChance = videoChance + chartboostChance
    chartboostModule = require("lua.ads.chartboostModule")
  end
  if newNativeXChacne then
    nativeXChance = newNativeXChacne * 10
    videoChance = videoChance + nativeXChance
    nativeXModule = require("lua.ads.nativeXModule")
  end
  if newAdrallyChance then
    adrallyChacne = newAdrallyChance * 10
    videoChance = videoChance + adrallyChacne
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
  if admobModule and 0 < admobChance and admobModule.isVideoReady() then
    videoReady = true
    readyVideos[#readyVideos + 1] = {}
    readyVideos[#readyVideos].chance = admobChance
    readyVideos[#readyVideos].ad = admobModule
    print("Admob video ready")
  end
  if vungleModule and 0 < vungleChance and vungleModule.isAdReady() then
    videoReady = true
    readyVideos[#readyVideos + 1] = {}
    readyVideos[#readyVideos].chance = vungleChance
    readyVideos[#readyVideos].ad = vungleModule
    print("Vungle video ready")
  end
  if chartboostModule and 0 < chartboostChance and chartboostModule.isVideoReady() then
    videoReady = true
    readyVideos[#readyVideos + 1] = {}
    readyVideos[#readyVideos].chance = chartboostChance
    readyVideos[#readyVideos].ad = chartboostModule
    print("Chartboost video ready")
  end
  if nativeXModule and 0 < nativeXChance and nativeXModule.isVideoReady() then
    videoReady = true
    readyVideos[#readyVideos + 1] = {}
    readyVideos[#readyVideos].chance = nativeXChance
    readyVideos[#readyVideos].ad = nativeXModule
    print("NativeX video ready")
  end
  if adrallyModule and 0 < adrallyChacne and adrallyModule.isVideoReady() then
    videoReady = true
    readyVideos[#readyVideos + 1] = {}
    readyVideos[#readyVideos].chance = adrallyChacne
    readyVideos[#readyVideos].ad = adrallyModule
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
  print("adrallyChacne ", adrallyChacne)
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
      local counter = 0
      for i = 1, #listOfSuppliers do
        if randomNumber < listOfSuppliers[i].chance + counter then
          listOfSuppliers[i].ad.showVideo()
          composer.videosLeft = composer.videosLeft - 1
          return
        else
          counter = counter + listOfSuppliers[i].chance
        end
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
    if adrallyModule and 0 < adrallyChacne then
      adrallyModule.preloadVideo()
    end
  end
end

M.loadAd = loadAd
return M
