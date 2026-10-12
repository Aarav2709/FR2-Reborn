-- Sprite sheet of c38s0 (images/monsters/c38s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 210, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 210, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 210, y = 38, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_l_lower
    { x = 186, y = 104, width = 22, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_l_upper
    { x = 210, y = 80, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_r_lower
    { x = 160, y = 158, width = 22, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_r_upper
    { x = 183, y = 371, width = 51, height = 41 }, -- deaths/body
    { x = 114, y = 304, width = 65, height = 71 }, -- deaths/headSingle
    { x = 183, y = 304, width = 65, height = 63 }, -- deaths/headSingleShot
    { x = 2, y = 168, width = 58, height = 60 }, -- deaths/headSkull
    { x = 186, y = 138, width = 66, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 92, y = 158, width = 66, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 286, width = 54, height = 95 }, -- deaths/sawbladeLeft
    { x = 60, y = 314, width = 40, height = 97 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 104, height = 52, sourceX = 10, sourceY = 8, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 108, y = 2, width = 100, height = 100, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 62, y = 276, width = 48, height = 34, sourceX = 6, sourceY = 0, sourceWidth = 57, sourceHeight = 41 }, -- head_lower
    { x = 96, y = 104, width = 88, height = 52, sourceX = 2, sourceY = 0, sourceWidth = 91, sourceHeight = 56 }, -- misc/eyes_closed
    { x = 2, y = 114, width = 88, height = 52, sourceX = 2, sourceY = 0, sourceWidth = 91, sourceHeight = 56 }, -- misc/eyes_dead
    { x = 2, y = 56, width = 92, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 91, sourceHeight = 56 }, -- misc/eyes_normal
    { x = 160, y = 192, width = 22, height = 24, sourceX = 2, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 160, y = 256, width = 58, height = 44, sourceX = 0, sourceY = 4, sourceWidth = 58, sourceHeight = 47 }, -- torso_lower
    { x = 2, y = 230, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
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
