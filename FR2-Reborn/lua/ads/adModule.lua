local M = {}
local cb = require("lua.ads.chartboostModule")
local adrallyModule
local composer = require("composer")
local otherListenFunction
local chanceForRevmob = 0.5
local chanceForChartboost = 0.5
local chanceForAdrally = 0.5
local revmobFirst = false
local chartboostFirst = false
local revmobReady = false
local chartboostReady = false
local adrallyReady = false
local activeAd

local function init()
  if composer.adsTable.chances.fuseAdChance then
    adrallyModule = require("lua.ads.adrallyModule")
    adrallyModule.init()
    chanceForAdrally = composer.adsTable.chances.fuseAdChance
    chanceForAdrally = chanceForAdrally * 10
  end
  if cb then
    chanceForChartboost = cb.getChance() * 10
  end
end

local function timeToShowAds()
  local lastAdTime = composer.database.getLastTimeAds()
  local currentTime = os.time()
  if currentTime > lastAdTime + composer.adsTable.refreshRate then
    return true
  else
    return false
  end
end

local function shouldShowAds()
  if composer.data.gameInfo.gameType ~= 1 then
    return false
  end
  if composer.adsTable.use then
    if timeToShowAds() then
      return true
    else
      return false
    end
  else
    return false
  end
end

M.shouldShowAds = shouldShowAds

local function hideAds()
  if activeAd then
    activeAd.hideAds()
  end
end

M.hideAds = hideAds

local function preloadAds()
  if cb then
    cb.preloadAds()
  end
  if adrallyModule then
    adrallyModule.loadAd()
  end
end

M.preloadAds = preloadAds

local function getAdReadyState()
  chartboostReady = false
  adrallyReady = false
  if cb then
    chartboostReady = cb.isAdReady()
    print("chartboostReady fullscreen")
  end
  if adrallyModule then
    adrallyReady = adrallyModule.isAdReady()
    print("adrallyReady fullscreen")
  end
end

local function showAds()
  getAdReadyState()
  local chanceSum = chanceForAdrally + chanceForChartboost
  if chartboostReady and adrallyReady then
    local chance = math.random(0, chanceSum)
    print("both ready chance is ", chance)
    print("chanceForAdrally ", chanceForAdrally)
    print("chanceForChartboost ", chanceForChartboost)
    if chance > chanceForAdrally then
      cb.showAds()
      activeAd = cb
    else
      adrallyModule.showAds()
      activeAd = adrallyModule
    end
  elseif chartboostReady then
    cb.showAds()
    activeAd = cb
  elseif adrallyReady then
    adrallyModule.showAds()
    activeAd = adrallyModule
  else
    activeAd = nil
    preloadAds()
  end
end

M.showAds = showAds
init()
return M
