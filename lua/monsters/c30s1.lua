-- Sprite sheet of c30s1 (images/monsters/c30s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 2, width = 42, height = 16 }, -- 0l
    { x = 208, y = 20, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 16 }, -- 0r
    { x = 208, y = 80, width = 22, height = 36 }, -- arm_l_lower
    { x = 174, y = 136, width = 22, height = 32 }, -- arm_l_upper
    { x = 232, y = 80, width = 22, height = 36 }, -- arm_r_lower
    { x = 156, y = 170, width = 22, height = 32 }, -- arm_r_upper
    { x = 211, y = 38, width = 29, height = 40 }, -- deaths/body
    { x = 199, y = 118, width = 53, height = 72 }, -- deaths/headSingle
    { x = 136, y = 235, width = 55, height = 70 }, -- deaths/headSingleShot
    { x = 194, y = 234, width = 58, height = 60 }, -- deaths/headSkull
    { x = 70, y = 218, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 244, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 55, y = 363, width = 50, height = 97 }, -- deaths/sawbladeLeft
    { x = 4, y = 364, width = 46, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 104, height = 74, sourceX = 12, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 106, y = 2, width = 100, height = 96, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 88, y = 158, width = 66, height = 58 }, -- head_lower
    { x = 2, y = 78, width = 84, height = 56 }, -- misc/eyes_closed
    { x = 88, y = 100, width = 84, height = 56 }, -- misc/eyes_dead
    { x = 2, y = 136, width = 84, height = 56 }, -- misc/eyes_normal
    { x = 172, y = 100, width = 22, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 33 }, -- tail
    { x = 178, y = 192, width = 66, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 66, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 194, width = 66, height = 48 }, -- torso_upper
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
