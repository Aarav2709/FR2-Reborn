-- Sprite sheet of c12s5 (images/monsters/c12s5/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 302, width = 40, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 17 }, -- 0l
    { x = 2, y = 322, width = 40, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 17 }, -- 0r
    { x = 216, y = 2, width = 24, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 24, sourceHeight = 37 }, -- arm_l_lower
    { x = 216, y = 82, width = 22, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 33 }, -- arm_l_upper
    { x = 216, y = 42, width = 24, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 24, sourceHeight = 37 }, -- arm_r_lower
    { x = 164, y = 232, width = 22, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 33 }, -- arm_r_upper
    { x = 140, y = 415, width = 51, height = 48 }, -- deaths/body
    { x = 2, y = 344, width = 65, height = 87 }, -- deaths/headSingle
    { x = 71, y = 344, width = 65, height = 83 }, -- deaths/headSingleShot
    { x = 194, y = 118, width = 58, height = 60 }, -- deaths/headSkull
    { x = 108, y = 114, width = 84, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 128, width = 84, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 156, y = 294, width = 56, height = 117 }, -- deaths/sawbladeLeft
    { x = 216, y = 294, width = 36, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 54, width = 104, height = 72, sourceX = 10, sourceY = 0, sourceWidth = 123, sourceHeight = 77 }, -- hair
    { x = 110, y = 2, width = 104, height = 110, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 110 }, -- head
    { x = 242, y = 2, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 78, sourceHeight = 51 }, -- head_lower
    { x = 88, y = 232, width = 74, height = 54, sourceX = 2, sourceY = 0, sourceWidth = 79, sourceHeight = 53 }, -- misc/eyes_closed
    { x = 78, y = 288, width = 74, height = 52, sourceX = 2, sourceY = 0, sourceWidth = 79, sourceHeight = 53 }, -- misc/eyes_dead
    { x = 2, y = 246, width = 74, height = 54, sourceX = 2, sourceY = 0, sourceWidth = 79, sourceHeight = 53 }, -- misc/eyes_normal
    { x = 2, y = 2, width = 106, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 105, sourceHeight = 49 }, -- tail
    { x = 188, y = 242, width = 52, height = 48 }, -- torso_lower
    { x = 194, y = 180, width = 52, height = 60 }, -- torso_upper
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
