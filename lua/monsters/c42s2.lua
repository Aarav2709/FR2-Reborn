-- Sprite sheet of c42s2 (images/monsters/c42s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 84, y = 326, width = 40, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 19 }, -- 0l
    { x = 2, y = 346, width = 40, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 19 }, -- 0r
    { x = 230, y = 238, width = 24, height = 42 }, -- arm_l_lower
    { x = 192, y = 308, width = 22, height = 36 }, -- arm_l_upper
    { x = 230, y = 282, width = 24, height = 42 }, -- arm_r_lower
    { x = 216, y = 326, width = 22, height = 36 }, -- arm_r_upper
    { x = 120, y = 459, width = 45, height = 34 }, -- deaths/body
    { x = 46, y = 350, width = 99, height = 93 }, -- deaths/headSingle
    { x = 149, y = 366, width = 99, height = 89 }, -- deaths/headSingleShot
    { x = 104, y = 106, width = 58, height = 60 }, -- deaths/headSkull
    { x = 164, y = 2, width = 80, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 164, y = 120, width = 80, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 447, width = 65, height = 95 }, -- deaths/sawbladeLeft
    { x = 71, y = 447, width = 45, height = 105 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 160, height = 102 }, -- hair
    { x = 2, y = 106, width = 100, height = 98, sourceX = 8, sourceY = 2, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 84, y = 282, width = 54, height = 42, sourceX = 40, sourceY = 10, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 206, width = 80, height = 68, sourceX = 0, sourceY = 0, sourceWidth = 79, sourceHeight = 68 }, -- misc/eyes_closed
    { x = 2, y = 276, width = 80, height = 68, sourceX = 0, sourceY = 0, sourceWidth = 79, sourceHeight = 68 }, -- misc/eyes_dead
    { x = 148, y = 238, width = 80, height = 68, sourceX = 0, sourceY = 0, sourceWidth = 79, sourceHeight = 68 }, -- misc/eyes_normal
    { x = 140, y = 308, width = 50, height = 38 }, -- tail
    { x = 104, y = 168, width = 58, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 49 }, -- torso_lower
    { x = 84, y = 220, width = 62, height = 60, sourceX = 0, sourceY = 0, sourceWidth = 62, sourceHeight = 59 }, -- torso_upper
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
