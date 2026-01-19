local M = {}
local RevMob = require("revmob")
local storyboard = require("storyboard")
local chance = 0.5
M.shouldInitAds = true
M.adIsLoaded = false
M.adIsStarted = false

local function revmobListener(event)
  if event.type == "adNotReceived" then
    M.adIsLoaded = false
  end
end

local function initAds()
  if storyboard.adsTable.use and M.shouldInitAds then
    M.shouldInitAds = false
    M.adIsStarted = true
    M.REVMOB_IDS = {
      Android = storyboard.config.revmobAndroid,
      ["iPhone OS"] = storyboard.config.revmobiOS
    }
    if system.getInfo("targetAppStore") == "amazon" then
      M.REVMOB_IDS = {
        Android = storyboard.config.revmobAmazon
      }
    end
    RevMob.startSession(M.REVMOB_IDS)
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
    M.fullscreenAd = RevMob.createFullscreen(revmobListener)
    M.adIsLoaded = true
  end
end

M.preloadAds = preloadAds

local function showAds()
  if M.adIsStarted and M.fullscreenAd and not storyboard.adsTable.active then
    M.fullscreenAd:show()
    storyboard.adsTable.active = true
    storyboard.database.usedAds()
    M.adIsLoaded = false
  end
end

M.showAds = showAds

local function hideAds()
  if M.adIsStarted and M.fullscreenAd and storyboard.adsTable.active then
    M.fullscreenAd:hide()
  end
  storyboard.adsTable.active = false
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

local function isAdReady()
  if M.adIsStarted then
    return M.fullscreenAd and M.adIsLoaded
  else
    return false
  end
end

M.isAdReady = isAdReady
return M
