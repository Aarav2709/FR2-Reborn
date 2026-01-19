local socket = require("socket")
local json = require("json")
local composer = require("composer")
local networkStatus = require("lua.network.networkStatus")
local tcpFormat = require("lua.network.tcpMessageFormat")
local Network = {}
local serverPort = 6689
local timeInterval = 200
local currenttimeInterval = 200
local lastConnectionTime
local heartbeatInterval = 30000
local connectMessage
local hardStop = false
local tcpConnection
local isConnected = false
local gotFirstPackage = false
local getPacketLoop, reconnectLoop, heartbeatLoop, alertText, alertSymbol
local alertCheck = 3000
local receiveFunction
local partialReadMessage = ""

local function toggleNetworkAlert()
  if alertText then
    alertText:removeSelf()
    alertText = nil
  end
  if alertSymbol then
    alertSymbol:removeEventListener("tap", Network.isOnline)
    alertSymbol:removeSelf()
    alertSymbol = nil
  end
  if composer.getSceneName("current") == "lua.scenes.gamePlay" then
    return
  elseif composer.getSceneName("current") == "lua.scenes.updateScene" then
    return
  elseif composer.getSceneName("current") == "lua.scenes.startScreen" then
    return
  elseif composer.getSceneName("current") == "lua.scenes.loadingScene" then
    return
  end
  if not isConnected or not gotFirstPackage then
    alertSymbol = display.newImageRect("images/gui/common/dropdown/barOffline.png", 76, 31)
    alertSymbol.anchorX = 0.5
    alertSymbol.anchorY = 0
    alertSymbol.x = 240
    alertSymbol.y = 0
    alertSymbol:addEventListener("tap", Network.isOnline)
  end
end

Network.toggleNetworkAlert = toggleNetworkAlert

local function checkIfPlayerIsInInvalidScene(suspendinApp)
  if isSimulator and composer.config.bot then
    local currentScene = composer.getSceneName("current")
    if currentScene ~= "lua.scenes.mainMenu" then
      composer.gotoScene("lua.scenes.mainMenu")
      composer.removeScene(currentScene)
    end
  end
end

Network.checkIfPlayerIsInInvalidScene = checkIfPlayerIsInInvalidScene

local function sendHeatbeat()
  local data = {}
  data.m = tcpFormat.heartbeat()
  if isConnected then
    Network.sendPacket(data)
  end
end

Network.sendHeatbeat = sendHeatbeat

local function sendConnectMessage()
  if connectMessage == nil then
    print("ERROR in connecting message, it's nil")
    return
  end
  if type(connectMessage) ~= "table" then
    print("ERROR in connecting message")
    return
  end
  local jsonObject = json.encode(connectMessage)
  composer.debugger.debugPrint("network", "jsonObject sendPacket: " .. jsonObject)
  tcpConnection:send(jsonObject .. "\n")
end

Network.sendConnectMessage = sendConnectMessage

local function timeBasedReconnect()
  if lastConnectionTime and lastConnectionTime + 30 < os.time() then
    Network.isOnline()
  else
    toggleNetworkAlert()
  end
end

local function getPacketFromServer(event)
  if isConnected then
    local jsonObject, errorCode, partialRead = tcpConnection:receive("*l")
    if errorCode and errorCode == "timeout" and partialRead and string.len(partialRead) > 0 then
      partialReadMessage = partialReadMessage .. partialRead
    elseif errorCode and errorCode == "closed" then
      print("errorCode social ", errorCode)
      isConnected = false
      gotFirstPackage = false
      checkIfPlayerIsInInvalidScene()
      timeBasedReconnect()
    elseif jsonObject then
      if string.len(partialReadMessage) > 0 then
        jsonObject = partialReadMessage .. jsonObject
        partialReadMessage = ""
      end
      composer.debugger.debugPrint("network", "rec: " .. jsonObject)
      local data = json.decode(jsonObject)
      if type(data) == "table" then
        if gotFirstPackage == false then
          gotFirstPackage = true
          composer.notification.checkForPushNotification()
          toggleNetworkAlert()
        end
        receiveFunction(data)
      else
        print("TCP social: got corrupt data ", jsonObject)
        local newData = {}
        newData.corrupt = true
        receiveFunction(newData)
      end
    end
  end
