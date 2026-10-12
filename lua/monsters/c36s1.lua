-- Sprite sheet of c36s1 (images/monsters/c36s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 204, y = 128, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 15 }, -- 0l
    { x = 138, y = 272, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 15 }, -- 0r
    { x = 218, y = 2, width = 22, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 42 }, -- arm_l_lower
    { x = 218, y = 88, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 37 }, -- arm_l_upper
    { x = 218, y = 46, width = 20, height = 40 }, -- arm_r_lower
    { x = 96, y = 74, width = 18, height = 34, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 33 }, -- arm_r_upper
    { x = 181, y = 358, width = 44, height = 32 }, -- deaths/body
    { x = 182, y = 274, width = 69, height = 80 }, -- deaths/headSingle
    { x = 62, y = 328, width = 68, height = 75 }, -- deaths/headSingleShot
    { x = 78, y = 264, width = 58, height = 60 }, -- deaths/headSkull
    { x = 86, y = 146, width = 74, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 170, width = 74, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 334, width = 50, height = 97 }, -- deaths/sawbladeLeft
    { x = 140, y = 292, width = 37, height = 97 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 112, height = 70, sourceX = 6, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 116, y = 2, width = 100, height = 94, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 288, width = 56, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 62, sourceHeight = 51 }, -- head_lower
    { x = 116, y = 98, width = 86, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_closed
    { x = 2, y = 122, width = 82, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_dead
    { x = 2, y = 74, width = 92, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_normal
    { x = 162, y = 146, width = 70, height = 34, sourceX = 8, sourceY = 0, sourceWidth = 77, sourceHeight = 38 }, -- tail
    { x = 162, y = 232, width = 64, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 63, sourceHeight = 39 }, -- torso_lower
    { x = 162, y = 182, width = 64, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 63, sourceHeight = 48 }, -- torso_upper
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
