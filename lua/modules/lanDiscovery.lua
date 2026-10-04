local socket = require("socket")
local json = require("json")
local composer = require("composer")
local M = {}

local PORT = 48828
local SIGNATURE = "fr2-reborn-lan-1"
local EXPIRE_AFTER = 8
local udp
local pollTimer
local sessionId = tostring(system.getTimer()) .. "-" .. tostring(math.random(100000, 999999))
local peers = {}
local invitations = {}

local function allowed()
  return composer.database.getValue("lan_friends_enabled") == "1"
end

local function send(packet, address, port)
  if not udp then
    return false
  end
  packet.signature = SIGNATURE
  packet.id = sessionId
  packet.name = (composer.database.getPlayerInformation() or {}).username or "Player"
  local ok, encoded = pcall(json.encode, packet)
  if not ok or not encoded then
    return false
  end
  local ok, sent = pcall(udp.sendto, udp, encoded, address, port or PORT)
  return ok and sent ~= nil
end

local function poll()
  if not udp then
    return
  end
  if allowed() then
    send({ kind = "hello" }, "255.255.255.255", PORT)
  end
  while true do
    local data, address, port = udp:receivefrom()
    if not data then
      break
    end
    local ok, packet = pcall(json.decode, data)
    if ok and type(packet) == "table" and packet.signature == SIGNATURE and packet.id ~= sessionId then
      if packet.kind == "hello" then
        peers[packet.id] = {
          id = packet.id,
          name = tostring(packet.name or "Player"),
          address = address,
          port = port or PORT,
          lastSeen = system.getTimer()
        }
      elseif packet.kind == "invite" then
        invitations[packet.id] = {
          id = packet.id,
          name = tostring(packet.name or "Player"),
          address = address,
          port = port or PORT,
          lastSeen = system.getTimer()
        }
      elseif packet.kind == "accepted" then
        local peer = peers[packet.id]
        if peer then
          peer.inviteAccepted = true
        end
      end
    end
  end
  local now = system.getTimer()
  for id, peer in pairs(peers) do
    if now - peer.lastSeen > EXPIRE_AFTER * 1000 then
      peers[id] = nil
    end
  end
  for id, invite in pairs(invitations) do
    if now - invite.lastSeen > EXPIRE_AFTER * 1000 then
      invitations[id] = nil
    end
  end
end

function M.start()
  if not allowed() then
    M.stop()
    return false, "LAN friends are disabled"
  end
  if udp then
    return true
  end
  udp = socket.udp()
  if not udp then
    return false, "Could not open a local network socket"
  end
  udp:settimeout(0)
  pcall(function() udp:setoption("reuseaddr", true) end)
  pcall(function() udp:setoption("broadcast", true) end)
  local bound, err = udp:setsockname("*", PORT)
  if not bound then
    udp:close()
    udp = nil
    return false, err or "Could not listen for nearby players"
  end
  poll()
  pollTimer = timer.performWithDelay(1000, poll, 0)
  return true
end

function M.stop()
  if pollTimer then
    timer.cancel(pollTimer)
    pollTimer = nil
  end
  if udp then
    udp:close()
    udp = nil
  end
  peers = {}
  invitations = {}
end

function M.getPeers()
  local result = {}
  for _, peer in pairs(peers) do
    result[#result + 1] = peer
  end
  table.sort(result, function(a, b)
    return a.name:lower() < b.name:lower()
  end)
  return result
end

function M.getInvitations()
  local result = {}
  for _, invitation in pairs(invitations) do
    result[#result + 1] = invitation
  end
  table.sort(result, function(a, b)
    return a.name:lower() < b.name:lower()
  end)
  return result
end

function M.sendInvite(peer)
  if not allowed() then
    return false, "Turn on LAN Friends in Settings first"
  end
  if not peer or not peer.address then
    return false, "That player is no longer nearby"
  end
  return send({ kind = "invite" }, peer.address, peer.port)
end

function M.acceptInvite(id)
  local invitation = invitations[id]
  if not invitation then
    return false
  end
  local sent = send({ kind = "accepted" }, invitation.address, invitation.port)
  invitations[id] = nil
  return sent
end

function M.isEnabled()
  return allowed()
end

return M
