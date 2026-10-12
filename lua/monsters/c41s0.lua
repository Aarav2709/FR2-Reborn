-- Sprite sheet of c41s0 (images/monsters/c41s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 40, y = 234, width = 36, height = 14 }, -- 0l
    { x = 2, y = 234, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 76, y = 132, width = 20, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 39 }, -- arm_l_lower
    { x = 162, y = 104, width = 16, height = 28, sourceX = 2, sourceY = 0, sourceWidth = 20, sourceHeight = 27 }, -- arm_l_upper
    { x = 98, y = 132, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 36 }, -- arm_r_lower
    { x = 240, y = 124, width = 14, height = 28, sourceX = 4, sourceY = 0, sourceWidth = 22, sourceHeight = 28 }, -- arm_r_upper
    { x = 107, y = 257, width = 46, height = 38 }, -- deaths/body
    { x = 128, y = 188, width = 66, height = 65 }, -- deaths/headSingle
    { x = 42, y = 252, width = 61, height = 60 }, -- deaths/headSingleShot
    { x = 180, y = 124, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 72, height = 114, sourceX = 10, sourceY = 2, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 118, width = 72, height = 114, sourceX = 10, sourceY = 2, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 198, y = 188, width = 48, height = 89 }, -- deaths/sawbladeLeft
    { x = 2, y = 254, width = 34, height = 92 }, -- deaths/sawbladeRight
    { x = 78, y = 104, width = 82, height = 26, sourceX = 20, sourceY = 16, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 78, y = 2, width = 100, height = 100, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 76, y = 176, width = 8, height = 6, sourceX = 48, sourceY = 22, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 180, y = 2, width = 70, height = 40 }, -- misc/eyes_closed
    { x = 180, y = 86, width = 70, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 70, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 180, y = 44, width = 70, height = 40 }, -- misc/eyes_normal
    { x = 86, y = 176, width = 6, height = 6, sourceX = 10, sourceY = 10, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 126, y = 134, width = 46, height = 40, sourceX = 6, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 76, y = 186, width = 48, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 57, sourceHeight = 43 }, -- torso_upper
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
