-- Sprite sheet of c43s1 (images/monsters/c43s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 54, y = 454, width = 46, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 45, sourceHeight = 20 }, -- 0l
    { x = 54, y = 476, width = 46, height = 20, sourceX = 0, sourceY = 0, sourceWidth = 45, sourceHeight = 20 }, -- 0r
    { x = 94, y = 102, width = 24, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 23, sourceHeight = 39 }, -- arm_l_lower
    { x = 212, y = 104, width = 22, height = 32 }, -- arm_l_upper
    { x = 94, y = 144, width = 24, height = 38 }, -- arm_r_lower
    { x = 212, y = 138, width = 22, height = 32 }, -- arm_r_upper
    { x = 149, y = 408, width = 45, height = 32 }, -- deaths/body
    { x = 164, y = 220, width = 82, height = 85 }, -- deaths/headSingle
    { x = 82, y = 309, width = 82, height = 78 }, -- deaths/headSingleShot
    { x = 102, y = 218, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 218, width = 76, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 336, width = 76, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 168, y = 309, width = 58, height = 95 }, -- deaths/sawbladeLeft
    { x = 104, y = 391, width = 41, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 128, height = 98, sourceX = 0, sourceY = 0, sourceWidth = 127, sourceHeight = 98 }, -- hair
    { x = 132, y = 2, width = 100, height = 100, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 120, y = 162, width = 78, height = 54, sourceX = 22, sourceY = 0, sourceWidth = 104, sourceHeight = 53 }, -- head_lower
    { x = 2, y = 102, width = 90, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 56 }, -- misc/eyes_closed
    { x = 120, y = 104, width = 90, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 56 }, -- misc/eyes_dead
    { x = 2, y = 160, width = 90, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 56 }, -- misc/eyes_normal
    { x = 234, y = 2, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 35, sourceHeight = 27 }, -- tail
    { x = 200, y = 172, width = 52, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 58, sourceHeight = 43 }, -- torso_lower
    { x = 2, y = 454, width = 50, height = 48, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 48 }, -- torso_upper
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
