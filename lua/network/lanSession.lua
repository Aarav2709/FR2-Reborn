-- local network play
local composer = require("composer")
local json = require("json")
local lanNet = require("lua.network.lanNet")
local M = {}

M.GAME_TYPE = 5
M.MAX_PLAYERS = 4
M.VERSION = 1

local START_DELAY = 6500
local HEARTBEAT_INTERVAL = 2000
local ANNOUNCE_INTERVAL = 1000
local POLL_INTERVAL = 15
local STRAGGLER_TIME = 45000
local RESULTS_DELAY = 1500
local PING_INTERVAL_FAST, PING_INTERVAL = 300, 3000
local FAST_PINGS = 8

local MSG = {
  REMOVE_OBJECT = "4",
  START_RACE = "6",
  RACE_FINISHED = "7",
  PLAYER_JUMPED = "9",
  PLAYER_USED_POWERUP = "11",
  SET_PLAYER_DEAD = "13",
  PLAYER_FINISHED = "15",
  CORRIGATE_POSITION = "18",
  CHAT = "35",
  HEARTBEAT = "38"
}
local CLIENT = { JUMP = 1, POWERUP = 2, CORRIGATE_POSITION = 3, POWERUP_HIT = 9, HEARTBEAT = 19 }

M.net = lanNet

local session
local listener

local function notify(event)
  if listener then
    listener(event)
  end
end

function M.setListener(newListener)
  listener = newListener
end

local function myInfo()
  local info = composer.database.getPlayerInformation() or {}
  return {
    name = tostring(info.username or "Player"),
    avatar = composer.database.getAvatarData(),
    customPowerUps = composer.database.getPowerupSkin(),
    backwear = composer.database.getBackwear and composer.database.getBackwear() or 0
  }
end

function M.hostClock()
  if session and session.role == "client" then
    return system.getTimer() + (session.clockOffset or 0)
  end
  return system.getTimer()
end

local function lobbyMessage()
  local players = {}
  for i, player in ipairs(session.players) do
    players[i] = { id = player.id, name = player.name, avatar = player.avatar, backwear = player.backwear }
  end
  return { kind = "lobby", players = players, map = session.mapId, hostName = session.players[1] and session.players[1].name }
end

local function sendToClients(message, exceptId)
  for _, connection in ipairs(session.connections) do
    if connection.playerId and connection.playerId ~= exceptId and not connection.closed then
      connection:send(message)
    end
  end
end

local function deliverLocally(message)
  if session.receive then
    local ok, err = pcall(session.receive, message)
    if not ok then
    end
  end
end

local function relay(message, exceptId)
  sendToClients(message, exceptId)
  if session.selfId ~= exceptId then
    deliverLocally(message)
  end
end

local function broadcastLobby()
  sendToClients(lobbyMessage())
  notify({ type = "lobby" })
end

local function cancelTimer(name)
  if session and session[name] then
    timer.cancel(session[name])
    session[name] = nil
  end
end

local function beginRace(roster, mapId, startAt)
  local players = {}
  for i, racer in ipairs(roster) do
    players[i] = {
      username = racer.name,
      avatar = composer.monsterConverter.toServerFormat(racer.avatar or { 101, 0, 0, 0, 0, 0, 0 }),
      playerId = racer.id,
      customPowerUps = racer.customPowerUps,
      backwear = racer.backwear or 0
    }
  end
  local gameInfo = composer.data.gameInfo
  gameInfo.players = players
  gameInfo.gameType = M.GAME_TYPE
  gameInfo.ranked = false
  gameInfo.teamMode = nil
  gameInfo.map = mapId
  gameInfo.lanPlayerId = session.selfId
  gameInfo.timeToStartGame = system.getTimer() + (startAt - M.hostClock())
  function composer.serverClock()
    return math.round(M.hostClock())
  end
  if composer.tcpClient ~= M.raceClient then
    session.savedTcpClient = composer.tcpClient
    composer.tcpClient = M.raceClient
  end
  session.phase = "racing"
  session.receive = nil
  notify({ type = "start" })
  local current = composer.getSceneName("current")
  composer.gotoScene("lua.scenes.gamePlay")
  if current and current ~= "lua.scenes.gamePlay" then
    composer.removeScene(current)
  end
