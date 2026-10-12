-- Sprite sheet of c24s3 (images/monsters/c24s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 214, y = 2, width = 40, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 19 }, -- 0l
    { x = 214, y = 24, width = 40, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 19 }, -- 0r
    { x = 108, y = 228, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 37 }, -- arm_l_lower
    { x = 60, y = 222, width = 22, height = 42 }, -- arm_l_upper
    { x = 130, y = 228, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 37 }, -- arm_r_lower
    { x = 84, y = 222, width = 22, height = 42 }, -- arm_r_upper
    { x = 166, y = 360, width = 39, height = 33 }, -- deaths/body
    { x = 154, y = 262, width = 66, height = 94 }, -- deaths/headSingle
    { x = 60, y = 270, width = 66, height = 89 }, -- deaths/headSingleShot
    { x = 2, y = 128, width = 58, height = 60 }, -- deaths/headSkull
    { x = 112, y = 110, width = 62, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 176, y = 142, width = 62, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 294, width = 45, height = 95 }, -- deaths/sawbladeLeft
    { x = 130, y = 360, width = 32, height = 102 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 108, height = 124, sourceX = 4, sourceY = 0, sourceWidth = 111, sourceHeight = 124 }, -- hair
    { x = 112, y = 2, width = 100, height = 106, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 62, y = 128, width = 42, height = 50, sourceX = 46, sourceY = 2, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 214, y = 96, width = 38, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_closed
    { x = 62, y = 180, width = 38, height = 40, sourceX = 4, sourceY = 4, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_dead
    { x = 214, y = 46, width = 38, height = 48, sourceX = 4, sourceY = 0, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_normal
    { x = 176, y = 110, width = 26, height = 30, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 30 }, -- tail
    { x = 2, y = 250, width = 54, height = 40, sourceX = 2, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 190, width = 56, height = 58, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 58 }, -- torso_upper
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
