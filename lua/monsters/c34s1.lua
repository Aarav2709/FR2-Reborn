-- Sprite sheet of c34s1 (images/monsters/c34s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 208, y = 130, width = 38, height = 16 }, -- 0l
    { x = 208, y = 148, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 37, sourceHeight = 16 }, -- 0r
    { x = 230, y = 2, width = 22, height = 44 }, -- arm_l_lower
    { x = 230, y = 90, width = 20, height = 38 }, -- arm_l_upper
    { x = 94, y = 96, width = 26, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 48 }, -- arm_r_lower
    { x = 230, y = 48, width = 22, height = 40 }, -- arm_r_upper
    { x = 199, y = 457, width = 52, height = 52 }, -- deaths/body
    { x = 2, y = 378, width = 77, height = 91 }, -- deaths/headSingle
    { x = 83, y = 471, width = 77, height = 86 }, -- deaths/headSingleShot
    { x = 166, y = 276, width = 58, height = 60 }, -- deaths/headSkull
    { x = 122, y = 102, width = 84, height = 126, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 125 }, -- deaths/lightning1
    { x = 2, y = 152, width = 84, height = 126, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 125 }, -- deaths/lightning2
    { x = 136, y = 340, width = 59, height = 127 }, -- deaths/sawbladeLeft
    { x = 199, y = 340, width = 40, height = 113 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 126, height = 92, sourceX = 0, sourceY = 0, sourceWidth = 125, sourceHeight = 92 }, -- hair
    { x = 130, y = 2, width = 98, height = 98, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 280, width = 70, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 69, sourceHeight = 49 }, -- head_lower
    { x = 88, y = 230, width = 76, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_closed
    { x = 166, y = 230, width = 76, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_dead
    { x = 88, y = 276, width = 76, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 78, sourceHeight = 43 }, -- misc/eyes_normal
    { x = 2, y = 96, width = 90, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 89, sourceHeight = 53 }, -- tail
    { x = 2, y = 332, width = 58, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 74, y = 322, width = 58, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 52 }, -- torso_upper
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
