local socket = require("socket")
local json = require("json")
local composer = require("composer")
local crypto = require("crypto")
local Network = {}
local serverAddress = composer.config.tcpClient
local serverPort = 6789
local timeInterval = 10
local currenttimeInterval = 10
local tcpConnection, getPacketLoop, receiveFunction
local connected = false
local gotFirstConnection = false
local gotNormalPacket = false
local connecting = false
local sendPongMessage

local function solveChallenge(serverChallenge, version)
  if version == "1" then
    serverChallenge = "zs-dlk*ghf3#DFCw!35fs[];'pj;v.>" .. serverChallenge:sub(3, string.len(serverChallenge) - 1) .. "skldhv7aoFG8h^fd$$afgsxv"
    local solvedChallenge = crypto.digest(crypto.sha512, serverChallenge)
    return solvedChallenge
  else
    return serverChallenge
  end
end

local function sendFirstGameMessage(solvedChallenge)
  local gameType = composer.data.gameInfo.gameType
  local messageType = tonumber(composer.gameConfig.getClientMessageTypeForName("CONNECT"))
  local playerId = composer.database.getPlayerInformation().playerId
  local data
  if composer.config.serverBot then
    messageType = tonumber(composer.gameConfig.getClientMessageTypeForName("BOT_CONNECT"))
    data = {
      m = messageType,
      p = playerId,
      t = gameType
    }
  elseif gameType == 4 then
    data = {
      m = messageType,
      p = playerId,
      t = gameType,
      g = composer.gameHostData.sessionId
    }
  else
    data = {
      m = messageType,
      p = playerId,
      t = gameType
    }
  end
  data.a = solvedChallenge
  local jsonObject = json.encode(data)
  composer.debugger.debugPrint("network", jsonObject)
  tcpConnection:send(jsonObject .. "\n")
  composer.debugger.debugPrint("network", "have sent first message")
end

local function lostConnection()
  composer.createCustomOverlay(19)
  local sceneToRemove = composer.getSceneName("current")
  composer.gotoScene("lua.scenes.mainMenu")
  composer.removeScene(sceneToRemove)
end

local function getPacketFromServer(event)
  if tcpConnection and connected then
    local jsonObject, errorCode = tcpConnection:receive("*l")
    if errorCode == "closed" then
      print("errorCode game", errorCode)
      connected = false
      lostConnection()
    elseif jsonObject then
      local data = json.decode(jsonObject)
      if type(data) == "table" then
        composer.debugger.debugPrint("network", "rec tcpClient: " .. jsonObject)
        if data[1] and composer.gameConfig.getMessageTypeForID(tostring(data[1])) == "HANDSHAKE" then
          local challenge = solveChallenge(data[2], data[3])
          sendFirstGameMessage(challenge)
        else
          gotNormalPacket = true
          connected = true
          gotFirstConnection = true
          if data[1] and composer.gameConfig.getMessageTypeForID(tostring(data[1])) == "PING" then
            sendPongMessage(data)
          end
        end
        receiveFunction(data)
      end
    end
  else
  end
end

local function connectTCP()
  print("try to connect tcp")
  if tcpConnection then
    tcpConnection:close()
    tcpConnection = nil
  end
  connecting = true
  gotFirstConnection = false
  tcpConnection = socket.tcp()
  tcpConnection:settimeout(3)
  tcpConnection:setoption("tcp-nodelay", true)
  serverAddress = composer.config.tcpClient
  if tcpConnection == nil then
    print("WARNING: tcpConnection game = nil")
    return
  end
  if type(serverAddress) == "table" or serverAddress == nil then
    print("WARNING:  in sendFirstGameMessage not valid format", serverAddress)
    return
  end
  if composer.data.gameInfo.gameType == 3 then
  end
  tcpConnection:connect(serverAddress, serverPort)
  tcpConnection:settimeout(0)
  connected = true
  print("done with connect")
end

