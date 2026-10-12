-- Sprite sheet of c33s1 (images/monsters/c33s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 66, y = 100, width = 36, height = 14 }, -- 0l
    { x = 198, y = 160, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 230, y = 2, width = 20, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 33 }, -- arm_l_lower
    { x = 22, y = 218, width = 18, height = 28 }, -- arm_l_upper
    { x = 2, y = 218, width = 18, height = 32 }, -- arm_r_lower
    { x = 238, y = 38, width = 16, height = 30 }, -- arm_r_upper
    { x = 195, y = 318, width = 31, height = 58 }, -- deaths/body
    { x = 2, y = 258, width = 65, height = 70 }, -- deaths/headSingle
    { x = 71, y = 258, width = 63, height = 67 }, -- deaths/headSingleShot
    { x = 170, y = 2, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 100, width = 62, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 106, y = 2, width = 62, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 140, y = 232, width = 51, height = 115 }, -- deaths/sawbladeLeft
    { x = 210, y = 220, width = 35, height = 94 }, -- deaths/sawbladeRight
    { x = 142, y = 178, width = 64, height = 50, sourceX = 2, sourceY = 2, sourceWidth = 66, sourceHeight = 53 }, -- hair
    { x = 2, y = 2, width = 102, height = 96, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 170, y = 64, width = 66, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 66, sourceHeight = 59 }, -- head_lower
    { x = 66, y = 120, width = 74, height = 44, sourceX = 2, sourceY = 0, sourceWidth = 77, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 66, y = 212, width = 70, height = 42, sourceX = 2, sourceY = 0, sourceWidth = 77, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 66, y = 166, width = 74, height = 44, sourceX = 2, sourceY = 0, sourceWidth = 77, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 142, y = 120, width = 54, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 55, sourceHeight = 55 }, -- tail
    { x = 198, y = 118, width = 48, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 49, sourceHeight = 39 }, -- torso_lower
    { x = 208, y = 178, width = 44, height = 38, sourceX = 6, sourceY = 0, sourceWidth = 57, sourceHeight = 37 }, -- torso_upper
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
