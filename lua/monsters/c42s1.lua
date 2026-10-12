-- Sprite sheet of c42s1 (images/monsters/c42s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 210, y = 296, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 210, y = 314, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 228, y = 160, width = 20, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 45 }, -- arm_l_lower
    { x = 228, y = 256, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 37 }, -- arm_l_upper
    { x = 228, y = 208, width = 20, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 45 }, -- arm_r_lower
    { x = 80, y = 292, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 37 }, -- arm_r_upper
    { x = 2, y = 424, width = 45, height = 34 }, -- deaths/body
    { x = 104, y = 320, width = 91, height = 91 }, -- deaths/headSingle
    { x = 2, y = 334, width = 91, height = 86 }, -- deaths/headSingleShot
    { x = 90, y = 90, width = 58, height = 60 }, -- deaths/headSkull
    { x = 150, y = 160, width = 76, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 208, width = 76, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 97, y = 415, width = 62, height = 97 }, -- deaths/sawbladeLeft
    { x = 199, y = 334, width = 43, height = 106 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 152, height = 86, sourceX = 0, sourceY = 0, sourceWidth = 154, sourceHeight = 85 }, -- hair
    { x = 156, y = 2, width = 94, height = 100, sourceX = 14, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 80, y = 250, width = 56, height = 40, sourceX = 36, sourceY = 8, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 150, width = 86, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 87, sourceHeight = 58 }, -- misc/eyes_closed
    { x = 150, y = 104, width = 86, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 87, sourceHeight = 58 }, -- misc/eyes_dead
    { x = 2, y = 90, width = 86, height = 58, sourceX = 0, sourceY = 0, sourceWidth = 87, sourceHeight = 58 }, -- misc/eyes_normal
    { x = 138, y = 278, width = 70, height = 38 }, -- tail
    { x = 80, y = 208, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 90, y = 152, width = 58, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 54 }, -- torso_upper
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
