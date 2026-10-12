-- Sprite sheet of c41s2 (images/monsters/c41s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 234, width = 40, height = 18 }, -- 0l
    { x = 44, y = 234, width = 38, height = 18, sourceX = 0, sourceY = 0, sourceWidth = 38, sourceHeight = 17 }, -- 0r
    { x = 174, y = 202, width = 20, height = 36, sourceX = 0, sourceY = 2, sourceWidth = 19, sourceHeight = 39 }, -- arm_l_lower
    { x = 76, y = 202, width = 16, height = 30, sourceX = 2, sourceY = 0, sourceWidth = 20, sourceHeight = 30 }, -- arm_l_upper
    { x = 196, y = 202, width = 20, height = 34, sourceX = 0, sourceY = 2, sourceWidth = 19, sourceHeight = 36 }, -- arm_r_lower
    { x = 236, y = 150, width = 18, height = 32, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 32 }, -- arm_r_upper
    { x = 175, y = 314, width = 45, height = 38 }, -- deaths/body
    { x = 176, y = 242, width = 64, height = 68 }, -- deaths/headSingle
    { x = 2, y = 256, width = 60, height = 62 }, -- deaths/headSingleShot
    { x = 186, y = 2, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 72, height = 114, sourceX = 10, sourceY = 2, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 118, width = 72, height = 114, sourceX = 10, sourceY = 2, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 86, y = 254, width = 48, height = 89 }, -- deaths/sawbladeLeft
    { x = 138, y = 254, width = 33, height = 92 }, -- deaths/sawbladeRight
    { x = 84, y = 104, width = 98, height = 46, sourceX = 12, sourceY = 6, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 84, y = 2, width = 100, height = 100, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 246, y = 2, width = 8, height = 8, sourceX = 48, sourceY = 22, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 76, y = 152, width = 78, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 48 }, -- misc/eyes_closed
    { x = 94, y = 202, width = 78, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 48 }, -- misc/eyes_dead
    { x = 156, y = 152, width = 78, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 77, sourceHeight = 48 }, -- misc/eyes_normal
    { x = 76, y = 2, width = 6, height = 8, sourceX = 10, sourceY = 10, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 184, y = 110, width = 54, height = 38, sourceX = 2, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 186, y = 64, width = 54, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 43 }, -- torso_upper
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
