-- Sprite sheet of c34s0 (images/monsters/c34s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 202, y = 126, width = 36, height = 16 }, -- 0l
    { x = 202, y = 144, width = 36, height = 16 }, -- 0r
    { x = 230, y = 44, width = 20, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 39 }, -- arm_l_lower
    { x = 230, y = 86, width = 20, height = 38 }, -- arm_l_upper
    { x = 94, y = 96, width = 18, height = 38 }, -- arm_r_lower
    { x = 230, y = 2, width = 22, height = 40 }, -- arm_r_upper
    { x = 186, y = 437, width = 53, height = 52 }, -- deaths/body
    { x = 2, y = 362, width = 77, height = 92 }, -- deaths/headSingle
    { x = 83, y = 451, width = 77, height = 86 }, -- deaths/headSingleShot
    { x = 178, y = 256, width = 58, height = 60 }, -- deaths/headSkull
    { x = 94, y = 148, width = 82, height = 126, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 125 }, -- deaths/lightning1
    { x = 2, y = 152, width = 82, height = 126, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 125 }, -- deaths/lightning2
    { x = 124, y = 320, width = 58, height = 127 }, -- deaths/sawbladeLeft
    { x = 186, y = 320, width = 39, height = 113 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 126, height = 92, sourceX = 0, sourceY = 0, sourceWidth = 125, sourceHeight = 92 }, -- hair
    { x = 130, y = 2, width = 98, height = 102, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 178, y = 204, width = 68, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 69, sourceHeight = 49 }, -- head_lower
    { x = 86, y = 276, width = 78, height = 40, sourceX = 2, sourceY = 0, sourceWidth = 86, sourceHeight = 40 }, -- misc/eyes_closed
    { x = 178, y = 162, width = 70, height = 40, sourceX = 6, sourceY = 0, sourceWidth = 86, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 114, y = 106, width = 86, height = 40 }, -- misc/eyes_normal
    { x = 2, y = 96, width = 90, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 53 }, -- tail
    { x = 62, y = 318, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 280, width = 58, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 50 }, -- torso_upper
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
