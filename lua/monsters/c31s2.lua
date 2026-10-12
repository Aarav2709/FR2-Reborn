-- Sprite sheet of c31s2 (images/monsters/c31s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 140, y = 284, width = 38, height = 16 }, -- 0l
    { x = 180, y = 284, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 35, sourceHeight = 16 }, -- 0r
    { x = 230, y = 2, width = 22, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 41 }, -- arm_l_lower
    { x = 230, y = 90, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 39 }, -- arm_l_upper
    { x = 88, y = 64, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_r_lower
    { x = 230, y = 46, width = 22, height = 42 }, -- arm_r_upper
    { x = 74, y = 405, width = 65, height = 34 }, -- deaths/body
    { x = 64, y = 312, width = 71, height = 82 }, -- deaths/headSingle
    { x = 2, y = 398, width = 68, height = 77 }, -- deaths/headSingleShot
    { x = 2, y = 268, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 64, width = 84, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 88, y = 104, width = 84, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 142, y = 304, width = 68, height = 97 }, -- deaths/sawbladeLeft
    { x = 214, y = 304, width = 37, height = 103 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 116, height = 60, sourceX = 6, sourceY = 0, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 120, y = 2, width = 108, height = 100, sourceX = 6, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 174, y = 104, width = 54, height = 52, sourceX = 12, sourceY = 0, sourceWidth = 66, sourceHeight = 55 }, -- head_lower
    { x = 80, y = 222, width = 74, height = 42, sourceX = 4, sourceY = 0, sourceWidth = 80, sourceHeight = 41 }, -- misc/eyes_closed
    { x = 2, y = 226, width = 68, height = 40, sourceX = 6, sourceY = 0, sourceWidth = 80, sourceHeight = 41 }, -- misc/eyes_dead
    { x = 2, y = 182, width = 76, height = 42, sourceX = 2, sourceY = 0, sourceWidth = 80, sourceHeight = 41 }, -- misc/eyes_normal
    { x = 174, y = 158, width = 78, height = 74 }, -- tail
    { x = 72, y = 266, width = 66, height = 42 }, -- torso_lower
    { x = 156, y = 234, width = 66, height = 48 }, -- torso_upper
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
