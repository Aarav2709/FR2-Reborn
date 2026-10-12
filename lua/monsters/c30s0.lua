-- Sprite sheet of c30s0 (images/monsters/c30s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 356, width = 42, height = 16 }, -- 0l
    { x = 2, y = 374, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 16 }, -- 0r
    { x = 216, y = 226, width = 22, height = 36 }, -- arm_l_lower
    { x = 84, y = 118, width = 22, height = 32 }, -- arm_l_upper
    { x = 216, y = 264, width = 22, height = 36 }, -- arm_r_lower
    { x = 84, y = 80, width = 22, height = 36 }, -- arm_r_upper
    { x = 218, y = 152, width = 30, height = 40 }, -- deaths/body
    { x = 69, y = 194, width = 53, height = 72 }, -- deaths/headSingle
    { x = 127, y = 271, width = 52, height = 70 }, -- deaths/headSingleShot
    { x = 66, y = 268, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 184, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 152, y = 152, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 61, y = 332, width = 50, height = 92 }, -- deaths/sawbladeLeft
    { x = 209, y = 4, width = 42, height = 94 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 102, height = 76, sourceX = 12, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 106, y = 2, width = 100, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 302, width = 56, height = 52, sourceX = 2, sourceY = 0, sourceWidth = 59, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 80, width = 80, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 80, sourceHeight = 51 }, -- misc/eyes_closed
    { x = 106, y = 100, width = 80, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 80, sourceHeight = 51 }, -- misc/eyes_dead
    { x = 2, y = 134, width = 80, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_normal
    { x = 216, y = 194, width = 26, height = 30, sourceX = 0, sourceY = 0, sourceWidth = 26, sourceHeight = 29 }, -- tail
    { x = 84, y = 152, width = 66, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 66, sourceHeight = 39 }, -- torso_lower
    { x = 188, y = 102, width = 66, height = 48 }, -- torso_upper
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
