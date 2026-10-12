-- Sprite sheet of c32s0 (images/monsters/c32s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 82, y = 100, width = 36, height = 14 }, -- 0l
    { x = 82, y = 82, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 198, y = 152, width = 18, height = 38 }, -- arm_l_lower
    { x = 82, y = 116, width = 22, height = 32 }, -- arm_l_upper
    { x = 218, y = 152, width = 18, height = 38 }, -- arm_r_lower
    { x = 80, y = 150, width = 22, height = 32 }, -- arm_r_upper
    { x = 144, y = 216, width = 29, height = 34 }, -- deaths/body
    { x = 138, y = 312, width = 76, height = 81 }, -- deaths/headSingle
    { x = 2, y = 360, width = 75, height = 76 }, -- deaths/headSingleShot
    { x = 76, y = 266, width = 58, height = 60 }, -- deaths/headSkull
    { x = 182, y = 192, width = 72, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 186, width = 72, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 81, y = 397, width = 54, height = 99 }, -- deaths/sawbladeLeft
    { x = 139, y = 397, width = 38, height = 103 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 124, height = 78, sourceX = 0, sourceY = 2, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 128, y = 2, width = 116, height = 110, sourceX = 0, sourceY = 0, sourceWidth = 115, sourceHeight = 110 }, -- head
    { x = 2, y = 82, width = 78, height = 52, sourceX = 26, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 120, y = 114, width = 76, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 48 }, -- misc/eyes_closed
    { x = 2, y = 136, width = 76, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 48 }, -- misc/eyes_dead
    { x = 104, y = 164, width = 76, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 48 }, -- misc/eyes_normal
    { x = 76, y = 214, width = 64, height = 50 }, -- tail
    { x = 198, y = 114, width = 54, height = 36, sourceX = 2, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 304, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
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
