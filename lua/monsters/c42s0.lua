-- Sprite sheet of c42s0 (images/monsters/c42s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 76, y = 272, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 2, y = 274, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 202, y = 262, width = 18, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 18, sourceHeight = 39 }, -- arm_l_lower
    { x = 224, y = 220, width = 22, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 35 }, -- arm_l_upper
    { x = 222, y = 296, width = 18, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 18, sourceHeight = 39 }, -- arm_r_lower
    { x = 224, y = 258, width = 22, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 35 }, -- arm_r_upper
    { x = 124, y = 423, width = 43, height = 33 }, -- deaths/body
    { x = 42, y = 292, width = 96, height = 86 }, -- deaths/headSingle
    { x = 142, y = 340, width = 96, height = 79 }, -- deaths/headSingleShot
    { x = 92, y = 72, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 114, width = 84, height = 116, sourceX = 4, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 152, y = 102, width = 84, height = 116, sourceX = 4, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 382, width = 68, height = 96 }, -- deaths/sawbladeLeft
    { x = 74, y = 382, width = 46, height = 104 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 154, height = 68 }, -- hair
    { x = 158, y = 2, width = 96, height = 98, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 148, y = 262, width = 52, height = 38, sourceX = 42, sourceY = 6, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 148, y = 220, width = 74, height = 40, sourceX = 6, sourceY = 0, sourceWidth = 87, sourceHeight = 40 }, -- misc/eyes_closed
    { x = 2, y = 232, width = 72, height = 40, sourceX = 6, sourceY = 0, sourceWidth = 87, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 2, y = 72, width = 88, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 87, sourceHeight = 40 }, -- misc/eyes_normal
    { x = 76, y = 232, width = 70, height = 38 }, -- tail
    { x = 88, y = 190, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 88, y = 134, width = 58, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 54 }, -- torso_upper
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
