local M = {}

local function resolveFrames(sheetInfo, skinId, defaultSkinId, suffix)
  local key = "" .. (skinId or defaultSkinId)
  local startFrame = sheetInfo:getFrameIndex(key)
  local endFrame = sheetInfo:getFrameIndex(key .. suffix)

  if not startFrame or not endFrame then
    key = "" .. defaultSkinId
    startFrame = sheetInfo:getFrameIndex(key)
    endFrame = sheetInfo:getFrameIndex(key .. suffix)
  end

  return key, startFrame, endFrame
end

function M.buildTrapAnimation(sheetInfo, skinId)
  local key, startFrame, endFrame = resolveFrames(sheetInfo, skinId, 1301, "_4")
  return key, {
    { name = "close", start = startFrame, count = 4, time = 70, loopCount = 1 },
    { name = "open", frames = { endFrame, endFrame - 1, endFrame - 2, endFrame - 3 }, time = 1000, loopCount = 1 }
  }
end

function M.buildBounceTrapAnimation(sheetInfo, skinId)
  local key, startFrame, endFrame = resolveFrames(sheetInfo, skinId, 2001, "_5")
  return key, {
    { name = "play", start = startFrame, count = 5, time = 70, loopCount = 1 },
    { name = "reset", frames = { endFrame, endFrame - 1, endFrame - 2, endFrame - 3, endFrame - 4 }, time = 800, loopCount = 1 }
  }
end

return M