end

local function finishRace()
  local race = session.race
  if not race or race.done then
    return
  end
  race.done = true
  cancelTimer("stragglerTimer")
  cancelTimer("heartbeatTimer")
  session.resultsTimer = timer.performWithDelay(RESULTS_DELAY, function()
    session.resultsTimer = nil
    relay({ MSG.RACE_FINISHED, { practice = true, lan = true } })
    session.phase = "lobby"
    session.race = nil
  end)
end

local function checkAllHome()
  local race = session.race
  for index = 1, #race.order do
    if not race.finished[index] and not race.out[index] then
      return
    end
  end
  finishRace()
end

local function playerFinished(index, time)
  local race = session.race
  if race.finished[index] or race.out[index] or race.done then
    return
  end
  race.finished[index] = math.max(1, math.floor(time + 0.5))
  relay({ MSG.PLAYER_FINISHED, index, "", race.finished[index] })
  if not session.stragglerTimer then
    session.stragglerTimer = timer.performWithDelay(STRAGGLER_TIME, function()
      session.stragglerTimer = nil
      local late = M.hostClock() - race.startAt
      for i = 1, #race.order do
        if not race.finished[i] and not race.out[i] then
          late = late + 1000
          playerFinished(i, late)
        end
      end
      finishRace()
    end)
  end
  checkAllHome()
end

local function checkFinish(index, x, time)
  local race = session.race
  local goalX = race.goalX
  if not goalX then
    local ok, mapInterface = pcall(require, "lua.map.interface")
    goalX = ok and mapInterface.getGoal and mapInterface.getGoal()
    race.goalX = goalX
  end
  if goalX and tonumber(x) and tonumber(x) > goalX then
    playerFinished(index, (tonumber(time) or M.hostClock()) - race.startAt)
  end
end

local function onRaceMessage(fromId, data)
  local race = session.race
  if not race or type(data) ~= "table" then
    return
  end
  local index = race.indexOf[fromId]
  if not index or race.out[index] then
    return
  end
  local kind = tonumber(data[1])
  if kind == CLIENT.JUMP then
    relay({ MSG.PLAYER_JUMPED, index, data[2], data[3], data[4], data[5], data[6] }, fromId)
    checkFinish(index, data[3], data[2])
  elseif kind == CLIENT.POWERUP then
    relay({ MSG.PLAYER_USED_POWERUP, index, data[2], data[3], data[4], data[5] }, fromId)
  elseif kind == CLIENT.CORRIGATE_POSITION then
    relay({ MSG.CORRIGATE_POSITION, index, data[3], data[4], data[5], data[6] }, fromId)
    checkFinish(index, data[3], data[2])
  elseif kind == CLIENT.POWERUP_HIT then
    relay({ MSG.SET_PLAYER_DEAD, index, data[2], data[3], data[4], data[5], data[6] }, fromId)
  end
end

local function playerLeftRace(id)
  local race = session.race
  local index = race and race.indexOf[id]
  if not index or race.out[index] then
    return
  end
  race.out[index] = true
  relay({ MSG.REMOVE_OBJECT, index }, id)
  checkAllHome()
end

local function removePlayer(id)
  for i = #session.players, 1, -1 do
    if session.players[i].id == id then
      table.remove(session.players, i)
    end
  end
end

local function dropConnection(connection, reason)
  connection:close()
  for i = #session.connections, 1, -1 do
    if session.connections[i] == connection then
      table.remove(session.connections, i)
    end
  end
  if connection.playerId then
    if session.race then
      playerLeftRace(connection.playerId)
    end
    removePlayer(connection.playerId)
    if session.phase == "lobby" then
      broadcastLobby()
    else
      notify({ type = "lobby" })
    end
  end
end

