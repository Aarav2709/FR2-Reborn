-- Sprite sheet of c33s0 (images/monsters/c33s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 24, y = 238, width = 36, height = 14 }, -- 0l
    { x = 24, y = 220, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 2, y = 220, width = 20, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 33 }, -- arm_l_lower
    { x = 62, y = 220, width = 16, height = 28, sourceX = 2, sourceY = 0, sourceWidth = 20, sourceHeight = 27 }, -- arm_l_upper
    { x = 210, y = 160, width = 18, height = 32 }, -- arm_r_lower
    { x = 166, y = 116, width = 14, height = 28, sourceX = 4, sourceY = 0, sourceWidth = 22, sourceHeight = 28 }, -- arm_r_upper
    { x = 121, y = 254, width = 25, height = 30 }, -- deaths/body
    { x = 154, y = 252, width = 60, height = 77 }, -- deaths/headSingle
    { x = 2, y = 258, width = 60, height = 71 }, -- deaths/headSingleShot
    { x = 182, y = 36, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 106, width = 76, height = 112, sourceX = 4, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 104, y = 2, width = 76, height = 112, sourceX = 4, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 70, y = 254, width = 47, height = 95 }, -- deaths/sawbladeLeft
    { x = 218, y = 196, width = 35, height = 93 }, -- deaths/sawbladeRight
    { x = 62, y = 250, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 100, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 182, y = 98, width = 56, height = 60, sourceX = 2, sourceY = 0, sourceWidth = 61, sourceHeight = 59 }, -- head_lower
    { x = 80, y = 166, width = 74, height = 42, sourceX = 6, sourceY = 6, sourceWidth = 83, sourceHeight = 48 }, -- misc/eyes_closed
    { x = 80, y = 210, width = 70, height = 40, sourceX = 8, sourceY = 8, sourceWidth = 83, sourceHeight = 48 }, -- misc/eyes_dead
    { x = 80, y = 116, width = 84, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 83, sourceHeight = 48 }, -- misc/eyes_normal
    { x = 182, y = 2, width = 72, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 32 }, -- tail
    { x = 156, y = 166, width = 52, height = 40, sourceX = 4, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 156, y = 208, width = 48, height = 40, sourceX = 4, sourceY = 0, sourceWidth = 57, sourceHeight = 40 }, -- torso_upper
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
