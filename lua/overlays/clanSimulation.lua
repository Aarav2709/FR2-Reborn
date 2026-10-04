local composer = require("composer")
local screen = require("lua.modules.screen")
local scene = composer.newScene()

local function makeText(parent, text, x, y, size, color)
  local label = composer.newText({ string = text, x = x, y = y, size = size, color = color or { 0.25, 0.16, 0.09 } })
  parent:insert(label)
  return label
end

function scene:create()
  local group = self.view
  screen.update()
  local design = screen.designBox(480, 320)
  local scale = design.scale
  local root = display.newGroup()
  root.xScale, root.yScale = scale, scale
  root.x, root.y = design.left, design.top
  local shade = display.newRect(group, screen.centerX, screen.centerY, screen.width + 4, screen.height + 4)
  shade:setFillColor(0, 0, 0, 0.62)
  shade:addEventListener("touch", function() return true end)
  group:insert(root)
  local panel = display.newImageRect(root, "images/gui/ranking/mainOverlay.png", 360, 280)
  panel.x, panel.y = 240, 160
  local brown = { 0.28, 0.17, 0.08 }
  makeText(root, "Clan Simulation", 240, 54, 24, { 1, 1, 1 })

  local state = composer.database.getTable("clan_simulation") or {
    name = "Forest Runners",
    points = 0,
    level = 1,
    members = 4
  }
  state.points = tonumber(state.points) or 0
  state.level = tonumber(state.level) or 1
  local clanName = makeText(root, state.name or "Forest Runners", 240, 98, 20, brown)
  local levelText = makeText(root, "Level " .. state.level .. "   Clan points " .. state.points, 240, 128, 13, brown)
  makeText(root, "Local simulation saved on this device", 240, 149, 11, brown)
  makeText(root, "Roster", 240, 177, 15, brown)
  makeText(root, "You   Maple   Bramble   Pip", 240, 199, 13, brown)

  local function saveProgress()
    state.level = math.floor(state.points / 100) + 1
    composer.database.setTable("clan_simulation", state)
    levelText.text = "Level " .. state.level .. "   Clan points " .. state.points
  end

  local contribute = composer.newButton({
    image = "images/gui/common/buttonTextA.png",
    text = { string = "Contribute 25 points", size = 15 },
    width = 170,
    height = 42,
    x = 240,
    y = 240,
    onRelease = function()
      state.points = state.points + 25
      saveProgress()
    end
  })
  root:insert(contribute)

  local close = composer.newButton({
    image = "images/gui/common/buttonClosePopup.png",
    width = 36,
    height = 34,
    x = 383,
    y = 42,
    onRelease = function()
      composer.hideOverlay()
    end
  })
  root:insert(close)

  function self.clean()
    display.remove(clanName)
    display.remove(levelText)
    display.remove(contribute)
    display.remove(close)
  end
end

function scene:show(event)
  if event.phase == "did" then
    require("lua.modules.androidBackButton").isOverlay(true)
    composer.bouncer.down(self.view)
  end
end

function scene:hide(event)
  if event.phase == "will" then
    require("lua.modules.androidBackButton").isOverlay(false)
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
