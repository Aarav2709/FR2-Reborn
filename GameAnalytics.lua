local GameAnalytics, sdk_version = {}, "0.2.9"
GameAnalytics.isDebug = true
GameAnalytics.runInSimulator = false
GameAnalytics.submitWhileRoaming = false
GameAnalytics.archiveEvents = true
GameAnalytics.archiveEventsLimit = 512
GameAnalytics.waitForCustomUserID = false
GameAnalytics.newSessionOnResume = false
GameAnalytics.batchRequests = false
GameAnalytics.batchRequestsInterval = 30
GameAnalytics.submitSystemInfo = false
GameAnalytics.submitUnhandledErrors = false
GameAnalytics.submitMemoryWarnings = false
GameAnalytics.maxErrorCount = 20
GameAnalytics.useStoryboard = false
GameAnalytics.submitStoryboardEvents = false
GameAnalytics.useComposer = false
GameAnalytics.submitComposerEvents = false
GameAnalytics.submitAverageFps = false
GameAnalytics.submitAverageFpsInterval = 30
GameAnalytics.submitCriticalFps = false
GameAnalytics.submitCriticalFpsInterval = 5
GameAnalytics.criticalFpsRange = 15
GameAnalytics.criticalFpsBelow = display.fps / 2
local json, crypto, lfs = require("json"), require("crypto"), require("lfs")
local idfa
pcall(function()
  idfa = require("plugin.advertisingId")
end)
local rand = math.random
local apiUrl = "http://api.gameanalytics.com"
local apiVersion = 1
local gameKey, secretKey, userId, build, sessionId, endpointUrl, customUserID, newEvent, submitEvents, initArchiving, setNewBuildVersion
local categories = {
  design = true,
  quality = true,
  user = true,
  business = true,
  error = true,
  unhandledError = true
}
local isSimulator = "simulator" == system.getInfo("environment")
local platformName = system.getInfo("platformName")
local initialized, disabled, isRoaming, hasConnection = false, false, false, true
local canDetectNetworkStatusChanges = false
local gameAnalyticsData, dataDirectory
local storedEventsCount, maxStoredEventsCount, errorCount = 0, 100, 0
local archiveEventsLimitReached, eventsArchived = false, false
local minBatchRequestsInterval, minAverageFpsInterval, minCriticalFpsInterval, minCriticalFpsRange = 1, 5, 5, 10
local manager, sceneInfo, managerType

local function prt()
end

local msg, l, dl = {}, "", ""

local function initDebugPrint()
  for i = 1, 60 do
    l = l .. "-"
    dl = dl .. "="
  end
  
  function msg.initialized()
    if customUserID then
      prt("")
      prt(dl)
      prt("Game Analytics initialized with custom user id.")
      prt(l)
    else
      prt(dl)
      prt("Game Analytics v. " .. sdk_version .. " initialized.")
      prt(l)
    end
    if GameAnalytics.customUserID then
      prt("Custom user ID: " .. tostring(GameAnalytics.customUserID))
    else
      prt("User ID:       " .. tostring(userId))
    end
    prt("Session ID:    " .. tostring(sessionId))
    prt(dl)
  end
  
  function msg.wait()
    prt(l)
    prt("GameAnalytics initialization called. GameAnalytics will")
    prt("initialize automatically when custom user id is set!")
    prt(l)
  end
  
  function msg.connection()
    prt(l)
    prt("Device has connection:    " .. tostring(hasConnection) .. "\n")
    prt("Device is roaming:        " .. tostring(isRoaming))
    prt(l)
  end
  
  function msg.save(message)
    prt(dl)
    prt("Saving stored events. File id: " .. message .. ".txt")
    prt(dl)
  end
  
  function msg.disabled()
    prt(l)
    prt("GameAnalytics is disabled in the Corona simulator.")
    prt(l)
  end
  
  function msg.advertisingTrackingDisabled()
    prt(dl)
    prt("Advertising tracking is disabled on this device.")
    prt("No data will be sent to GameAnalytics.")
    prt(dl)
  end
  
  function msg.roamingWarning()
    prt(l)
    prt("WARNING! It is not possible to detect if this device is roaming.")
    prt(l)
  end
  
  function msg.submittingArchivedEvents(message)
    prt(l)
    prt("Submitting " .. message[1] .. " archived event batch(es) from " .. message[2] .. " session(s)")
    prt(l)
  end
  
  function msg.submittingEventBatch(message)
    prt(l)
    prt("Submitting " .. message .. " batched requests.")
    prt(l)
  end
  
  function msg.storyboardWarning()
    prt(l)
    prt("WARNING! You should also enable useStoryboard")
    prt("if you wan't to enable submitStoryboardEvents.")
    prt(l)
  end
  
  function msg.composerWarning()
    prt(l)
    prt("WARNING! You should also enable useComposer")
    prt("if you wan't to enable submitComposerEvents.")
    prt(l)
  end
  
  function msg.maxErrorCount()
    if errorCount - 1 == GameAnalytics.maxErrorCount then
      prt(l)
      prt("ErrorCount=" .. errorCount - 1 .. ": Maximum error count reached.")
      prt("No more errors will be submitted in this session!")
      prt(l)
    end
  end
  
  function msg.newSession()
    prt(l)
    prt("New session id generated for resume: " .. sessionId)
    prt(l)
  end
  
  function msg.memoryWarningsNotSupported()
    prt(l)
    prt("Notice! Memory warnings are only supported on iOS devices")
    prt(l)
  end
  
  function msg.idfaWarning()
    prt(l)
    prt("WARNING! Add 'plugin.advertisingId' to the plugins table of the build.settings.")
    prt(l)
  end
  
  function msg.event(message)
    local c, m = message[1], message[2]
    local e = "'" .. c .. "': "
    if 1 < #m then
      e = e .. "{ "
    end
    for i = 1, #m do
      e = e .. "{ "
      for k, v in pairs(m[i]) do
        e = e .. k .. "=" .. "'" .. v .. "'" .. ", "
      end
      e = e:sub(0, e:len() - 2)
      e = e .. " }, "
    end
    e = e:sub(0, e:len() - 2)
    if 1 < #m then
      e = e .. " } "
    end
    return e
  end
  
  function prt(message, id)
    if GameAnalytics.isDebug then
      if not id then
        print("GA: " .. message)
      else
        return msg[id](message)
      end
    end
  end
end

local function socketNetworkStatus()
  local socket = require("socket")
  local ping = socket.tcp()
  ping:settimeout(1)
  local connection = ping:connect("www.gameanalytics.com", 80)
  if connection == nil then
    hasConnection = false
  else
    hasConnection = true
  end
  ping:close()
end

local function networkReachabilityListener(event)
  hasConnection = event.isReachable
  if event.isReachable then
    isRoaming = event.isReachable == event.isReachableViaCellular
  end
  if initialized then
    prt(nil, "connection")
  end
end

if network.canDetectNetworkStatusChanges then
  network.setStatusListener("www.gameanalytics.com", networkReachabilityListener)
  canDetectNetworkStatusChanges = true
else
  socketNetworkStatus()
  prt(nil, "roamingWarning")
  prt(nil, "connection")
end

local function submitSystemInfo()
  local systemProperties = {
    "model",
    "enviroment",
    "platformName",
    "appVersionString",
    "architectureInfo",
    "platformVersion",
    "targetAppStore",
    "build",
    "appVersionString",
    "androidAppVersionCode"
  }
  local systemInfo, index = {}, 1
  for i = 1, #systemProperties do
    local message = system.getInfo(systemProperties[i])
    if message and message ~= "" then
      local systemProperty = {}
      systemProperty.event_id = "GA:SystemInfo:" .. systemProperties[i]
      systemProperty.message = system.getInfo(systemProperties[i])
      systemInfo[index] = systemProperty
      index = index + 1
    end
  end
  if system.getInfo("platformName") == "Android" then
    systemInfo[1].message = "Android"
  end
  newEvent("systemInfo", unpack(systemInfo))
end

local function submitUserEvent(initial)
  local userEvent = {
    platform = platformName,
    os_minor = system.getInfo("platformVersion"),
    device = system.getInfo("model"),
    sdk_version = "corona " .. sdk_version,
    build = build
  }
  if idfa then
    if platformName == "iPhone OS" then
      userEvent.ios_id = idfa.getAdvertisingId()
    elseif platformName == "Android" then
      userEvent.android_id = idfa.getAdvertisingId()
    end
  end
  if initial then
    if not isSimulator then
      newEvent("user", userEvent)
    end
  else
    newEvent("user", userEvent)
  end
end

