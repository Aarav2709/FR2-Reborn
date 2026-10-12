-- Sprite sheet of c28s3 (images/monsters/c28s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 2, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 15 }, -- 0l
    { x = 208, y = 20, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 40, sourceHeight = 15 }, -- 0r
    { x = 208, y = 74, width = 26, height = 36, sourceX = 4, sourceY = 4, sourceWidth = 30, sourceHeight = 40 }, -- arm_l_lower
    { x = 184, y = 102, width = 22, height = 34 }, -- arm_l_upper
    { x = 220, y = 236, width = 26, height = 36, sourceX = 4, sourceY = 4, sourceWidth = 30, sourceHeight = 40 }, -- arm_r_lower
    { x = 220, y = 274, width = 22, height = 34 }, -- arm_r_upper
    { x = 126, y = 366, width = 39, height = 31 }, -- deaths/body
    { x = 132, y = 294, width = 68, height = 68 }, -- deaths/headSingle
    { x = 56, y = 302, width = 66, height = 62 }, -- deaths/headSingleShot
    { x = 184, y = 174, width = 58, height = 60 }, -- deaths/headSkull
    { x = 98, y = 102, width = 84, height = 112, sourceX = 2, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 118, width = 84, height = 112, sourceX = 2, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 278, width = 50, height = 93 }, -- deaths/sawbladeLeft
    { x = 204, y = 312, width = 40, height = 92 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 106, height = 50, sourceX = 6, sourceY = 26, sourceWidth = 123, sourceHeight = 77 }, -- hair
    { x = 110, y = 2, width = 96, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 208, y = 38, width = 34, height = 34, sourceX = 8, sourceY = 4, sourceWidth = 45, sourceHeight = 46 }, -- head_lower
    { x = 88, y = 216, width = 74, height = 42, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 42 }, -- misc/eyes_closed
    { x = 184, y = 138, width = 68, height = 34, sourceX = 14, sourceY = 4, sourceWidth = 95, sourceHeight = 42 }, -- misc/eyes_dead
    { x = 2, y = 232, width = 74, height = 42, sourceX = 12, sourceY = 0, sourceWidth = 95, sourceHeight = 42 }, -- misc/eyes_normal
    { x = 2, y = 54, width = 94, height = 62 }, -- tail
    { x = 78, y = 260, width = 50, height = 38, sourceX = 6, sourceY = 0, sourceWidth = 58, sourceHeight = 41 }, -- torso_lower
    { x = 164, y = 236, width = 54, height = 54, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 53 }, -- torso_upper
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
