-- Sprite sheet of c5s5 (images/monsters/c5s5/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 112, y = 138, width = 38, height = 16 }, -- 0l
    { x = 112, y = 120, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 16 }, -- 0r
    { x = 220, y = 242, width = 20, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 44 }, -- arm_l_lower
    { x = 240, y = 2, width = 14, height = 30, sourceX = 4, sourceY = 0, sourceWidth = 22, sourceHeight = 29 }, -- arm_l_upper
    { x = 112, y = 156, width = 24, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 23, sourceHeight = 39 }, -- arm_r_lower
    { x = 240, y = 34, width = 14, height = 30, sourceX = 4, sourceY = 0, sourceWidth = 22, sourceHeight = 29 }, -- arm_r_upper
    { x = 53, y = 406, width = 41, height = 34 }, -- deaths/body
    { x = 64, y = 322, width = 93, height = 80 }, -- deaths/headSingle
    { x = 161, y = 322, width = 93, height = 74 }, -- deaths/headSingleShot
    { x = 2, y = 310, width = 58, height = 60 }, -- deaths/headSkull
    { x = 154, y = 2, width = 84, height = 118, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 117 }, -- deaths/lightning1
    { x = 154, y = 122, width = 84, height = 118, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 117 }, -- deaths/lightning2
    { x = 161, y = 400, width = 70, height = 98 }, -- deaths/sawbladeLeft
    { x = 2, y = 374, width = 47, height = 102 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 150, height = 116, sourceX = 0, sourceY = 2, sourceWidth = 150, sourceHeight = 120 }, -- hair
    { x = 2, y = 120, width = 108, height = 98, sourceX = 8, sourceY = 0, sourceWidth = 123, sourceHeight = 98 }, -- head
    { x = 132, y = 278, width = 58, height = 40, sourceX = 2, sourceY = 6, sourceWidth = 61, sourceHeight = 50 }, -- head_lower
    { x = 78, y = 224, width = 74, height = 42, sourceX = 4, sourceY = 4, sourceWidth = 79, sourceHeight = 45 }, -- misc/eyes_closed
    { x = 154, y = 242, width = 64, height = 34, sourceX = 2, sourceY = 0, sourceWidth = 69, sourceHeight = 34 }, -- misc/eyes_dead
    { x = 2, y = 220, width = 74, height = 44, sourceX = 10, sourceY = 2, sourceWidth = 92, sourceHeight = 45 }, -- misc/eyes_normal
    { x = 112, y = 198, width = 24, height = 24, sourceX = 4, sourceY = 6, sourceWidth = 31, sourceHeight = 35 }, -- tail
    { x = 2, y = 266, width = 66, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 68, sourceHeight = 41 }, -- torso_lower
    { x = 70, y = 268, width = 60, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 60, sourceHeight = 41 }, -- torso_upper
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