local function saveData(data, path)
  local fh = io.open(path, "w+")
  if fh then
    local content = json.encode(data)
    fh:write(content)
    io.close(fh)
    return true
  else
    prt("Error writing data to file.")
    return
  end
end

local function loadData(path)
  local fh = io.open(path, "r")
  local data
  if fh then
    local content = fh:read("*a")
    if content then
      data = json.decode(content)
      io.close(fh)
    else
      return
    end
  else
    data = {}
  end
  return data
end

local function createUserID()
  local data = loadData(system.pathForFile("GameAnalyticsID.txt", system.DocumentsDirectory))
  if not data.userID then
    local time = os.time()
    local name, deviceInfo = system.getInfo("name"), system.getInfo("architectureInfo")
    local chars = {
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "A",
      "B",
      "C",
      "D",
      "E",
      "F"
    }
    local randomHexTable = {}
    math.randomseed(time)
    for i = 1, 16 do
      randomHexTable[i] = chars[rand(1, 16)]
    end
    local randomHex = table.concat(randomHexTable)
    local id = time .. name .. deviceInfo .. randomHex
    id = id:gsub("%s+", "")
    data.userID = crypto.digest(crypto.md5, id)
    saveData(data, system.pathForFile("GameAnalyticsID.txt", system.DocumentsDirectory))
  end
  return data.userID
end

local function getUserID()
  if platformName == "iPhone OS" then
    local userID = system.getInfo("iosIdentifierForVendor")
    return userID or createUserID()
  else
    return system.getInfo("deviceID")
  end
end

local function createSessionID(init)
  local time = os.time()
  local sid = crypto.digest(crypto.md5, userId .. time)
  if not init then
    prt(nil, "newSession")
  end
  return sid
end

local function archiveEvents()
  if gameAnalyticsData then
    local fileName = os.time()
    local path = system.pathForFile("/GameAnalyticsData/" .. fileName .. ".txt", system.CachesDirectory)
    if saveData(gameAnalyticsData, path) then
      prt(fileName, "save")
    elseif GameAnalytics.archiveEvents then
      initArchiving()
    end
    gameAnalyticsData = nil
    eventsArchived = true
    if not archiveEventsLimitReached and lfs.attributes(dataDirectory) and lfs.attributes(dataDirectory).size > GameAnalytics.archiveEventsLimit * 1000 then
      archiveEventsLimitReached = true
    end
  end
end

local function storeEvent(reason, category, events)
  if GameAnalytics.archiveEvents then
    if archiveEventsLimitReached then
      prt("Event: size limit for archived events reached (event data will be lost)")
    else
      if not gameAnalyticsData then
        gameAnalyticsData = {
          session_id = sessionId,
          user_id = userId,
          build = build,
          categories = {}
        }
      end
      if not gameAnalyticsData.categories[category] then
        gameAnalyticsData.categories[category] = {}
      end
      for i = 1, #events do
        local event = events[i]
        local index = #gameAnalyticsData.categories[category] + 1
        gameAnalyticsData.categories[category][index] = event
      end
      prt("Storing event > category: " .. category .. " (reason: " .. reason .. ")")
      storedEventsCount = storedEventsCount + 1
      if storedEventsCount >= maxStoredEventsCount then
        archiveEvents()
        storedEventsCount = 0
      end
    end
  else
    prt("Can't submit event (" .. reason .. "). Archiving disabled (event data will be lost)")
  end
end

local function submitArchivedEvents()
  timer.performWithDelay(500, function()
    if not hasConnection or not GameAnalytics.submitWhileRoaming and isRoaming then
    else
      local eventCount, sessionCount = 0, 0
      local path = system.pathForFile("/GameAnalyticsData/", system.CachesDirectory)
      if lfs.chdir(path) then
        for file in lfs.dir(path) do
          local data = loadData(system.pathForFile("/GameAnalyticsData/" .. file, system.CachesDirectory))
          if data and data.categories then
            sessionCount = sessionCount + 1
            for k, v in pairs(data.categories) do
              for i = 1, #data.categories[k] do
                if not data.categories[k][i].session_id then
                  data.categories[k][i].session_id = data.session_id
                  data.categories[k][i].user_id = data.user_id
                  data.categories[k][i].build = data.build
                end
              end
              eventCount = eventCount + 1
              newEvent(k, unpack(data.categories[k]))
            end
            os.remove(dataDirectory .. "/" .. file)
          end
        end
      end
      if 0 < eventCount then
        prt({eventCount, sessionCount}, "submittingArchivedEvents")
      end
      eventsArchived = false
    end
  end)