end

local function closeTCP(isHardStop)
  composer.debugger.debugPrint("network", "close tcp social connection with closeTCP")
  isConnected = false
  gotFirstPackage = false
  if isHardStop then
    hardStop = true
  end
  if getPacketLoop then
    timer.cancel(getPacketLoop)
    getPacketLoop = nil
  end
  if heartbeatLoop then
    timer.cancel(heartbeatLoop)
    heartbeatLoop = nil
  end
  if reconnectLoop then
    timer.cancel(reconnectLoop)
    reconnectLoop = nil
  end
  if tcpConnection then
    tcpConnection:close()
    tcpConnection = nil
  end
  composer.config.authenticate = false
end

Network.closeTCP = closeTCP

local function connectTCP()
  if hardStop then
    print("Hard stop, do not auto reconnect")
    return
  end
  if composer.config.fakeServer then
    return
  end
  if gotFirstPackage then
    return
  end
  if tcpConnection then
    tcpConnection:close()
    tcpConnection = nil
  end
  networkStatus.checkStatus()
  lastConnectionTime = os.time()
  tcpConnection = socket.tcp()
  tcpConnection:settimeout(3)
  tcpConnection:setoption("tcp-nodelay", true)
  isConnected = tcpConnection:connect(composer.config.tcpSocial, serverPort)
  tcpConnection:settimeout(0)
  gotFirstPackage = false
  composer.debugger.debugTable("network", #connectMessage, connectMessage)
  if heartbeatLoop then
    timer.cancel(heartbeatLoop)
    heartbeatLoop = nil
  end
  heartbeatLoop = timer.performWithDelay(heartbeatInterval, sendHeatbeat, 0)
  timer.performWithDelay(alertCheck, toggleNetworkAlert, 1)
end

local function checkConnection()
  if composer.config.fakeServer then
    return
  end
  if isConnected then
    composer.debugger.debugPrint("network", "tcp social connection up")
    getPacketLoop = timer.performWithDelay(timeInterval, getPacketFromServer, 0)
  else
    print("failed to start tcp social connection")
  end
end

local function safeTCPStart()
  closeTCP()
  connectTCP()
  checkConnection()
  composer.debugger.debugPrint("network", "start TCP social")
end

local function startTCP(theReceiveFunction, message)
  hardStop = false
  receiveFunction = theReceiveFunction
  connectMessage = message
  safeTCPStart()
end

Network.startTCP = startTCP

local function setReceiveFunction(thereceiveFunction)
  if getPacketLoop then
    timer.cancel(getPacketLoop)
    getPacketLoop = nil
    receiveFunction = thereceiveFunction
    getPacketLoop = timer.performWithDelay(currenttimeInterval, getPacketFromServer, 0)
  end
end

Network.setReceiveFunction = setReceiveFunction

local function sendPacket(data)
  if composer.config.fakeServer then
    return
  end
  if isConnected and gotFirstPackage then
    local jsonObject = json.encode(data)
    composer.debugger.debugPrint("network", "jsonObject sendPacket: " .. jsonObject)
    tcpConnection:send(jsonObject .. "\n")
  end
end

Network.sendPacket = sendPacket

local function isOnline()
  if isConnected and gotFirstPackage and composer.config.authenticate then
    sendHeatbeat()
    return true
  else
    if not hardStop then
      timer.performWithDelay(alertCheck, toggleNetworkAlert, 1)
      composer.comm.startSocialTCP()
    end
    return false
  end
end

Network.isOnline = isOnline
return Network
