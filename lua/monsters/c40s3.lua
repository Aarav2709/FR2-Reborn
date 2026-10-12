-- Sprite sheet of c40s3 (images/monsters/c40s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 132, y = 302, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 16 }, -- 0l
    { x = 176, y = 302, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 16 }, -- 0r
    { x = 222, y = 2, width = 26, height = 48 }, -- arm_l_lower
    { x = 222, y = 102, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 39 }, -- arm_l_upper
    { x = 222, y = 52, width = 26, height = 48 }, -- arm_r_lower
    { x = 86, y = 96, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 39 }, -- arm_r_upper
    { x = 198, y = 424, width = 52, height = 53 }, -- deaths/body
    { x = 56, y = 350, width = 72, height = 76 }, -- deaths/headSingle
    { x = 2, y = 430, width = 70, height = 69 }, -- deaths/headSingleShot
    { x = 162, y = 240, width = 58, height = 60 }, -- deaths/headSkull
    { x = 86, y = 172, width = 74, height = 112, sourceX = 10, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 218, width = 74, height = 112, sourceX = 10, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 134, y = 322, width = 60, height = 111 }, -- deaths/sawbladeLeft
    { x = 198, y = 322, width = 40, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 116, height = 92, sourceX = 2, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 120, y = 2, width = 100, height = 106, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 194, y = 144, width = 60, height = 52, sourceX = 38, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 96, width = 82, height = 60, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 59 }, -- misc/eyes_closed
    { x = 2, y = 158, width = 82, height = 58, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 59 }, -- misc/eyes_dead
    { x = 110, y = 110, width = 82, height = 60, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 59 }, -- misc/eyes_normal
    { x = 162, y = 198, width = 64, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 63, sourceHeight = 40 }, -- tail
    { x = 2, y = 332, width = 50, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 58, sourceHeight = 43 }, -- torso_lower
    { x = 78, y = 286, width = 52, height = 60, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 60 }, -- torso_upper
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
