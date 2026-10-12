-- Sprite sheet of c39s0 (images/monsters/c39s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 106, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 40, y = 106, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 320, y = 44, width = 22, height = 40 }, -- arm_l_lower
    { x = 480, y = 38, width = 22, height = 34 }, -- arm_l_upper
    { x = 316, y = 86, width = 22, height = 40 }, -- arm_r_lower
    { x = 480, y = 74, width = 22, height = 34 }, -- arm_r_upper
    { x = 400, y = 126, width = 43, height = 39 }, -- deaths/body
    { x = 98, y = 122, width = 71, height = 72 }, -- deaths/headSingle
    { x = 173, y = 122, width = 66, height = 65 }, -- deaths/headSingleShot
    { x = 356, y = 2, width = 58, height = 60 }, -- deaths/headSkull
    { x = 106, y = 2, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 176, y = 2, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 342, y = 108, width = 54, height = 95 }, -- deaths/sawbladeLeft
    { x = 2, y = 126, width = 38, height = 99 }, -- deaths/sawbladeRight
    { x = 246, y = 2, width = 108, height = 40, sourceX = 4, sourceY = 4, sourceWidth = 116, sourceHeight = 48 }, -- hair
    { x = 2, y = 2, width = 102, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 416, y = 2, width = 78, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 78, sourceHeight = 35 }, -- head_lower
    { x = 246, y = 44, width = 72, height = 40 }, -- misc/eyes_closed
    { x = 246, y = 86, width = 68, height = 40, sourceX = 2, sourceY = 0, sourceWidth = 72, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 344, y = 64, width = 72, height = 40 }, -- misc/eyes_normal
    { x = 78, y = 106, width = 16, height = 20, sourceX = 4, sourceY = 4, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 418, y = 84, width = 60, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 60, sourceHeight = 39 }, -- torso_lower
    { x = 418, y = 38, width = 60, height = 44 }, -- torso_upper
  },
  sheetContentWidth = 512,
  sheetContentHeight = 256
}

local frameIndex = {
  ["0l"] = 1,
  ["0r"] = 2,
  ["arm_l_lower"] = 3,
  ["arm_l_upper"] = 4,
  ["arm_r_lower"] = 5,
  ["arm_r_upper"] = 6,
  ["deaths/body"] = 7,
  ["deaths/headSingle"] = 8,
  ["deaths/headSingleShot"] = 9,
  ["deaths/headSkull"] = 10,
  ["deaths/lightning1"] = 11,
  ["deaths/lightning2"] = 12,
  ["deaths/sawbladeLeft"] = 13,
  ["deaths/sawbladeRight"] = 14,
  ["hair"] = 15,
  ["head"] = 16,
  ["head_lower"] = 17,
  ["misc/eyes_closed"] = 18,
  ["misc/eyes_dead"] = 19,
  ["misc/eyes_normal"] = 20,
  ["tail"] = 21,
  ["torso_lower"] = 22,
  ["torso_upper"] = 23,
}

local M = { sheet = sheet, frameIndex = frameIndex }

function M:getSheet()
  return self.sheet
end

function M:getFrameIndex(name)
  return self.frameIndex[name]
end

return M