local function onHostMessage(connection, message)
  if type(message) ~= "table" then
    return
  end
  if message.kind == nil then
    if connection.playerId then
      onRaceMessage(connection.playerId, message)
    end
  elseif message.kind == "join" then
    if connection.playerId then
      return
    end
    local refusal
    if tonumber(message.version) ~= M.VERSION then
      refusal = "version"
    elseif session.phase ~= "lobby" then
      refusal = "racing"
    elseif #session.players >= M.MAX_PLAYERS then
      refusal = "full"
    end
    if refusal then
      connection:send({ kind = "refused", reason = refusal })
      connection.refused = true
      return
    end
    session.nextId = session.nextId + 1
    local id = "p" .. session.nextId
    connection.playerId = id
    session.players[#session.players + 1] = {
      id = id,
      name = tostring(message.name or "Player"):sub(1, 24),
      avatar = type(message.avatar) == "table" and message.avatar or nil,
      customPowerUps = type(message.customPowerUps) == "table" and message.customPowerUps or nil,
      backwear = tonumber(message.backwear) or 0
    }
    connection:send({ kind = "welcome", id = id })
    broadcastLobby()
  elseif message.kind == "leave" then
    dropConnection(connection, "left")
  elseif message.kind == "ping" then
    connection:send({ kind = "pong", t = message.t, host = M.hostClock() })
  elseif message.kind == "chat" and connection.playerId then
    relay({ MSG.CHAT, connection.playerId, tonumber(message.chat) or 1 }, connection.playerId)
  end
end