end

local function submitStoredEvents()
  if not hasConnection or not GameAnalytics.submitWhileRoaming and isRoaming then
  else
    if gameAnalyticsData then
      local eventCount = 0
      for k, v in pairs(gameAnalyticsData.categories) do
        eventCount = eventCount + 1
        submitEvents(k, unpack(v))
      end
      gameAnalyticsData = nil
      if 0 < eventCount then
        prt(eventCount, "submittingEventBatch")
      end
    end
    if eventsArchived then
      submitArchivedEvents()
    end
  end
end

local function initBatchRequests()
  if GameAnalytics.batchRequestsInterval < minBatchRequestsInterval then
    error("GA: Minimum value for batchRequestsInterval is " .. minBatchRequestsInterval .. " second!", 3)
  else
    timer.performWithDelay(GameAnalytics.batchRequestsInterval * 1000, submitStoredEvents, 0)
  end
end

function initArchiving()
  if lfs.chdir(system.pathForFile("", system.CachesDirectory)) and lfs.attributes((lfs.currentdir() .. "/GameAnalyticsData"):gsub("\\$", ""), "mode") ~= "directory" then
    lfs.mkdir("GameAnalyticsData")
  end
  dataDirectory = system.pathForFile("/GameAnalyticsData", system.CachesDirectory)
  submitArchivedEvents()
end

local function unhandledErrorListener(event)
  errorCount = errorCount + 1
  if errorCount <= GameAnalytics.maxErrorCount then
    newEvent("unhandledError", {
      message = event.errorMessage .. event.stackTrace,
      severity = "critical"
    })
  else
    prt(nil, "maxErrorCount")
  end
end

local function memoryWarningListener(event)
  errorCount = errorCount + 1
  if errorCount <= GameAnalytics.maxErrorCount then
    newEvent("memoryWarning", {
      message = event.name,
      severity = "warning"
    })
  else
    prt(nil, "maxErrorCount")
  end
end

local function initSubmitUnhandledErrors()
  if not isSimulator then
    Runtime:addEventListener("unhandledError", unhandledErrorListener)
  end
end

local function initSubmitMemoryWarnings()
  if platformName == "iPhone OS" then
    Runtime:addEventListener("memoryWarning", memoryWarningListener)
  else
    prt(nil, "memoryWarningsNotSupported")
  end
end

local averageFps, criticalFpsRange = display.fps, GameAnalytics.criticalFpsRange
local criticalFpsSubmitEnabled = false
local r, st = math.round, system.getTimer
local dm, uc, tt, int, pt = 0, 0, 0, 0, 0

local function enableCriticalFps()
  criticalFpsSubmitEnabled = true
end

local function submitCriticalFps(fps)
  criticalFpsSubmitEnabled = false
  errorCount = errorCount + 1
  if errorCount <= GameAnalytics.maxErrorCount then
    newEvent("criticalFps", {
      event_id = "GA:CriticalFPS",
      value = fps
    })
    timer.performWithDelay(GameAnalytics.submitCriticalFpsInterval * 1000, enableCriticalFps)
  else
    prt(nil, "maxErrorCount")
  end
end

local function deltaTime()
  if int == 0 then
    local ct = st()
    local dt = ct - pt
    pt, uc, tt = ct, uc + criticalFpsRange, tt + dt
    if criticalFpsSubmitEnabled then
      local td = tt / uc
      if td > dm then
        local fps = r(1000 / td)
        submitCriticalFps(fps)
      end
    end
  end
  int = int + 1
  if int == criticalFpsRange then
    int = 0
  end
end

local function submitAverageFps()
  local td = tt / uc
  local fps = r(1000 / td)
  newEvent("averageFps", {
    event_id = "GA:AverageFPS",
    value = fps
  })
  uc, tt = 0, 0
end

