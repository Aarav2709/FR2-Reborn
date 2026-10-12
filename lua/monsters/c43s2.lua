-- Sprite sheet of c43s2 (images/monsters/c43s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 78, y = 92, width = 44, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 43, sourceHeight = 18 }, -- 0l
    { x = 78, y = 112, width = 44, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 43, sourceHeight = 18 }, -- 0r
    { x = 78, y = 162, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 39 }, -- arm_l_lower
    { x = 102, y = 196, width = 18, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_l_upper
    { x = 78, y = 204, width = 22, height = 38 }, -- arm_r_lower
    { x = 102, y = 162, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_r_upper
    { x = 189, y = 364, width = 45, height = 35 }, -- deaths/body
    { x = 138, y = 284, width = 79, height = 76 }, -- deaths/headSingle
    { x = 2, y = 346, width = 77, height = 71 }, -- deaths/headSingleShot
    { x = 76, y = 282, width = 58, height = 60 }, -- deaths/headSkull
    { x = 124, y = 164, width = 72, height = 116, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 208, width = 72, height = 116, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 83, y = 364, width = 58, height = 93 }, -- deaths/sawbladeLeft
    { x = 145, y = 364, width = 40, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 124, height = 88, sourceX = 0, sourceY = 2, sourceWidth = 124, sourceHeight = 92 }, -- hair
    { x = 128, y = 2, width = 112, height = 102, sourceX = 2, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 198, y = 202, width = 50, height = 44, sourceX = 40, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 92, width = 74, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 55 }, -- misc/eyes_closed
    { x = 124, y = 106, width = 74, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 55 }, -- misc/eyes_dead
    { x = 2, y = 150, width = 74, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 73, sourceHeight = 55 }, -- misc/eyes_normal
    { x = 78, y = 132, width = 36, height = 28, sourceX = 0, sourceY = 0, sourceWidth = 35, sourceHeight = 27 }, -- tail
    { x = 200, y = 106, width = 54, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 43 }, -- torso_lower
    { x = 200, y = 152, width = 52, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 48 }, -- torso_upper
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
