-- Sprite sheet of c44s1 (images/monsters/c44s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 210, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 210, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 210, y = 38, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_l_lower
    { x = 202, y = 118, width = 22, height = 36 }, -- arm_l_upper
    { x = 210, y = 78, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_r_lower
    { x = 226, y = 118, width = 22, height = 36 }, -- arm_r_upper
    { x = 142, y = 432, width = 53, height = 33 }, -- deaths/body
    { x = 66, y = 344, width = 72, height = 90 }, -- deaths/headSingle
    { x = 142, y = 344, width = 67, height = 84 }, -- deaths/headSingleShot
    { x = 134, y = 280, width = 58, height = 60 }, -- deaths/headSkull
    { x = 102, y = 162, width = 74, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 178, y = 162, width = 74, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 348, width = 52, height = 96 }, -- deaths/sawbladeLeft
    { x = 213, y = 282, width = 37, height = 100 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 102, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 123, sourceHeight = 99 }, -- hair
    { x = 106, y = 2, width = 102, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 254, width = 68, height = 50, sourceX = 30, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 102, width = 98, height = 58 }, -- misc/eyes_closed
    { x = 102, y = 102, width = 98, height = 58 }, -- misc/eyes_dead
    { x = 2, y = 162, width = 98, height = 58 }, -- misc/eyes_normal
    { x = 2, y = 222, width = 70, height = 30, sourceX = 0, sourceY = 0, sourceWidth = 69, sourceHeight = 30 }, -- tail
    { x = 2, y = 306, width = 60, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 39 }, -- torso_lower
    { x = 72, y = 280, width = 60, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 48 }, -- torso_upper
  },
  sheetContentWidth = 256,
  sheetContentHeight = 512
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
