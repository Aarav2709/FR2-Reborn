-- Sprite sheet of c37s1 (images/monsters/c37s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 76, y = 228, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 72, y = 246, width = 34, height = 16, sourceX = 2, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 224, y = 142, width = 20, height = 40 }, -- arm_l_lower
    { x = 224, y = 184, width = 20, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 39 }, -- arm_l_upper
    { x = 224, y = 100, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_r_lower
    { x = 114, y = 228, width = 20, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 39 }, -- arm_r_upper
    { x = 2, y = 278, width = 47, height = 37 }, -- deaths/body
    { x = 74, y = 272, width = 83, height = 77 }, -- deaths/headSingle
    { x = 2, y = 353, width = 83, height = 70 }, -- deaths/headSingleShot
    { x = 82, y = 166, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 70, width = 78, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 144, y = 100, width = 78, height = 116, sourceX = 8, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 161, y = 272, width = 65, height = 98 }, -- deaths/sawbladeLeft
    { x = 89, y = 353, width = 43, height = 101 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 140, height = 66, sourceX = 0, sourceY = 0, sourceWidth = 139, sourceHeight = 95 }, -- hair
    { x = 144, y = 2, width = 104, height = 96, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 216, y = 226, width = 38, height = 42, sourceX = 50, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 142, y = 218, width = 72, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 2, y = 234, width = 68, height = 40, sourceX = 2, sourceY = 0, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 2, y = 188, width = 72, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 72, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 250, y = 2, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 82, y = 124, width = 60, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 60, sourceHeight = 39 }, -- torso_lower
    { x = 82, y = 70, width = 60, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 59, sourceHeight = 52 }, -- torso_upper
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