local function pollHost()
  local server = session.server
  while true do
    local connection = server.accept()
    if not connection then
      break
    end
    session.connections[#session.connections + 1] = connection
  end
  local connections = {}
  for i, connection in ipairs(session.connections) do
    connections[i] = connection
  end
  for _, connection in ipairs(connections) do
    if not connection.closed and not connection.refused then
      connection:receive(function(message)
        onHostMessage(connection, message)
      end)
    end
  end
  for i = #session.connections, 1, -1 do
    local connection = session.connections[i]
    if connection and (connection.closed or connection.refused) then
      if connection.refused then
        connection:flush()
      end
      dropConnection(connection, "closed")
    end
  end
  local now = system.getTimer()
  if session.discovery and session.phase == "lobby" and now >= (session.nextAnnounce or 0) then
    session.nextAnnounce = now + ANNOUNCE_INTERVAL
    session.discovery.announce({ kind = "game", name = session.players[1].name, players = #session.players,
      max = M.MAX_PLAYERS, port = session.port, version = M.VERSION })
  end
end

local function onClientMessage(message)
  if type(message) ~= "table" then
    return
  end
  if message.kind == nil then
    deliverLocally(message)
  elseif message.kind == "welcome" then
    session.selfId = message.id
    session.joined = true
    notify({ type = "lobby" })
  elseif message.kind == "refused" then
    M.leave(message.reason or "refused")
  elseif message.kind == "lobby" then
    session.players = message.players or {}
    session.mapId = tonumber(message.map) or 0
    session.hostName = message.hostName
    notify({ type = "lobby" })
  elseif message.kind == "pong" then
    local now = system.getTimer()
    local sent = tonumber(message.t)
    if sent and tonumber(message.host) then
      local roundTrip = now - sent
      if not session.bestRoundTrip or roundTrip <= session.bestRoundTrip then
        session.bestRoundTrip = roundTrip
        session.clockOffset = tonumber(message.host) + roundTrip * 0.5 - now
      end
    end
  elseif message.kind == "start" then
    beginRace(message.players or {}, tonumber(message.map) or 1, tonumber(message.startAt) or M.hostClock())
  elseif message.kind == "closed" then
    M.leave(message.reason or "closed")
  end
end

local function pollClient()
  local connection = session.connection
  connection:receive(onClientMessage)
  if not session then
    return
  end
  if connection.closed then
    M.leave(session.joined and "lost" or "unreachable")
    return
  end
  if not session.joinSent and not connection.connecting then
    session.joinSent = true
    local me = myInfo()
    connection:send({ kind = "join", version = M.VERSION, name = me.name, avatar = me.avatar,
      customPowerUps = me.customPowerUps, backwear = me.backwear })
  end
  local now = system.getTimer()
  if session.joined and now >= (session.nextPing or 0) then
    session.pings = (session.pings or 0) + 1
    session.nextPing = now + (session.pings < FAST_PINGS and PING_INTERVAL_FAST or PING_INTERVAL)
    connection:send({ kind = "ping", t = now })
  end
end

local function poll()
  if not session then
    return
  end
  if session.role == "host" then
    pollHost()
  else
    pollClient()
  end
end

local function newSession(role)
  session = { role = role, players = {}, connections = {}, mapId = 0, phase = "lobby", nextId = 1 }
  session.pollTimer = timer.performWithDelay(POLL_INTERVAL, poll, 0)
  return session
end

function M.host(port)
  M.leave()
  local server, err = M.net.listen(port)
  if not server then
    return false, err
  end
  newSession("host")
  session.server = server
  session.port = port or M.net.GAME_PORT
  session.discovery = M.net.discovery(false)
  session.selfId = "p1"
  session.joined = true
  local me = myInfo()
  session.players[1] = { id = "p1", name = me.name, avatar = me.avatar, customPowerUps = me.customPowerUps,
    backwear = me.backwear }
  notify({ type = "lobby" })
  return true
end

function M.join(address, port)
  M.leave()
  local connection, err = M.net.connect(address, port)
  if not connection then
    return false, err
  end
  newSession("client")
  session.connection = connection
  session.address = address
  return true
end

function M.leave(reason)
  if not session then
    return
  end
  local old = session
  session = nil
  if old.pollTimer then
    timer.cancel(old.pollTimer)
  end
  for _, name in ipairs({ "stragglerTimer", "heartbeatTimer", "resultsTimer", "startRaceTimer" }) do
    if old[name] then
      timer.cancel(old[name])
    end
  end
  if old.role == "host" then
    for _, connection in ipairs(old.connections) do
      connection:send({ kind = "closed", reason = "host left" })
      connection:flush()
      connection:close()
    end
    if old.server then
      old.server.close()
    end
    if old.discovery then
      old.discovery.close()
    end
  elseif old.connection then
    if not old.connection.closed then
      old.connection:send({ kind = "leave" })
      old.connection:flush()
    end
    old.connection:close()
  end
  if old.savedTcpClient and composer.tcpClient == M.raceClient then
    composer.tcpClient = old.savedTcpClient
  end
  if not reason then
    return
  end
  local current = composer.getSceneName("current")
  if current == "lua.scenes.gamePlay" or current == "lua.scenes.postLobby" then
    composer.createCustomOverlay(reason == "host left" and 7 or 19)
    composer.gotoScene("lua.scenes.mainMenu")
    composer.removeScene(current)
  else
    notify({ type = "closed", reason = reason })
  end
end

function M.isActive()
  return session ~= nil
end

function M.isHost()
  return session ~= nil and session.role == "host"
end

function M.isJoined()
  return session ~= nil and session.joined == true
end

function M.isRacing()
  return session ~= nil and session.phase == "racing"
end

function M.getLobby()
  if not session then
    return nil
  end
  return { players = session.players, map = session.mapId, isHost = session.role == "host", selfId = session.selfId,
    hostName = session.hostName or (session.players[1] and session.players[1].name), address = session.address,
    joined = session.joined }
end

function M.setMap(mapId)
  if M.isHost() and session.phase == "lobby" then
    session.mapId = tonumber(mapId) or 0
    broadcastLobby()
  end
end

function M.startRace()
  if not M.isHost() or session.phase ~= "lobby" or #session.players < 2 then
    return false
  end
  local roster = {}
  for i, player in ipairs(session.players) do
    roster[i] = player
  end
  for i = #roster, 2, -1 do
    local j = math.random(1, i)
    roster[i], roster[j] = roster[j], roster[i]
  end
  local mapId = session.mapId
  if not mapId or mapId == 0 then
    local maps = {}
    local count = composer.mapHandler.getNumberOfMaps()
    for id = 1, (count > 0 and count or 30) do
      if composer.data.getMapInfo(id) then
        maps[#maps + 1] = id
      end
    end
    mapId = maps[math.random(1, math.max(1, #maps))] or 1
  end
  local startAt = math.floor(M.hostClock() + START_DELAY + 0.5)
  local race = { order = {}, indexOf = {}, finished = {}, out = {}, startAt = startAt }
  for i, racer in ipairs(roster) do
    race.order[i] = racer.id
    race.indexOf[racer.id] = i
  end
  session.race = race
  sendToClients({ kind = "start", players = roster, map = mapId, startAt = startAt })
  session.startRaceTimer = timer.performWithDelay(START_DELAY, function()
    session.startRaceTimer = nil
    relay({ MSG.START_RACE })
  end)
  session.heartbeatTimer = timer.performWithDelay(HEARTBEAT_INTERVAL, function()
    relay({ MSG.HEARTBEAT })
  end, 0)
  beginRace(roster, mapId, startAt)
  return true
end

function M.sendChat(chatId)
  if not session then
    return
  end
  if session.role == "host" then
    sendToClients({ MSG.CHAT, session.selfId, chatId })
  elseif session.connection then
    session.connection:send({ kind = "chat", chat = chatId })
  end
end

local browser

function M.startBrowsing()
  if not browser then
    browser = M.net.discovery(true)
  end
  return browser ~= nil
end

function M.stopBrowsing()
  if browser then
    browser.close()
    browser = nil
  end
end

function M.games()
  return browser and browser.poll() or {}
end

function M.localAddress()
  return M.net.localAddress()
end

local function round(value)
  return math.round(tonumber(value) or 0)
end

local function sendRace(message)
  if not session then
    return
  end
  if session.role == "host" then
    onRaceMessage(session.selfId, message)
  elseif session.connection then
    session.connection:send(message)
  end
end

M.raceClient = {}
local raceClient = M.raceClient

function raceClient.setReceiveFunction(receiveFunction)
  if session then
    session.receive = receiveFunction
  end
end

function raceClient.startTCP(receiveFunction)
  raceClient.setReceiveFunction(receiveFunction)
  return true
end

function raceClient.sendJumpMessage(x, y, vx, vy)
  sendRace({ CLIENT.JUMP, round(M.hostClock()), round(x), round(y), round(vx), round(vy) })
end

function raceClient.sendPowerUpMessage(powerUpType, x, y, vx, vy, puNumber)
  sendRace({ CLIENT.POWERUP, round(M.hostClock()), powerUpType, round(x), round(y), round(vx), round(vy), puNumber or 0 })
end

function raceClient.sendCorrigateMessage(x, y, vx, vy)
  sendRace({ CLIENT.CORRIGATE_POSITION, round(M.hostClock()), round(x), round(y), round(vx), round(vy) })
end

function raceClient.sendPlayerHitByPowerUp(killerId, powerUpType, puNumber, hitType, respawnTime)
  sendRace({ CLIENT.POWERUP_HIT, round(M.hostClock() + (respawnTime or 0)), killerId, powerUpType, puNumber or 0, hitType })
end

function raceClient.sendMinimizedMessage(text)
  local ok, message = pcall(json.decode, text)
  if ok and type(message) == "table" and tonumber(message[1]) ~= CLIENT.HEARTBEAT then
    sendRace(message)
  end
end

function raceClient.sendChatMessage(chatId)
  M.sendChat(chatId)
end

function raceClient.stopTCPClient()
  M.leave()
end

function raceClient.isOnline()
  return M.isJoined()
end

local function nothing()
end
raceClient.sendPowerBoxMessage = nothing
raceClient.sendMessage = nothing
raceClient.sendPlayerReachedGoal = nothing
raceClient.sendStartGame = nothing
raceClient.sendRejoinGame = nothing
raceClient.sendMapSelected = nothing
raceClient.sendToggleRandomPlayers = nothing
raceClient.sendKickPlayer = nothing
raceClient.sendPlayerReady = nothing
raceClient.pauseReadFromBuffer = nothing
raceClient.sendStartTyping = nothing
raceClient.sendStopTyping = nothing

return M
