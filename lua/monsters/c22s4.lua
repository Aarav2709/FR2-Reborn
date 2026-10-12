-- Sprite sheet of c22s4 (images/monsters/c22s4/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 150, y = 208, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 150, y = 226, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 220, y = 2, width = 24, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 24, sourceHeight = 41 }, -- arm_l_lower
    { x = 220, y = 90, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_l_upper
    { x = 220, y = 46, width = 24, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 24, sourceHeight = 41 }, -- arm_r_lower
    { x = 86, y = 98, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_r_upper
    { x = 152, y = 246, width = 32, height = 26 }, -- deaths/body
    { x = 56, y = 298, width = 71, height = 99 }, -- deaths/headSingle
    { x = 131, y = 366, width = 70, height = 97 }, -- deaths/headSingleShot
    { x = 194, y = 130, width = 58, height = 60 }, -- deaths/headSkull
    { x = 86, y = 168, width = 62, height = 126, sourceX = 20, sourceY = 0, sourceWidth = 95, sourceHeight = 126 }, -- deaths/lightning1
    { x = 188, y = 236, width = 62, height = 126, sourceX = 20, sourceY = 0, sourceWidth = 95, sourceHeight = 126 }, -- deaths/lightning2
    { x = 2, y = 340, width = 48, height = 109 }, -- deaths/sawbladeLeft
    { x = 205, y = 366, width = 36, height = 114 }, -- deaths/sawbladeRight
    { x = 112, y = 2, width = 106, height = 100, sourceX = 0, sourceY = 0, sourceWidth = 105, sourceHeight = 99 }, -- hair
    { x = 2, y = 2, width = 108, height = 94, sourceX = 4, sourceY = 0, sourceWidth = 115, sourceHeight = 110 }, -- head
    { x = 150, y = 168, width = 42, height = 38, sourceX = 4, sourceY = 2, sourceWidth = 46, sourceHeight = 45 }, -- head_lower
    { x = 2, y = 98, width = 82, height = 62, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 61 }, -- misc/eyes_closed
    { x = 110, y = 104, width = 82, height = 62, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 61 }, -- misc/eyes_dead
    { x = 2, y = 162, width = 82, height = 62, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 61 }, -- misc/eyes_normal
    { x = 2, y = 286, width = 50, height = 50, sourceX = 2, sourceY = 0, sourceWidth = 51, sourceHeight = 50 }, -- tail
    { x = 194, y = 192, width = 58, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 45 }, -- torso_lower
    { x = 2, y = 226, width = 56, height = 58, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 57 }, -- torso_upper
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
