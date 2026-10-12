-- Sprite sheet of c43s0 (images/monsters/c43s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 126, y = 296, width = 44, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 43, sourceHeight = 18 }, -- 0l
    { x = 172, y = 296, width = 44, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 43, sourceHeight = 18 }, -- 0r
    { x = 224, y = 2, width = 22, height = 38 }, -- arm_l_lower
    { x = 224, y = 82, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_l_upper
    { x = 224, y = 42, width = 22, height = 38 }, -- arm_r_lower
    { x = 80, y = 122, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_r_upper
    { x = 2, y = 390, width = 46, height = 36 }, -- deaths/body
    { x = 2, y = 312, width = 72, height = 74 }, -- deaths/headSingle
    { x = 138, y = 318, width = 72, height = 68 }, -- deaths/headSingleShot
    { x = 194, y = 116, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 192, width = 72, height = 116, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 154, y = 178, width = 72, height = 116, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 78, y = 318, width = 56, height = 93 }, -- deaths/sawbladeLeft
    { x = 214, y = 318, width = 40, height = 99 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 118, height = 88, sourceX = 2, sourceY = 2, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 122, y = 2, width = 100, height = 102, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 92, width = 76, height = 44, sourceX = 24, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 118, y = 106, width = 74, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 52 }, -- misc/eyes_closed
    { x = 2, y = 138, width = 74, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 52 }, -- misc/eyes_dead
    { x = 78, y = 160, width = 74, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 52 }, -- misc/eyes_normal
    { x = 80, y = 92, width = 36, height = 28, sourceX = 0, sourceY = 0, sourceWidth = 35, sourceHeight = 27 }, -- tail
    { x = 76, y = 214, width = 54, height = 44, sourceX = 2, sourceY = 0, sourceWidth = 58, sourceHeight = 43 }, -- torso_lower
    { x = 76, y = 260, width = 48, height = 48, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 48 }, -- torso_upper
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
