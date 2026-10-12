-- Sprite sheet of c34s2 (images/monsters/c34s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 84, y = 118, width = 38, height = 16 }, -- 0l
    { x = 84, y = 136, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 37, sourceHeight = 16 }, -- 0r
    { x = 230, y = 148, width = 20, height = 40 }, -- arm_l_lower
    { x = 106, y = 154, width = 20, height = 38 }, -- arm_l_upper
    { x = 84, y = 154, width = 20, height = 40 }, -- arm_r_lower
    { x = 230, y = 106, width = 22, height = 40 }, -- arm_r_upper
    { x = 89, y = 501, width = 51, height = 43 }, -- deaths/body
    { x = 2, y = 396, width = 83, height = 104 }, -- deaths/headSingle
    { x = 89, y = 398, width = 82, height = 99 }, -- deaths/headSingleShot
    { x = 154, y = 292, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 118, width = 80, height = 128, sourceX = 2, sourceY = 0, sourceWidth = 95, sourceHeight = 128 }, -- deaths/lightning1
    { x = 128, y = 162, width = 80, height = 128, sourceX = 2, sourceY = 0, sourceWidth = 95, sourceHeight = 128 }, -- deaths/lightning2
    { x = 194, y = 356, width = 58, height = 124 }, -- deaths/sawbladeLeft
    { x = 175, y = 484, width = 40, height = 115 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 134, height = 114, sourceX = 0, sourceY = 0, sourceWidth = 133, sourceHeight = 114 }, -- hair
    { x = 138, y = 2, width = 100, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 336, width = 68, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 67, sourceHeight = 55 }, -- head_lower
    { x = 2, y = 248, width = 74, height = 44, sourceX = 2, sourceY = 0, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 2, y = 294, width = 70, height = 40, sourceX = 4, sourceY = 4, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 78, y = 292, width = 74, height = 44, sourceX = 2, sourceY = 0, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 138, y = 106, width = 90, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 53 }, -- tail
    { x = 132, y = 354, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 72, y = 338, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 52 }, -- torso_upper
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
