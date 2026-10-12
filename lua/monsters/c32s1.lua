-- Sprite sheet of c32s1 (images/monsters/c32s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 84, y = 116, width = 36, height = 14 }, -- 0l
    { x = 84, y = 98, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 84, y = 212, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 38 }, -- arm_l_lower
    { x = 84, y = 132, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_l_upper
    { x = 84, y = 172, width = 22, height = 38 }, -- arm_r_lower
    { x = 204, y = 106, width = 18, height = 32, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 32 }, -- arm_r_upper
    { x = 206, y = 142, width = 31, height = 34 }, -- deaths/body
    { x = 122, y = 342, width = 82, height = 84 }, -- deaths/headSingle
    { x = 2, y = 392, width = 79, height = 79 }, -- deaths/headSingleShot
    { x = 184, y = 278, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 98, width = 80, height = 116, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 122, y = 106, width = 80, height = 116, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 85, y = 430, width = 56, height = 100 }, -- deaths/sawbladeLeft
    { x = 208, y = 342, width = 40, height = 105 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 124, height = 94 }, -- hair
    { x = 128, y = 2, width = 110, height = 102, sourceX = 6, sourceY = 0, sourceWidth = 115, sourceHeight = 110 }, -- head
    { x = 2, y = 216, width = 80, height = 48, sourceX = 24, sourceY = 2, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 106, y = 224, width = 76, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 54 }, -- misc/eyes_closed
    { x = 2, y = 266, width = 76, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 54 }, -- misc/eyes_dead
    { x = 80, y = 280, width = 76, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 54 }, -- misc/eyes_normal
    { x = 184, y = 224, width = 66, height = 52 }, -- tail
    { x = 2, y = 322, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 62, y = 336, width = 56, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
  },
  sheetContentWidth = 256,
  sheetContentHeight = 1024
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
