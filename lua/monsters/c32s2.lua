-- Sprite sheet of c32s2 (images/monsters/c32s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 202, y = 114, width = 34, height = 14, sourceX = 0, sourceY = 0, sourceWidth = 34, sourceHeight = 13 }, -- 0l
    { x = 78, y = 122, width = 34, height = 14, sourceX = 0, sourceY = 0, sourceWidth = 34, sourceHeight = 13 }, -- 0r
    { x = 78, y = 138, width = 20, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 33 }, -- arm_l_lower
    { x = 170, y = 204, width = 18, height = 30, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 29 }, -- arm_l_upper
    { x = 74, y = 174, width = 20, height = 34 }, -- arm_r_lower
    { x = 170, y = 170, width = 18, height = 32, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 32 }, -- arm_r_upper
    { x = 60, y = 212, width = 29, height = 26 }, -- deaths/body
    { x = 2, y = 266, width = 74, height = 91 }, -- deaths/headSingle
    { x = 80, y = 290, width = 72, height = 87 }, -- deaths/headSingleShot
    { x = 190, y = 130, width = 58, height = 60 }, -- deaths/headSkull
    { x = 100, y = 170, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 170, y = 242, width = 68, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 2, y = 361, width = 54, height = 100 }, -- deaths/sawbladeLeft
    { x = 156, y = 362, width = 38, height = 105 }, -- deaths/sawbladeRight
    { x = 120, y = 2, width = 116, height = 70, sourceX = 4, sourceY = 0, sourceWidth = 124, sourceHeight = 94 }, -- hair
    { x = 2, y = 2, width = 116, height = 118, sourceX = 0, sourceY = 0, sourceWidth = 115, sourceHeight = 117 }, -- head
    { x = 120, y = 74, width = 80, height = 48, sourceX = 22, sourceY = 4, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 122, width = 74, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 2, y = 168, width = 70, height = 40, sourceX = 2, sourceY = 4, sourceWidth = 75, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 114, y = 124, width = 74, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 75, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 190, y = 192, width = 56, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 56, sourceHeight = 47 }, -- tail
    { x = 202, y = 74, width = 48, height = 38, sourceX = 6, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 210, width = 54, height = 52, sourceX = 2, sourceY = 0, sourceWidth = 57, sourceHeight = 51 }, -- torso_upper
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
