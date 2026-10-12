-- Sprite sheet of c38s1 (images/monsters/c38s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 178, y = 104, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 216, y = 120, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 222, y = 2, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_l_lower
    { x = 222, y = 86, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_l_upper
    { x = 222, y = 44, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_r_lower
    { x = 86, y = 60, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 31 }, -- arm_r_upper
    { x = 63, y = 379, width = 51, height = 38 }, -- deaths/body
    { x = 63, y = 302, width = 71, height = 73 }, -- deaths/headSingle
    { x = 138, y = 308, width = 68, height = 67 }, -- deaths/headSingleShot
    { x = 2, y = 158, width = 58, height = 60 }, -- deaths/headSkull
    { x = 178, y = 138, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 78, y = 146, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 302, width = 57, height = 95 }, -- deaths/sawbladeLeft
    { x = 210, y = 258, width = 42, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 112, height = 56, sourceX = 6, sourceY = 4, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 116, y = 2, width = 104, height = 100, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 62, y = 264, width = 48, height = 34, sourceX = 6, sourceY = 0, sourceWidth = 57, sourceHeight = 41 }, -- head_lower
    { x = 2, y = 112, width = 74, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 81, sourceHeight = 49 }, -- misc/eyes_closed
    { x = 106, y = 104, width = 70, height = 40, sourceX = 6, sourceY = 2, sourceWidth = 81, sourceHeight = 49 }, -- misc/eyes_dead
    { x = 2, y = 60, width = 82, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 49 }, -- misc/eyes_normal
    { x = 86, y = 94, width = 18, height = 24, sourceX = 4, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 148, y = 256, width = 58, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 47 }, -- torso_lower
    { x = 2, y = 220, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
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