local function startTCP(theReceiveFunction)
  connected = false
  if not tcpConnection then
    composer.debugger.debugPrint("network", "start TCP game client")
    receiveFunction = theReceiveFunction
    connectTCP()
    getPacketLoop = timer.performWithDelay(timeInterval, getPacketFromServer, 0)
  end
end

local function pauseReadFromBuffer()
  if getPacketLoop then
    timer.cancel(getPacketLoop)
    getPacketLoop = nil
  end
end

local function setReceiveFunction(thereceiveFunction)
  if getPacketLoop then
    timer.cancel(getPacketLoop)
    getPacketLoop = nil
  end
  receiveFunction = thereceiveFunction
  getPacketLoop = timer.performWithDelay(currenttimeInterval, getPacketFromServer, 0)
end

local function trimNumber(number)
  if number then
    return math.round(number)
  else
    return 0
  end
end

local function sendMessage(msg)
  local data = {m = msg}
  if connected and gotFirstConnection then
    local jsonObject = json.encode(data)
    composer.debugger.debugPrint("network", "sendMessage tcp: ", jsonObject)
    tcpConnection:send(jsonObject .. "\n")
  else
    print("tcp connection is not up yet")
  end
end

local function sendMinimizedMessage(msg)
  if connected and gotFirstConnection then
    composer.debugger.debugPrint("network", "sendMinimizedMessage tcp", msg)
    tcpConnection:send(msg .. "\n")
  else
    print("WARNING: sendMinimizedMessage tcp connection is not up yet")
  end
end

function sendPongMessage(data)
  local msgID = composer.gameConfig.getClientMessageTypeForName("PONG")
  local msg = "[" .. msgID .. "," .. data[2] .. "]"
  sendMinimizedMessage(msg)
end

local function sendCorrigateMessage(pX, pY, pVX, pVY)
  if connected and gotFirstConnection and composer.serverClock then
    pX = trimNumber(pX)
    pY = trimNumber(pY)
    pVX = trimNumber(pVX)
    pVY = trimNumber(pVY)
    local t = composer.serverClock()
    local id = composer.gameConfig.getClientMessageTypeForName("CORRIGATE_POSITION")
    local jsonObject = "[" .. id .. "," .. t .. "," .. pX .. "," .. pY .. "," .. pVX .. "," .. pVY .. "]"
    tcpConnection:send(jsonObject .. "\n")
  else
    print("WARNING: sendCorrigateMessage tcp connection is not up yet")
  end
end

local function sendPowerUpMessage(powerUpType, pX, pY, pVX, pVY, puNumber)
  if composer.serverClock then
    pX = trimNumber(pX)
    pY = trimNumber(pY)
    pVX = trimNumber(pVX)
    pVY = trimNumber(pVY)
    local time = composer.serverClock() + composer.gameConfig.getPowerUpDelay()
    local id = composer.gameConfig.getClientMessageTypeForName("POWERUP")
    local jsonObject = "[" .. id .. "," .. time .. "," .. powerUpType .. "," .. pX .. "," .. pY .. "," .. pVX .. "," .. pVY .. "," .. puNumber .. "]"
    sendMinimizedMessage(jsonObject)
  end
end

local function sendJumpMessage(x, y, vx, vy)
  if composer.serverClock then
    x = trimNumber(x)
    y = trimNumber(y)
    vx = trimNumber(vx)
    vy = trimNumber(vy)
    local time = composer.serverClock() + composer.gameConfig.getJumpDelay()
    local id = composer.gameConfig.getClientMessageTypeForName("JUMP")
    local jsonObject = "[" .. id .. "," .. time .. "," .. x .. "," .. y .. "," .. vx .. "," .. vy .. "]"
    sendMinimizedMessage(jsonObject)
  end
end

local function sendPowerBoxMessage(puType, x, y, boxX, boxY)
  if composer.serverClock then
    local id = composer.gameConfig.getClientMessageTypeForName("POWERBOX")
    local t = composer.serverClock()
    local jsonObject = "[" .. id .. "," .. t .. "," .. puType .. "," .. x .. "," .. y .. "," .. boxX .. "," .. boxY .. "]"
    sendMinimizedMessage(jsonObject)
  end
