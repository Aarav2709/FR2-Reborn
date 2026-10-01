-- Shared helpers for map tile behaviors (hazards, bounce pads, cannons...).
local composer = require("composer")
local physics = require("physics")

local M = {}

local physicsSheets = {}

function M.getTheme(block)
  local theme = composer.data and composer.data.currentLevelTheme
  return theme or (block and block.theme) or "forest"
end

function M.frameIndex(sheetInfo, frameName)
  if sheetInfo and sheetInfo.getFrameIndex and frameName then
    return sheetInfo:getFrameIndex(frameName)
  end
  return nil
end

local function getSpecialPhysics(block)
  local theme = M.getTheme(block)
  local scale = block.scale or 1
  local key = theme .. ":" .. scale
  if physicsSheets[key] == nil then
    local ok, module = pcall(require, "lua.map.assets.physics." .. theme .. "_special")
    if ok and type(module) == "table" and module.physicsData then
      physicsSheets[key] = module.physicsData(scale)
    else
      physicsSheets[key] = false
    end
  end
  return physicsSheets[key] or nil
end

local function copyFixture(fixture)
  local copy = {}
  for k, v in pairs(fixture) do
    if type(v) == "table" then
      local inner = {}
      for ik, iv in pairs(v) do
        inner[ik] = iv
      end
      copy[k] = inner
    else
      copy[k] = v
    end
  end
  return copy
end

-- Returns fresh copies of the first physics body found among the given names,
-- or nil when the current theme has none of them.
function M.getBodies(block, ...)
  local sheet = getSpecialPhysics(block)
  if not sheet or not sheet.data then
    return nil
  end
  for i = 1, select("#", ...) do
    local name = select(i, ...)
    local fixtures = name and sheet.data[name]
    if fixtures and #fixtures > 0 then
      local copies = {}
      for f = 1, #fixtures do
        copies[f] = copyFixture(fixtures[f])
      end
      return copies
    end
  end
  return nil
end

-- Adds a static obstacle body. Fixtures are passed as a vararg so no trailing
-- nil arguments reach physics.addBody (which rejects them).
function M.addStaticBody(object, fixtures, isSensor)
  for i = 1, #fixtures do
    fixtures[i].filter = obstacleFilter
    if isSensor ~= nil then
      fixtures[i].isSensor = isSensor
    end
  end
  physics.addBody(object, "static", unpack(fixtures))
  object.isFixedRotation = true
end

-- Lets the tile culler show the object only while it is near the camera.
function M.registerAnimatedTile(block, object)
  if composer.culler and composer.culler.addAnimatedTile then
    composer.culler.addAnimatedTile(block.x, object)
  end
end

function M.isOnScreen(x, y)
  if composer.isOnScreen then
    return composer.isOnScreen(x, y)
  end
  return true
end

-- Fun Run 2 animated its traps by a fixed step every frame at 30 fps. This returns a
-- function that, given an enterFrame event, says how many of those 30 fps frames have
-- passed since its last call (capped, so a culled object doesn't jump ahead).
function M.newFrameClock()
  local lastTime
  return function(event)
    local now = event and event.time or system.getTimer()
    local steps = lastTime and (now - lastTime) / (1000 / 30) or 1
    lastTime = now
    return math.min(steps, 3)
  end
end

function M.removeObject(object)
  if object and object.removeSelf then
    object:removeSelf()
  end
end

function M.reset()
  physicsSheets = {}
end

return M
