local M = {}
local cb = require("plugin.chartboost")
local composer = require("composer")
local chance = 1
M.shouldInitAds = true
M.adIsLoaded = false
M.videoAdIsLoaded = false
M.adIsStarted = false
local id, signarture

local function chartBoostListener(event)
  print("")
  print("chartBoostListener")
  print("event.type ", event.type)
  print("event.response ", event.response)
  if event.type == "interstitial" then
    if event.response == "closed" then
      composer.adsTable.active = false
    elseif event.response == "cached" then
      M.adIsLoaded = true
    elseif event.response == "failed" then
      M.adIsLoaded = false
    end
  elseif event.type == "rewardedVideo" then
    if event.response == "closed" then
      composer.adsTable.active = false
    elseif event.response == "clicked" then
    elseif event.response == "cached" then
      M.videoAdIsLoaded = true
    elseif event.response == "failed" then
      M.videoAdIsLoaded = false
    elseif event.response == "reward" then
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
end

local function startChartboost()
  cb.init({
    appID = id,
    appSignature = signarture,
    listener = chartBoostListener
  })
  cb.startSession(id, signarture)
end

local function systemEvent(event)
  local phase = event.phase
  if event.type == "applicationResume" and M.adIsStarted then
    startChartboost()
  end
  return true
end

Runtime:addEventListener("system", systemEvent)

local function initAds()
  if "simulator" == system.getInfo("environment") then
    print("WARNING: chartboost not supported on the simulator")
  elseif composer.adsTable.use and M.shouldInitAds then
    if isAndroid then
      id = composer.config.cbIdAndroid
      signarture = composer.config.cbSignartureAndroid
    else
      id = composer.config.cbIdOS
      signarture = composer.config.cbSignartureOS
    end
    M.shouldInitAds = false
    M.adIsStarted = true
    startChartboost()
  end
end

M.initAds = initAds

local function preloadAds(newChance)
  if newChance then
    chance = newChance
  end
  if M.adIsStarted then
    if M.adIsLoaded then
      return false
    end
    cb.cache("interstitial")
    M.adIsLoaded = true
  end
end

M.preloadAds = preloadAds

local function isAdReady()
  if M.adIsStarted then
    return cb.hasCachedInterstitial()
  else
    return false
  end
end

M.isAdReady = isAdReady

local function showAds()
  if isAdReady() and not composer.adsTable.active then
    print("Show chartboost video")
    cb.show("interstitial")
    composer.adsTable.active = true
    composer.database.usedAds()
    M.adIsLoaded = false
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
    if composer.adsTable.chances.chartboostAdChance then
      return composer.adsTable.chances.chartboostAdChance
    else
      return chance
    end
  else
    return 0
  end
end

M.getChance = getChance

function M.preloadVideo()
  if M.adIsStarted then
    if M.videoAdIsLoaded then
      return false
    end
    cb.cache("rewardedVideo")
  end
end

function M.isVideoReady()
  if M.adIsStarted then
    if cb.hasCachedRewaredVideo and cb.hasCachedRewaredVideo() then
      return true
    elseif M.videoAdIsLoaded then
      return true
    else
      cb.cache("rewardedVideo")
    end
  end
  return false
end

function M.showVideo()
  if M.isVideoReady() and not composer.adsTable.active then
    cb.show("rewardedVideo")
    composer.adsTable.active = true
    M.videoAdIsLoaded = false
  end
end

return M
