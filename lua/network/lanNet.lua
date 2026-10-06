-- local network play, the wires
local socket = require("socket")
local json = require("json")
local M = {}

M.GAME_PORT = 48829
M.DISCOVERY_PORT = 48828
M.SIGNATURE = "fr2-reborn-lan-2"
M.CONNECT_TIMEOUT = 4000

local Connection = {}
Connection.__index = Connection

local function newConnection(sock, connecting)
  sock:settimeout(0)
  pcall(sock.setoption, sock, "tcp-nodelay", true)
  return setmetatable({ sock = sock, pending = "", outgoing = "", closed = false, connecting = connecting,
    startedAt = system.getTimer() }, Connection)
end

function Connection:close()
  if not self.closed then
    self.closed = true
    pcall(self.sock.close, self.sock)
  end
end

function Connection:flush()
  while not self.closed and not self.connecting and #self.outgoing > 0 do
    local sent, err, lastSent = self.sock:send(self.outgoing)
    if sent then
      self.outgoing = self.outgoing:sub(sent + 1)
    elseif err == "timeout" then
      self.outgoing = self.outgoing:sub((lastSent or 0) + 1)
      return
    else
      self:close()
      return
    end
  end
end

function Connection:send(message)
  if self.closed then
    return false
  end
  local line = message
  if type(message) ~= "string" then
    local ok, encoded = pcall(json.encode, message)
    if not ok or not encoded then
      return false
    end
    line = encoded
  end
  self.outgoing = self.outgoing .. line .. "\n"
  self:flush()
  return true
end

function Connection:checkConnected()
  if not self.connecting or self.closed then
    return not self.closed and not self.connecting
  end
  local _, writable = socket.select(nil, { self.sock }, 0)
  if writable and writable[1] then
    if self.sock:getpeername() then
      self.connecting = false
      self:flush()
      return true
    end
    self:close()
    return false
  end
  if system.getTimer() - self.startedAt > M.CONNECT_TIMEOUT then
    self:close()
  end
  return false
end

function Connection:receive(handler)
  if self.connecting and not self:checkConnected() then
    return
  end
  while not self.closed do
    local line, err, partial = self.sock:receive("*l", self.pending)
    if line then
      self.pending = ""
      local ok, message = pcall(json.decode, line)
      if ok and message ~= nil then
        handler(message, line)
      end
    elseif err == "timeout" then
      self.pending = partial or ""
      self:flush()
      return
    else
      self:close()
      return
    end
  end
end

function M.listen(port)
  local server, err = socket.bind("*", port or M.GAME_PORT)
  if not server then
    return nil, err
  end
  server:settimeout(0)
  return {
    accept = function()
      local client = server:accept()
      if client then
        return newConnection(client, false)
      end
    end,
    close = function()
      pcall(server.close, server)
    end
  }
end

function M.connect(address, port)
  local sock = socket.tcp()
  if not sock then
    return nil, "no socket"
  end
  sock:settimeout(0)
  local ok, err = sock:connect(address, port or M.GAME_PORT)
  if not ok and err ~= "timeout" and err ~= "Operation already in progress" then
    pcall(sock.close, sock)
    return nil, err
  end
  local connection = newConnection(sock, true)
  if ok then
    connection.connecting = false
  end
  return connection
end

function M.discovery(listen)
  local udp = socket.udp()
  if not udp then
    return nil
  end
  udp:settimeout(0)
  pcall(udp.setoption, udp, "reuseaddr", true)
  pcall(udp.setoption, udp, "broadcast", true)
  if listen then
    local bound = udp:setsockname("*", M.DISCOVERY_PORT)
    if not bound then
      -- another game on this device has the port: still announce, just don't listen.
      pcall(udp.close, udp)
      udp = socket.udp()
      udp:settimeout(0)
      pcall(udp.setoption, udp, "broadcast", true)
      listen = false
    end
  end
  local games = {}
  local discovery = {}
  local targets = { "255.255.255.255" }
  local ownAddress = M.localAddress()
  local subnet = ownAddress and ownAddress:match("^(%d+%.%d+%.%d+)%.%d+$")
  if subnet then
    targets[2] = subnet .. ".255"
  end

  function discovery.announce(info)
    info.signature = M.SIGNATURE
    local ok, encoded = pcall(json.encode, info)
    if ok and encoded then
      for _, target in ipairs(targets) do
        pcall(udp.sendto, udp, encoded, target, M.DISCOVERY_PORT)
      end
    end
  end

  function discovery.poll()
    if listen then
      while true do
        local data, address = udp:receivefrom()
        if not data then
          break
        end
        local ok, info = pcall(json.decode, data)
        if ok and type(info) == "table" and info.signature == M.SIGNATURE and info.kind == "game" then
          info.address = address
          info.seenAt = system.getTimer()
          games[address .. ":" .. tostring(info.port)] = info
        end
      end
    end
    local list = {}
    local now = system.getTimer()
    for key, info in pairs(games) do
      if now - info.seenAt > 4000 then
        games[key] = nil
      else
        list[#list + 1] = info
      end
    end
    table.sort(list, function(a, b)
      return tostring(a.name) < tostring(b.name)
    end)
    return list
  end

  function discovery.close()
    pcall(udp.close, udp)
  end

  return discovery
end

function M.localAddress()
  for _, probe in ipairs({ "8.8.8.8", "192.168.1.1", "10.0.0.1", "172.16.0.1" }) do
    local udp = socket.udp()
    if udp then
      local ok = pcall(udp.setpeername, udp, probe, 9)
      local address = ok and udp:getsockname()
      pcall(udp.close, udp)
      if type(address) == "string" and address ~= "0.0.0.0" and not address:find("^127%.") then
        return address
      end
    end
  end
  local ok, hostAddress = pcall(socket.dns.toip, socket.dns.gethostname() or "")
  if ok and type(hostAddress) == "string" and not hostAddress:find("^127%.") then
    return hostAddress
  end
  return nil
end

return M
