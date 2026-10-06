-- cannons (town / space)
local util = require("lua.map.behaviors.behaviorUtil")
local cannonEffectCreator = require("lua.game.effects.cannonEffect")

local M = {}

local COOLDOWN_MS = 1000

function M.addBehavior(block)
  local startFrame = util.frameIndex(block.animatedBlockSheetFile, "cannon1")
  if not startFrame then
    return
  end
  local frameCount = 1
  if util.getTheme(block) == "space" then
    frameCount = 8
  end
  local sprite = display.newSprite(block.displayGroup, block.animatedBlockSheet, {
    name = "collisionAnimation",
    start = startFrame,
    count = frameCount,
    time = 200,
    loopCount = 1,
    loopDirection = "bounce"
  })
  sprite.x = block.x
  sprite.y = block.y
  sprite:scale(block.scale, block.scale)
  util.registerAnimatedTile(block, sprite)

  local fixtures = util.getBodies(block, "cannon1", "cannon")
  if not fixtures then
    return
  end
  util.addStaticBody(sprite, fixtures)
  sprite.cannon = true

  local cleaned = false
  local lastShot = {}
  local shotTimers = {}
  local cannonEffect = cannonEffectCreator.new()
  block.displayGroup:insert(cannonEffect)
  cannonEffect.x = block.x + 105
  cannonEffect.y = block.y - 60

  local function play()
    if sprite and util.isOnScreen(block.x, block.y) then
      sprite:setSequence("collisionAnimation")
      sprite:play()
    end
  end

  local function onCollision(runner)
    if cleaned or not runner or not runner.id then
      return
    end
    local now = system.getTimer()
    if lastShot[runner.id] and now - lastShot[runner.id] < COOLDOWN_MS then
      return
    end
    lastShot[runner.id] = now
    shotTimers[runner.id] = timer.performWithDelay(10, function()
      shotTimers[runner.id] = nil
      if cleaned or not runner.cannonFunction then
        return
      end
      cannonEffect.playEffect()
      play()
      if runner.playSound then
        runner.playSound("cannon")
      end
      runner.cannonFunction(block)
    end)
  end

  local function clean()
    if cleaned then
      return
    end
    cleaned = true
    for id, handle in pairs(shotTimers) do
      timer.cancel(handle)
      shotTimers[id] = nil
    end
    if cannonEffect then
      cannonEffect.clean()
      cannonEffect = nil
    end
    util.removeObject(sprite)
    sprite = nil
  end

  block.behaviors.cannon = { clean = clean }
  sprite.onCollision = onCollision
end

return M
