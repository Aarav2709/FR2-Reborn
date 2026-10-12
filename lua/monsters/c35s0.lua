-- Sprite sheet of c35s0 (images/monsters/c35s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 44, y = 230, width = 38, height = 14 }, -- 0l
    { x = 2, y = 230, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 15 }, -- 0r
    { x = 162, y = 106, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 35 }, -- arm_l_lower
    { x = 162, y = 144, width = 20, height = 34 }, -- arm_l_upper
    { x = 64, y = 2, width = 18, height = 36 }, -- arm_r_lower
    { x = 64, y = 194, width = 20, height = 30, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 29 }, -- arm_r_upper
    { x = 178, y = 270, width = 47, height = 39 }, -- deaths/body
    { x = 160, y = 196, width = 65, height = 70 }, -- deaths/headSingle
    { x = 10, y = 250, width = 62, height = 64 }, -- deaths/headSingleShot
    { x = 186, y = 88, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 60, height = 112, sourceX = 20, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 116, width = 60, height = 112, sourceX = 20, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 86, y = 242, width = 48, height = 92 }, -- deaths/sawbladeLeft
    { x = 138, y = 270, width = 36, height = 95 }, -- deaths/sawbladeRight
    { x = 2, y = 248, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 17, sourceHeight = 16 }, -- hair
    { x = 84, y = 2, width = 100, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 84, y = 106, width = 76, height = 44, sourceX = 28, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 184, y = 150, width = 70, height = 42 }, -- misc/eyes_closed
    { x = 86, y = 152, width = 70, height = 42 }, -- misc/eyes_dead
    { x = 86, y = 196, width = 70, height = 42 }, -- misc/eyes_normal
    { x = 2, y = 248, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 186, y = 48, width = 64, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 64, sourceHeight = 39 }, -- torso_lower
    { x = 186, y = 2, width = 66, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 65, sourceHeight = 44 }, -- torso_upper
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
