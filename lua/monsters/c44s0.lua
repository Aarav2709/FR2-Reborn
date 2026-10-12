-- Sprite sheet of c44s0 (images/monsters/c44s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 208, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 208, y = 38, width = 22, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 36 }, -- arm_l_lower
    { x = 232, y = 38, width = 22, height = 36 }, -- arm_l_upper
    { x = 138, y = 206, width = 22, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 36 }, -- arm_r_lower
    { x = 198, y = 270, width = 22, height = 36 }, -- arm_r_upper
    { x = 65, y = 348, width = 54, height = 41 }, -- deaths/body
    { x = 65, y = 274, width = 69, height = 70 }, -- deaths/headSingle
    { x = 138, y = 310, width = 64, height = 66 }, -- deaths/headSingleShot
    { x = 138, y = 244, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 154, width = 72, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 168, y = 126, width = 72, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 274, width = 59, height = 97 }, -- deaths/sawbladeLeft
    { x = 206, y = 310, width = 42, height = 100 }, -- deaths/sawbladeRight
    { x = 106, y = 2, width = 100, height = 52, sourceX = 12, sourceY = 10, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 102, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 86, y = 108, width = 80, height = 52, sourceX = 22, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 106, y = 56, width = 82, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_closed
    { x = 76, y = 162, width = 70, height = 42, sourceX = 6, sourceY = 6, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_dead
    { x = 2, y = 102, width = 82, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_normal
    { x = 198, y = 244, width = 54, height = 24, sourceX = 0, sourceY = 2, sourceWidth = 53, sourceHeight = 27 }, -- tail
    { x = 76, y = 206, width = 60, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 39 }, -- torso_lower
    { x = 190, y = 76, width = 60, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 48 }, -- torso_upper
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