local function initSubmitFps()
  if GameAnalytics.submitAverageFpsInterval < minAverageFpsInterval then
    error("GA: Minimum value for submitAverageFpsInterval is " .. minAverageFpsInterval .. " seconds!", 3)
  elseif GameAnalytics.submitCriticalFpsInterval < minCriticalFpsInterval then
    error("GA: Minimum value for submitCriticalFpsInterval is " .. minCriticalFpsInterval .. " seconds!", 3)
  elseif GameAnalytics.criticalFpsRange < minCriticalFpsRange then
    error("GA: Minimum value for criticalFpsRange is " .. minCriticalFpsRange .. " seconds!", 3)
  else
    dm = 1000 / GameAnalytics.criticalFpsBelow
    Runtime:addEventListener("enterFrame", deltaTime)
    if GameAnalytics.submitCriticalFps then
      criticalFpsSubmitEnabled = true
    end
    if GameAnalytics.submitAverageFps then
      timer.performWithDelay(GameAnalytics.submitAverageFpsInterval * 1000, submitAverageFps, 0)
    end
  end
end

local function onSystemEvents(event)
  if event.type == "applicationExit" then
    if GameAnalytics.archiveEvents then
      archiveEvents()
    end
  elseif event.type == "applicationSuspend" then
    if sceneInfo then
      if sceneInfo.enterSceneTime then
        sceneInfo.applicationSuspendedSceneTime = os.time() - sceneInfo.enterSceneTime
      end
      if sceneInfo.enterOverlayTime then
        sceneInfo.applicationSuspendedOverlayTime = os.time() - sceneInfo.enterOverlayTime
      end
    end
    if GameAnalytics.archiveEvents then
      archiveEvents()
    end
  elseif event.type == "applicationResume" then
    if sceneInfo then
      if sceneInfo.applicationSuspendedSceneTime and sceneInfo.enterSceneTime then
        sceneInfo.enterSceneTime = os.time() - sceneInfo.applicationSuspendedSceneTime
      end
      if sceneInfo.applicationSuspendedOverlayTime and sceneInfo.enterOverlayTime then
        sceneInfo.enterOverlayTime = os.time() - sceneInfo.applicationSuspendedOverlayTime
      end
      sceneInfo.applicationSuspendedOverlayTime, sceneInfo.applicationSuspendedOverlayTime = nil, nil
    end
    if not canDetectNetworkStatusChanges then
      socketNetworkStatus()
    end
    if GameAnalytics.archiveEvents then
      initArchiving()
    end
    if GameAnalytics.newSessionOnResume then
      sessionId = createSessionID()
      errorCount = 0
      enableCriticalFps()
    end
  end
end

local addSceneEventListeners, sceneEventHandler, sceneEvents

function sceneEventHandler(e)
  local sceneEvent
  if sceneInfo.isComposer then
    if e.phase == "did" then
      if e.name == "show" then
        local previousSceneName = manager.getSceneName("previous")
        sceneInfo.currentSceneName = manager.getSceneName("current")
        sceneInfo.enterSceneTime = os.time()
        sceneEvent = {
          event_id = "GA:Composer:Show",
          area = sceneInfo.currentSceneName
        }
      elseif e.name == "hide" then
        local timeSpentOnScene = os.time() - sceneInfo.enterSceneTime
        sceneEvent = {
          event_id = "GA:Composer:Hide",
          area = sceneInfo.currentSceneName,
          value = timeSpentOnScene
        }
        if sceneInfo.currentSceneName ~= manager.getSceneName("current") then
          for i = 1, #sceneEvents do
            sceneInfo.currentScene:removeEventListener(sceneEvents[i], sceneEventHandler)
          end
          local nextSceneName = manager.getSceneName("current")
          sceneInfo.currentSceneName = nextSceneName
          sceneInfo.currentScene = manager.getScene(nextSceneName)
          addSceneEventListeners(sceneInfo.currentScene)
        end
      end
    end
  elseif e.name == "enterScene" then
    local previousSceneName = manager.getPrevious()
    sceneInfo.currentSceneName = manager.getCurrentSceneName()
    sceneInfo.enterSceneTime = os.time()
    sceneEvent = {
      event_id = "GA:Storyboard:EnterScene",
      area = sceneInfo.currentSceneName
    }
  elseif e.name == "didExitScene" then
    local timeSpentOnScene = os.time() - sceneInfo.enterSceneTime
    sceneEvent = {
      event_id = "GA:Storyboard:ExitScene",
      area = sceneInfo.currentSceneName,
      value = timeSpentOnScene
    }
    if sceneInfo.currentSceneName ~= manager.getCurrentSceneName() then
      for i = 1, #sceneEvents do
        sceneInfo.currentScene:removeEventListener(sceneEvents[i], sceneEventHandler)
      end
      local nextSceneName = manager.getCurrentSceneName()
      sceneInfo.currentSceneName = nextSceneName
      sceneInfo.currentScene = manager.getScene(nextSceneName)
      addSceneEventListeners(sceneInfo.currentScene)
    end
  elseif e.name == "overlayBegan" then
    sceneInfo.enterOverlayTime = os.time()
    sceneEvent = {
      event_id = "GA:Storyboard:OverlayBegan",
      area = sceneInfo.currentSceneName .. ":" .. e.sceneName
    }
  elseif e.name == "overlayEnded" then
    local timeSpentOnOverlay = os.time() - sceneInfo.enterOverlayTime
    sceneEvent = {
      event_id = "GA:Storyboard:OverlayEnded",
      area = sceneInfo.currentSceneName .. ":" .. e.sceneName,
      value = timeSpentOnOverlay
    }
  end
  if sceneEvent and sceneInfo.submitEvents then
    newEvent(managerType, sceneEvent)
  end