end

local function sendPlayerHitByPowerUp(killerID, powerUpType, puNumber, hitType, respawnTime)
  if composer.serverClock then
    local id = composer.gameConfig.getClientMessageTypeForName("POWERUP_HIT")
    local t = composer.serverClock() + composer.gameConfig.getRespawnTime()
    if respawnTime then
      t = composer.serverClock() + respawnTime
    end
    local jsonObject = "[" .. id .. "," .. t .. "," .. killerID .. "," .. powerUpType .. "," .. puNumber .. "," .. hitType .. "]"
    sendMinimizedMessage(jsonObject)
  else
    print("sendPlayerHitByPowerUp error ", puNumber)
  end
end

local function sendStartTyping()
  local id = composer.gameConfig.getClientMessageTypeForName("CHAT_START_TYPING")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendStopTyping()
  local id = composer.gameConfig.getClientMessageTypeForName("CHAT_STOP_TYPING")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendPlayerReachedGoal()
  local id = composer.gameConfig.getClientMessageTypeForName("REACHED_GOAL")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendStartGame()
  local id = composer.gameConfig.getClientMessageTypeForName("START_GAME")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendPlayerReady()
  local id = composer.gameConfig.getClientMessageTypeForName("PLAYER_READY")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendRejoinGame()
  local id = composer.gameConfig.getClientMessageTypeForName("REJOIN_GAME")
  local jsonObject = "[" .. id .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendMapSelected(mapId)
  local id = composer.gameConfig.getClientMessageTypeForName("SET_MAP")
  local jsonObject = "[" .. id .. "," .. mapId .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendToggleRandomPlayers(randomOn)
  local id = composer.gameConfig.getClientMessageTypeForName("TOGGLE_RANDOM_PLAYERS")
  local jsonObject = "[" .. id .. "," .. randomOn .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendKickPlayer(playerId)
  local id = composer.gameConfig.getClientMessageTypeForName("KICK_PLAYER")
  local jsonObject = "[" .. id .. "," .. playerId .. "]"
  sendMinimizedMessage(jsonObject)
end

local function sendChatMessage(chatID)
  local id = composer.gameConfig.getClientMessageTypeForName("POSTGAME_CHAT")
  local jsonObject = "[" .. id .. "," .. chatID .. "]"
  sendMinimizedMessage(jsonObject)
end

local function stopTCPClient()
  if getPacketLoop then
    timer.cancel(getPacketLoop)
    getPacketLoop = nil
  end
  if tcpConnection then
    tcpConnection:close()
    tcpConnection = nil
  end
  connected = false
  composer.debugger.debugPrint("network", "stop tcp")
end

local function isOnline()
  if connected and gotFirstConnection then
    return true
  else
    return false
  end
end

Network.startTCP = startTCP
Network.stopTCPClient = stopTCPClient
Network.setReceiveFunction = setReceiveFunction
Network.sendJumpMessage = sendJumpMessage
Network.sendPowerUpMessage = sendPowerUpMessage
Network.sendMessage = sendMessage
Network.sendMinimizedMessage = sendMinimizedMessage
Network.sendCorrigateMessage = sendCorrigateMessage
Network.sendPowerBoxMessage = sendPowerBoxMessage
Network.sendPlayerHitByPowerUp = sendPlayerHitByPowerUp
Network.sendPlayerReachedGoal = sendPlayerReachedGoal
Network.sendStartGame = sendStartGame
Network.sendRejoinGame = sendRejoinGame
Network.sendMapSelected = sendMapSelected
Network.sendToggleRandomPlayers = sendToggleRandomPlayers
Network.sendKickPlayer = sendKickPlayer
Network.isOnline = isOnline
Network.sendPlayerReady = sendPlayerReady
Network.pauseReadFromBuffer = pauseReadFromBuffer
Network.sendStartTyping = sendStartTyping
Network.sendStopTyping = sendStopTyping
Network.sendChatMessage = sendChatMessage
return Network
