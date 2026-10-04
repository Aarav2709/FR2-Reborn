local composer = require("composer")
local screen = require("lua.modules.screen")
local discovery = require("lua.modules.lanDiscovery")
local scene = composer.newScene()

function scene:create()
  local group = self.view
  screen.update()
  local box = screen.designBox(480, 320)
  local scale = box.scale
  local root = display.newGroup()
  root.xScale, root.yScale = scale, scale
  root.x, root.y = box.left, box.top
  local shade = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  shade:setFillColor(0, 0, 0, 0.62)
  shade:addEventListener("touch", function() return true end)
  group:insert(root)

  local panel = display.newImageRect(root, "images/gui/ranking/mainOverlay.png", 380, 286)
  panel.x, panel.y = 240, 160
  local title = composer.newText({ string = "Nearby Friends", x = 240, y = 42, size = 24, color = { 1, 1, 1 } })
  root:insert(title)
  local status = composer.newText({ string = "Searching your local network", x = 240, y = 72, size = 12, color = { 0.28, 0.17, 0.08 } })
  root:insert(status)
  local rows = display.newGroup()
  root:insert(rows)
  local refreshTimer

  local function clearRows()
    for i = rows.numChildren, 1, -1 do
      display.remove(rows[i])
    end
  end

  local function refresh()
    if not rows or not rows.removeSelf then
      return
    end
    clearRows()
    if not discovery.isEnabled() then
      status.text = "Enable LAN Friends in Settings to appear here"
      return
    end
    local peers = discovery.getPeers()
    local invites = discovery.getInvitations()
    if #peers == 0 and #invites == 0 then
      status.text = "No nearby players found"
    else
      status.text = "Players on the same local network"
    end
    local y = 104
    for i = 1, math.min(#peers, 4) do
      local peer = peers[i]
      local name = composer.newText({ string = peer.name .. "  " .. peer.address, x = 157, y = y, size = 12, ax = 0, color = { 0.28, 0.17, 0.08 } })
      rows:insert(name)
      local button = composer.newButton({
        image = "images/gui/common/buttonTextA.png",
        text = { string = peer.inviteAccepted and "Accepted" or "Invite", size = 11 },
        width = 76,
        height = 28,
        x = 337,
        y = y,
        onRelease = function()
          local ok, err = discovery.sendInvite(peer)
          status.text = ok and ("Invitation sent to " .. peer.name) or (err or "Could not send invitation")
        end
      })
      rows:insert(button)
      y = y + 34
    end
    for i = 1, math.min(#invites, 2) do
      local invite = invites[i]
      local name = composer.newText({ string = invite.name .. " invited you", x = 157, y = y, size = 12, ax = 0, color = { 0.28, 0.17, 0.08 } })
      rows:insert(name)
      local button = composer.newButton({
        image = "images/gui/common/buttonTextA.png",
        text = { string = "Accept", size = 11 },
        width = 76,
        height = 28,
        x = 337,
        y = y,
        onRelease = function()
          discovery.acceptInvite(invite.id)
          status.text = "Invitation accepted"
        end
      })
      rows:insert(button)
      y = y + 34
    end
  end

  local function close()
    composer.hideOverlay()
  end
  local closeButton = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    width = 36,
    height = 34,
    x = 411,
    y = 30,
    onRelease = close
  })
  root:insert(closeButton)
  refresh()

  local function startNearby()
    local started, startError = discovery.start()
    refresh()
    if not started then
      status.text = startError or "Enable LAN Friends in Settings to appear here"
    end
    if not refreshTimer then
      refreshTimer = timer.performWithDelay(1200, refresh, 0)
    end
  end
  local function stopNearby()
    if refreshTimer then
      timer.cancel(refreshTimer)
      refreshTimer = nil
    end
    discovery.stop()
  end
  self.startNearby = startNearby
  self.stopNearby = stopNearby
  function self.clean()
    stopNearby()
    display.remove(rows)
    display.remove(closeButton)
    display.remove(status)
    display.remove(title)
  end
end

function scene:show(event)
  if event.phase == "did" then
    require("lua.modules.androidBackButton").isOverlay(true)
    if self.startNearby then
      self.startNearby()
    end
    composer.bouncer.down(self.view)
  end
end

function scene:hide(event)
  if event.phase == "will" then
    require("lua.modules.androidBackButton").isOverlay(false)
    if self.stopNearby then
      self.stopNearby()
    end
  end
end

function scene:destroy()
  if self.clean then
    self.clean()
    self.clean = nil
  end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene
