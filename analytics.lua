local composer = require("composer")
local isSimulator = "simulator" == system.getInfo("environment")
local maxErrorCount = 30
local currentErrorCount = 0
local M = {}
if composer.config.gameAnalytics then
  M.plugin = require("GameAnalytics")
  M.plugin.isDebug = false
  M.plugin.runInSimulator = false
  M.plugin.archiveEvents = true
  M.plugin.archiveEventsLimit = 256
  M.plugin.batchRequests = true
  M.plugin.batchRequestsInterval = 50
  M.plugin.submitSystemInfo = true
  M.plugin.submitUnhandledErrors = false
  M.plugin.submitCriticalFps = false
  M.plugin.criticalFpsBelow = 20
  M.plugin.submitCriticalFpsInterval = 30
  M.plugin.criticalFpsRange = 15
  M.plugin.maxErrorCount = 30
  M.plugin.iosIdentifierForVendor = true
  M.plugin.useComposer = true
  M.plugin.submitComposerEvents = true
else
  M.plugin = {}
  
  function M.plugin.init(_, _)
  end
  
  function M.plugin.logEvent(_, _)
  end
  
  function M.plugin.newEvent(_, _)
  end
end
local unhandledErrorListener, initSubmitUnhandledErrors

function unhandledErrorListener(event)
  local scene = composer.getSceneName("current")
  local textMessage = event.errorMessage .. event.stackTrace
  if scene then
    textMessage = textMessage .. [[
 
 in ]] .. scene .. " v: " .. composer.config.fullVersion
  end
  print("unhandledError: ", textMessage)
  if currentErrorCount < maxErrorCount then
    currentErrorCount = currentErrorCount + 1
    M.plugin.newEvent("unhandledError", {message = textMessage, severity = "critical"})
  end
end

function initSubmitUnhandledErrors()
  if not isSimulator then
    Runtime:addEventListener("unhandledError", unhandledErrorListener)
  end
end

if composer.config.gameAnalytics then
  M.newEvent = M.plugin.newEvent
  M.setNewBuildVersion = M.plugin.setNewBuildVersion
end
if composer.config.gameAnalytics then
  M.plugin.init({
    game_key = composer.config.GAGameKey,
    secret_key = composer.config.GASecretKey,
    build_name = composer.config.fullVersion .. composer.config.abTest
  })
  initSubmitUnhandledErrors()
else
  print("ERROR: no analytics, turn on in config")
end
return M
