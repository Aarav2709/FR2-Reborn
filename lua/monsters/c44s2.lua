-- Sprite sheet of c44s2 (images/monsters/c44s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 206, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 206, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 206, y = 38, width = 26, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 28, sourceHeight = 37 }, -- arm_l_lower
    { x = 158, y = 178, width = 22, height = 36 }, -- arm_l_upper
    { x = 154, y = 254, width = 26, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 28, sourceHeight = 37 }, -- arm_r_lower
    { x = 158, y = 216, width = 22, height = 36 }, -- arm_r_upper
    { x = 61, y = 360, width = 62, height = 42 }, -- deaths/body
    { x = 61, y = 286, width = 71, height = 70 }, -- deaths/headSingle
    { x = 136, y = 332, width = 66, height = 65 }, -- deaths/headSingleShot
    { x = 182, y = 268, width = 58, height = 60 }, -- deaths/headSkull
    { x = 104, y = 60, width = 78, height = 116, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 106, width = 78, height = 116, sourceX = 6, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 278, width = 55, height = 96 }, -- deaths/sawbladeLeft
    { x = 206, y = 332, width = 37, height = 100 }, -- deaths/sawbladeRight
    { x = 104, y = 2, width = 100, height = 56, sourceX = 12, sourceY = 10, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 100, height = 102, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 82, y = 178, width = 74, height = 52, sourceX = 30, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 224, width = 74, height = 50, sourceX = 4, sourceY = 0, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_closed
    { x = 184, y = 78, width = 70, height = 50, sourceX = 6, sourceY = 0, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_dead
    { x = 78, y = 232, width = 74, height = 50, sourceX = 4, sourceY = 0, sourceWidth = 81, sourceHeight = 50 }, -- misc/eyes_normal
    { x = 184, y = 130, width = 70, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 69, sourceHeight = 47 }, -- tail
    { x = 182, y = 228, width = 60, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 39 }, -- torso_lower
    { x = 182, y = 180, width = 60, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 46 }, -- torso_upper
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
