-- Sprite sheet of c38s2 (images/monsters/c38s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 204, y = 150, width = 36, height = 20 }, -- 0l
    { x = 160, y = 168, width = 36, height = 20 }, -- 0r
    { x = 224, y = 2, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_l_lower
    { x = 224, y = 86, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_l_upper
    { x = 224, y = 44, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_r_lower
    { x = 92, y = 92, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_r_upper
    { x = 131, y = 392, width = 46, height = 32 }, -- deaths/body
    { x = 132, y = 308, width = 71, height = 80 }, -- deaths/headSingle
    { x = 2, y = 376, width = 68, height = 76 }, -- deaths/headSingleShot
    { x = 160, y = 190, width = 58, height = 60 }, -- deaths/headSkull
    { x = 92, y = 168, width = 66, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 216, width = 66, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 74, y = 338, width = 53, height = 97 }, -- deaths/sawbladeLeft
    { x = 207, y = 308, width = 39, height = 100 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 110, height = 88, sourceX = 6, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 114, y = 2, width = 108, height = 102, sourceX = 4, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 334, width = 58, height = 38, sourceX = 0, sourceY = 2, sourceWidth = 57, sourceHeight = 41 }, -- head_lower
    { x = 2, y = 92, width = 88, height = 60 }, -- misc/eyes_closed
    { x = 114, y = 106, width = 88, height = 60 }, -- misc/eyes_dead
    { x = 2, y = 154, width = 88, height = 60 }, -- misc/eyes_normal
    { x = 204, y = 120, width = 42, height = 28, sourceX = 0, sourceY = 0, sourceWidth = 42, sourceHeight = 27 }, -- tail
    { x = 70, y = 286, width = 58, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 47 }, -- torso_lower
    { x = 160, y = 252, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
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
