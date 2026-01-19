local M = {}
local network = require("network")
local composer = require("composer")

local function checkStatus()
  local networkStatus = network.getConnectionStatus()
  if networkStatus.isConnected then
  end
  if networkStatus.isMobile then
    composer.wifiOn = false
  else
    composer.wifiOn = true
  end
end

M.checkStatus = checkStatus
return M
