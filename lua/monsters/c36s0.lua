-- Sprite sheet of c36s0 (images/monsters/c36s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 206, y = 20, width = 36, height = 14 }, -- 0l
    { x = 206, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 206, y = 36, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_l_lower
    { x = 192, y = 78, width = 20, height = 34 }, -- arm_l_upper
    { x = 230, y = 72, width = 20, height = 40 }, -- arm_r_lower
    { x = 230, y = 36, width = 22, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 33 }, -- arm_r_upper
    { x = 147, y = 379, width = 64, height = 40 }, -- deaths/body
    { x = 2, y = 312, width = 62, height = 70 }, -- deaths/headSingle
    { x = 147, y = 312, width = 60, height = 63 }, -- deaths/headSingleShot
    { x = 166, y = 204, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 156, width = 80, height = 112, sourceX = 0, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 84, y = 168, width = 80, height = 112, sourceX = 0, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 84, y = 284, width = 59, height = 93 }, -- deaths/sawbladeLeft
    { x = 220, y = 268, width = 34, height = 90 }, -- deaths/sawbladeRight
    { x = 104, y = 2, width = 100, height = 52, sourceX = 14, sourceY = 2, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 100, height = 96, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 166, y = 266, width = 50, height = 42, sourceX = 6, sourceY = 0, sourceWidth = 62, sourceHeight = 51 }, -- head_lower
    { x = 104, y = 56, width = 86, height = 54 }, -- misc/eyes_closed
    { x = 2, y = 100, width = 86, height = 54 }, -- misc/eyes_dead
    { x = 90, y = 112, width = 86, height = 54 }, -- misc/eyes_normal
    { x = 2, y = 270, width = 78, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 38 }, -- tail
    { x = 178, y = 114, width = 64, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 63, sourceHeight = 39 }, -- torso_lower
    { x = 178, y = 156, width = 62, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 61, sourceHeight = 45 }, -- torso_upper
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
