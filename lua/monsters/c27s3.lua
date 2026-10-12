-- Sprite sheet of c27s3 (images/monsters/c27s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 200, y = 112, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 38, sourceHeight = 15 }, -- 0l
    { x = 200, y = 130, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 38, sourceHeight = 15 }, -- 0r
    { x = 218, y = 2, width = 28, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 27, sourceHeight = 34 }, -- arm_l_lower
    { x = 218, y = 74, width = 22, height = 36 }, -- arm_l_upper
    { x = 218, y = 38, width = 28, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 27, sourceHeight = 34 }, -- arm_r_lower
    { x = 200, y = 148, width = 22, height = 36 }, -- arm_r_upper
    { x = 2, y = 354, width = 57, height = 36 }, -- deaths/body
    { x = 136, y = 378, width = 79, height = 84 }, -- deaths/headSingle
    { x = 2, y = 448, width = 73, height = 75 }, -- deaths/headSingleShot
    { x = 76, y = 282, width = 58, height = 60 }, -- deaths/headSkull
    { x = 108, y = 110, width = 90, height = 116, sourceX = 4, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 136, width = 90, height = 116, sourceX = 4, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 64, y = 346, width = 68, height = 98 }, -- deaths/sawbladeLeft
    { x = 79, y = 448, width = 42, height = 101 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 108, height = 78, sourceX = 8, sourceY = 0, sourceWidth = 123, sourceHeight = 77 }, -- hair
    { x = 112, y = 2, width = 104, height = 106, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 82, width = 104, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 176, y = 228, width = 72, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 49 }, -- misc/eyes_closed
    { x = 176, y = 280, width = 72, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 49 }, -- misc/eyes_dead
    { x = 2, y = 254, width = 72, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 49 }, -- misc/eyes_normal
    { x = 94, y = 228, width = 80, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 79, sourceHeight = 51 }, -- tail
    { x = 136, y = 332, width = 58, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 41 }, -- torso_lower
    { x = 2, y = 306, width = 58, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 44 }, -- torso_upper
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
