local M = {}
local composer = require("composer")

local function new()
  local effectGroup = display.newGroup()
  local startedClean = false
  local timerRef
  local effectSequenceData = {
    name = "animate",
    start = 1,
    count = 8,
    time = 200,
    loopCount = 1
  }
  local effectSheetData = require("lua.game.effects.assetFiles.cannonEffect")
  local effectSheet = graphics.newImageSheet("images/map/effects/cannonEffect.png", effectSheetData:getSheet())
  local cannonEffect = display.newSprite(effectSheet, effectSequenceData)
  
  local function clean()
    if startedClean then
      return
    end
    startedClean = true
    if cannonEffect then
      cannonEffect:removeSelf()
      cannonEffect = nil
    end
    if timerRef then
      timer.cancel(timerRef)
      timerRef = nil
    end
  end
  
  local function hideEffect()
    if cannonEffect and not startedClean then
      cannonEffect.isVisible = false
    end
  end
  
  local function playEffect()
    cannonEffect.isVisible = true
    cannonEffect:setSequence("animate")
    cannonEffect:play()
    timerRef = timer.performWithDelay(200, hideEffect, 1)
  end
  
  effectGroup.playEffect = playEffect
  effectGroup.clean = clean
  effectGroup:insert(cannonEffect)
  effectGroup:scale(0.7, 0.7)
  hideEffect()
  return effectGroup
end

M.new = new
return M