end

function addSceneEventListeners()
  for i = 1, #sceneEvents do
    sceneInfo.currentScene:addEventListener(sceneEvents[i], sceneEventHandler)
  end
end

local function initSceneListener(type)
  if GameAnalytics.useStoryboard and GameAnalytics.useComposer then
    error("GA: You can not use Composer and Storyboard at the same time!")
  else
    managerType = type
    manager = require(managerType)
    sceneInfo = {
      enterSceneTime = os.time(),
      enterOverlayTime = os.time(),
      isComposer = "composer" == managerType
    }
    local sceneName
    if sceneInfo.isComposer then
      sceneName = manager.getSceneName("current")
      sceneEvents = {"show", "hide"}
      if GameAnalytics.submitComposerEvents then
        sceneInfo.submitEvents = true
      end
    else
      sceneName = manager.getCurrentSceneName()
      sceneEvents = {
        "enterScene",
        "didExitScene",
        "overlayBegan",
        "overlayEnded"
      }
      if GameAnalytics.submitStoryboardEvents then
        sceneInfo.submitEvents = true
      end
    end
    if sceneName then
      sceneInfo.currentScene = manager.getScene(sceneName)
      sceneInfo.currentSceneName = "main"
      addSceneEventListeners()
    else
      error("GA: You MUST require " .. managerType .. " and call " .. managerType .. ".gotoScene BEFORE initializing Game Analytics in your main file.", 3)
    end
  end
end

local alias = {
  systemInfo = "quality",
  storyboard = "design",
  composer = "design",
  unhandledError = "error",
  memoryWarning = "error",
  averageFps = "design",
  criticalFps = "design"
}

function submitEvents(category, ...)
  local params, headers, message = {}, {}, {
    ...
  }
  local eventType
  if alias[category] then
    eventType = category
    category = alias[category]
  else
    eventType = "custom"
  end
  local dbgMsg = prt({category, message}, "event")
  for k, v in pairs(message) do
    if type(v) ~= "table" then
      error("GA: Attempt to submit non-table event!", 4)
    end
    if not v.session_id then
      v.build = build
      v.session_id = sessionId
      v.user_id = userId
    else
      eventType = "archived"
    end
  end
  local json_message = json.encode(message)
  params.body = json_message
  local signature = json_message .. secretKey
  headers.Authorization = crypto.digest(crypto.md5, signature)
  headers["Content-Type"] = "application/json"
  params.headers = headers
  local post_url = endpointUrl .. category
  
  local function networkListener(event)
    if event.isError then
      storeEvent("unknown error, status=" .. tostring(event.status), category, message)
    elseif GameAnalytics.isDebug and eventType ~= "archived" then
      dbgMsg = "Submitting " .. eventType .. " event(s): " .. dbgMsg .. " - Server response: " .. event.response
      prt(dbgMsg)
    end
  end
  
  network.request(post_url, "POST", networkListener, params)
end

function newEvent(category, ...)
  if not disabled then
    local message, area = {
      ...
    }
    if sceneInfo and sceneInfo.currentSceneName then
      local area = sceneInfo.currentSceneName
      if category ~= "user" then
        for k, v in pairs(message) do
          v.area = v.area or area
        end
      end
    end
    if GameAnalytics.batchRequests then
      storeEvent("batch requests", category, message)
    elseif hasConnection then
      if not GameAnalytics.submitWhileRoaming and isRoaming then
        storeEvent("roaming", category, message)
      else
        submitEvents(category, ...)
      end
    else
      storeEvent("no connection", category, message)
    end
  end
