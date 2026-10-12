-- Sprite sheet of c39s2 (images/monsters/c39s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 212, y = 2, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 212, y = 20, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 212, y = 38, width = 22, height = 40 }, -- arm_l_lower
    { x = 170, y = 152, width = 22, height = 34 }, -- arm_l_upper
    { x = 170, y = 110, width = 22, height = 40 }, -- arm_r_lower
    { x = 194, y = 180, width = 22, height = 34 }, -- arm_r_upper
    { x = 210, y = 323, width = 41, height = 37 }, -- deaths/body
    { x = 138, y = 270, width = 68, height = 75 }, -- deaths/headSingle
    { x = 2, y = 330, width = 64, height = 71 }, -- deaths/headSingleShot
    { x = 194, y = 80, width = 58, height = 60 }, -- deaths/headSkull
    { x = 70, y = 162, width = 64, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 210, width = 64, height = 116, sourceX = 16, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 70, y = 282, width = 52, height = 97 }, -- deaths/sawbladeLeft
    { x = 210, y = 218, width = 35, height = 101 }, -- deaths/sawbladeRight
    { x = 110, y = 2, width = 100, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 99, sourceHeight = 53 }, -- hair
    { x = 2, y = 2, width = 106, height = 106, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 194, y = 142, width = 58, height = 36 }, -- head_lower
    { x = 110, y = 58, width = 82, height = 50 }, -- misc/eyes_closed
    { x = 2, y = 110, width = 82, height = 50 }, -- misc/eyes_dead
    { x = 86, y = 110, width = 82, height = 50 }, -- misc/eyes_normal
    { x = 236, y = 38, width = 16, height = 16, sourceX = 4, sourceY = 6, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 2, y = 162, width = 66, height = 46, sourceX = 0, sourceY = 0, sourceWidth = 65, sourceHeight = 46 }, -- torso_lower
    { x = 136, y = 216, width = 64, height = 50 }, -- torso_upper
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
