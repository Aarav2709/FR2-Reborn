-- Sprite sheet of c26s4 (images/monsters/c26s4/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 82, y = 72, width = 34, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 82, y = 90, width = 34, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 234, y = 2, width = 18, height = 32 }, -- arm_l_lower
    { x = 226, y = 70, width = 22, height = 28 }, -- arm_l_upper
    { x = 234, y = 36, width = 18, height = 32 }, -- arm_r_lower
    { x = 226, y = 100, width = 22, height = 28 }, -- arm_r_upper
    { x = 212, y = 276, width = 39, height = 34 }, -- deaths/body
    { x = 160, y = 324, width = 80, height = 86 }, -- deaths/headSingle
    { x = 58, y = 326, width = 76, height = 81 }, -- deaths/headSingleShot
    { x = 2, y = 228, width = 58, height = 60 }, -- deaths/headSkull
    { x = 162, y = 156, width = 74, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 82, y = 206, width = 74, height = 116, sourceX = 10, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 336, width = 52, height = 98 }, -- deaths/sawbladeLeft
    { x = 58, y = 411, width = 38, height = 100 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 118, height = 68, sourceX = 12, sourceY = 4, sourceWidth = 138, sourceHeight = 92 }, -- hair
    { x = 122, y = 56, width = 102, height = 98, sourceX = 8, sourceY = 2, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 122, y = 2, width = 110, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 129, sourceHeight = 52 }, -- head_lower
    { x = 2, y = 130, width = 78, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 55 }, -- misc/eyes_closed
    { x = 82, y = 156, width = 78, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 55 }, -- misc/eyes_dead
    { x = 2, y = 72, width = 78, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 55 }, -- misc/eyes_normal
    { x = 2, y = 182, width = 78, height = 44 }, -- tail
    { x = 2, y = 290, width = 52, height = 42, sourceX = 4, sourceY = 0, sourceWidth = 58, sourceHeight = 41 }, -- torso_lower
    { x = 158, y = 274, width = 50, height = 46, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 46 }, -- torso_upper
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