end

function GameAnalytics.init(params)
  if GameAnalytics.isDebug then
    initDebugPrint()
  elseif isSimulator then
    GameAnalytics.runInSimulator = false
  end
  if not idfa then
    prt(nil, "idfaWarning")
  end
  if isSimulator and not GameAnalytics.runInSimulator then
    prt(nil, "disabled")
    disabled = true
  elseif idfa and not idfa.isTrackingEnabled() then
    prt(nil, "advertisingTrackingDisabled")
    disabled = true
  elseif initialized then
    error("GA: You already initialized Game Analytics.", 2)
  else
    initialized = true
    if params then
      gameKey, secretKey, build = params.game_key, params.secret_key, params.build_name
    end
    if composer.config.abTest ~= "" then
      build = params.build_name .. composer.config.abTest
    end
    if not gameKey then
      error("GA: You have to supply a game_key when initializing!", 2)
    end
    if not secretKey then
      error("GA: You have to supply a secret_key when initializing!", 2)
    end
    if not build then
      error("GA: You have to supply a build_name when initializing!", 2)
    end
    if GameAnalytics.waitForCustomUserID and customUserID == nil then
      prt(nil, "wait")
    else
      userId = customUserID or getUserID()
      sessionId = createSessionID(true)
      endpointUrl = apiUrl .. "/" .. apiVersion .. "/" .. gameKey .. "/"
      if GameAnalytics.archiveEvents then
        initArchiving()
      end
      if GameAnalytics.batchRequests then
        initBatchRequests()
      end
      if GameAnalytics.useStoryboard then
        initSceneListener("storyboard")
      elseif GameAnalytics.useComposer then
        initSceneListener("composer")
      end
      if GameAnalytics.submitMemoryWarnings then
        initSubmitMemoryWarnings()
      end
      if GameAnalytics.submitUnhandledErrors then
        initSubmitUnhandledErrors()
      end
      if GameAnalytics.submitAverageFps or GameAnalytics.submitCriticalFps then
        initSubmitFps()
      end
      if GameAnalytics.submitSystemInfo then
        timer.performWithDelay(100, submitSystemInfo)
      end
      submitUserEvent(true)
      Runtime:addEventListener("system", onSystemEvents)
      prt(nil, "initialized")
      if not GameAnalytics.useStoryboard and GameAnalytics.submitStoryboardEvents then
        prt(nil, "storyboardWarning")
      elseif not GameAnalytics.useComposer and GameAnalytics.submitComposerEvents then
        prt(nil, "composerWarning")
      end
    end
  end
end

function GameAnalytics.newEvent(category, ...)
  if not disabled then
    if userId then
      if categories[category] then
        newEvent(category, ...)
      else
        error("GA: Category error! '" .. category .. "' is not a valid category.", 2)
      end
    elseif GameAnalytics.waitForCustomUserID and not customUserID then
      prt("Event discarded. Waiting for custom user id!")
    elseif GameAnalytics.isDebug then
      print("GA: Event discarded. Waiting for GameAnalytics to initialize.")
    end
  end
end

function GameAnalytics.setCustomUserID(id)
  if not disabled then
    if initialized then
      if GameAnalytics.waitForCustomUserID then
        customUserID = id
        prt("Custom user id set. Initializing GameAnalytics now...")
        initialized = false
        GameAnalytics.init()
      else
        error("GA: Set waitForCustomUserID to true if you want to set a custom user id after initializing!", 2)
      end
    else
      customUserID = id
    end
    
    function GameAnalytics.setCustomUserID()
      prt("Warning! You already supplied a custom user id. Your request will be ignored.")
    end
  end
end

function GameAnalytics.getUserID()
  if GameAnalytics.waitForCustomUserID and not customUserID then
    error("GA: You can't retrieve the user id because Game Analytics is waiting for you to set a custom user id.", 2)
  elseif not initialized and not customUserID then
    error("GA: Warning! You have to initialize Game Analytics before you can call getUserID()", 2)
  end
  return userId or customUserID
end

function setNewBuildVersion(newBuildVersion)
  print("Setting new build version from ", build, newBuildVersion)
  build = newBuildVersion
end

GameAnalytics.setNewBuildVersion = setNewBuildVersion
return GameAnalytics
