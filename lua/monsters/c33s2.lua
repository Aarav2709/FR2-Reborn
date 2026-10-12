-- Sprite sheet of c33s2 (images/monsters/c33s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 20, width = 36, height = 14 }, -- 0l
    { x = 208, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 208, y = 36, width = 20, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 33 }, -- arm_l_lower
    { x = 230, y = 150, width = 18, height = 30 }, -- arm_l_upper
    { x = 230, y = 36, width = 20, height = 34 }, -- arm_r_lower
    { x = 92, y = 118, width = 12, height = 30, sourceX = 2, sourceY = 0, sourceWidth = 16, sourceHeight = 30 }, -- arm_r_upper
    { x = 135, y = 367, width = 48, height = 33 }, -- deaths/body
    { x = 136, y = 286, width = 71, height = 77 }, -- deaths/headSingle
    { x = 2, y = 316, width = 71, height = 72 }, -- deaths/headSingleShot
    { x = 166, y = 222, width = 58, height = 60 }, -- deaths/headSkull
    { x = 92, y = 150, width = 72, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 172, width = 72, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 77, y = 316, width = 54, height = 93 }, -- deaths/sawbladeLeft
    { x = 211, y = 286, width = 41, height = 95 }, -- deaths/sawbladeRight
    { x = 166, y = 150, width = 62, height = 70, sourceX = 0, sourceY = 0, sourceWidth = 61, sourceHeight = 70 }, -- hair
    { x = 2, y = 2, width = 106, height = 114, sourceX = 0, sourceY = 0, sourceWidth = 105, sourceHeight = 114 }, -- head
    { x = 76, y = 268, width = 56, height = 44, sourceX = 16, sourceY = 0, sourceWidth = 78, sourceHeight = 45 }, -- head_lower
    { x = 110, y = 42, width = 88, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 88, sourceHeight = 51 }, -- misc/eyes_closed
    { x = 110, y = 96, width = 88, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 88, sourceHeight = 51 }, -- misc/eyes_dead
    { x = 2, y = 118, width = 88, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 88, sourceHeight = 51 }, -- misc/eyes_normal
    { x = 110, y = 2, width = 96, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 96, sourceHeight = 37 }, -- tail
    { x = 200, y = 114, width = 50, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 49, sourceHeight = 34 }, -- torso_lower
    { x = 200, y = 72, width = 50, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 51, sourceHeight = 40 }, -- torso_upper
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
