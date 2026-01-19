local M = {}
local provider = "vungle"
local appId = "com.dirtybit.funrun2"
local ads = require("ads")
local composer = require("composer")
local vungleStarted = false
local isSimulator = "simulator" == system.getInfo("environment")
if isAndroid then
  appId = composer.config.vungleAndroid
else
  appId = composer.config.vungleiOS
end

local function showVideo()
  print("show Vungle")
  composer.adsTable.active = true
  ads:setCurrentProvider(provider)
  ads.show("interstitial", {isBackButtonEnabled = false})
end

M.showVideo = showVideo

local function loadAd()
end

M.loadAd = loadAd

local function isAdReady()
  if isSimulator then
    return false
  elseif vungleStarted then
    ads:setCurrentProvider(provider)
    return ads.isAdAvailable()
  else
    return vungleStarted
  end
end

M.isAdReady = isAdReady

local function functionAdListener(event)
  if event.type == "adStart" and event.isError then
  elseif event.type == "adEnd" then
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
  print("")
  print("Received Vungle event type: ", event.type)
  print("Received Vungle event response: ", event.response)
end

local function init()
  if vungleStarted then
  elseif isSimulator then
    vungleStarted = false
    print("WARNING: Vungle does not work on the simulator")
  else
    vungleStarted = true
    ads.init(provider, appId, functionAdListener)
    print("init vungle version ", ads.getVersionString())
  end
end

M.init = init
return M
