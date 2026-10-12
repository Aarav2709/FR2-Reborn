-- Sprite sheet of c37s2 (images/monsters/c37s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 230, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 40, y = 230, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 160, y = 196, width = 20, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 43 }, -- arm_l_lower
    { x = 206, y = 192, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 35 }, -- arm_l_upper
    { x = 152, y = 150, width = 22, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 43 }, -- arm_r_lower
    { x = 182, y = 192, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_r_upper
    { x = 181, y = 306, width = 45, height = 40 }, -- deaths/body
    { x = 184, y = 234, width = 68, height = 68 }, -- deaths/headSingle
    { x = 10, y = 250, width = 63, height = 63 }, -- deaths/headSingleShot
    { x = 184, y = 2, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 68, height = 112, sourceX = 16, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 116, width = 68, height = 112, sourceX = 16, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 80, y = 244, width = 50, height = 91 }, -- deaths/sawbladeLeft
    { x = 134, y = 244, width = 43, height = 95 }, -- deaths/sawbladeRight
    { x = 78, y = 102, width = 98, height = 46, sourceX = 16, sourceY = 8, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 78, y = 2, width = 104, height = 98, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 72, y = 194, width = 28, height = 34, sourceX = 60, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 78, y = 150, width = 72, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 176, y = 152, width = 72, height = 38, sourceX = 0, sourceY = 2, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 178, y = 106, width = 72, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 2, y = 248, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 184, y = 64, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 102, y = 196, width = 56, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 52 }, -- torso_upper
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
