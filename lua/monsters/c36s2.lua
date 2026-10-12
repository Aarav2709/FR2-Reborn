-- Sprite sheet of c36s2 (images/monsters/c36s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 2, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 37, sourceHeight = 15 }, -- 0l
    { x = 208, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 198, y = 88, width = 26, height = 44 }, -- arm_l_lower
    { x = 226, y = 126, width = 20, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 37 }, -- arm_l_upper
    { x = 208, y = 38, width = 26, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 48 }, -- arm_r_lower
    { x = 226, y = 88, width = 22, height = 36 }, -- arm_r_upper
    { x = 2, y = 448, width = 68, height = 44 }, -- deaths/body
    { x = 64, y = 352, width = 65, height = 92 }, -- deaths/headSingle
    { x = 133, y = 403, width = 61, height = 86 }, -- deaths/headSingleShot
    { x = 2, y = 314, width = 58, height = 60 }, -- deaths/headSkull
    { x = 106, y = 64, width = 90, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 104, width = 90, height = 116, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 134, y = 282, width = 76, height = 117 }, -- deaths/sawbladeLeft
    { x = 214, y = 282, width = 38, height = 100 }, -- deaths/sawbladeRight
    { x = 106, y = 2, width = 100, height = 60, sourceX = 16, sourceY = 10, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 102, height = 100, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 72, y = 280, width = 58, height = 68, sourceX = 2, sourceY = 0, sourceWidth = 62, sourceHeight = 68 }, -- head_lower
    { x = 80, y = 234, width = 74, height = 44, sourceX = 10, sourceY = 0, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_closed
    { x = 184, y = 182, width = 70, height = 40, sourceX = 12, sourceY = 2, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_dead
    { x = 2, y = 222, width = 76, height = 46, sourceX = 8, sourceY = 0, sourceWidth = 91, sourceHeight = 45 }, -- misc/eyes_normal
    { x = 94, y = 182, width = 88, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 88, sourceHeight = 49 }, -- tail
    { x = 2, y = 270, width = 68, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 67, sourceHeight = 42 }, -- torso_lower
    { x = 184, y = 224, width = 68, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 67, sourceHeight = 54 }, -- torso_upper
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
