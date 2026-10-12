-- Sprite sheet of c41s1 (images/monsters/c41s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 118, y = 166, width = 36, height = 14 }, -- 0l
    { x = 118, y = 148, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 162, y = 106, width = 20, height = 38, sourceX = 0, sourceY = 2, sourceWidth = 19, sourceHeight = 39 }, -- arm_l_lower
    { x = 70, y = 2, width = 16, height = 28, sourceX = 2, sourceY = 0, sourceWidth = 20, sourceHeight = 27 }, -- arm_l_upper
    { x = 70, y = 188, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 36 }, -- arm_r_lower
    { x = 70, y = 32, width = 14, height = 30, sourceX = 4, sourceY = 0, sourceWidth = 22, sourceHeight = 30 }, -- arm_r_upper
    { x = 66, y = 258, width = 45, height = 38 }, -- deaths/body
    { x = 94, y = 186, width = 64, height = 68 }, -- deaths/headSingle
    { x = 2, y = 258, width = 60, height = 62 }, -- deaths/headSingleShot
    { x = 190, y = 2, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 66, height = 112, sourceX = 16, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 116, width = 66, height = 112, sourceX = 16, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 162, y = 190, width = 48, height = 89 }, -- deaths/sawbladeLeft
    { x = 214, y = 190, width = 35, height = 93 }, -- deaths/sawbladeRight
    { x = 2, y = 230, width = 84, height = 24, sourceX = 20, sourceY = 16, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 88, y = 2, width = 100, height = 102, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 70, y = 64, width = 8, height = 8, sourceX = 48, sourceY = 22, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 88, y = 106, width = 72, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 40 }, -- misc/eyes_closed
    { x = 184, y = 110, width = 68, height = 32, sourceX = 0, sourceY = 4, sourceWidth = 71, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 162, y = 146, width = 72, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 40 }, -- misc/eyes_normal
    { x = 70, y = 74, width = 8, height = 8, sourceX = 8, sourceY = 10, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 70, y = 148, width = 46, height = 34, sourceX = 6, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 190, y = 64, width = 48, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 57, sourceHeight = 43 }, -- torso_upper
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
