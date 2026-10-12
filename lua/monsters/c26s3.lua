-- Sprite sheet of c26s3 (images/monsters/c26s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 94, y = 164, width = 32, height = 16, sourceX = 2, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 94, y = 182, width = 32, height = 16, sourceX = 2, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 234, y = 106, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 32 }, -- arm_l_lower
    { x = 230, y = 174, width = 18, height = 30, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 30 }, -- arm_l_upper
    { x = 234, y = 140, width = 20, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 32 }, -- arm_r_lower
    { x = 230, y = 206, width = 18, height = 30, sourceX = 2, sourceY = 0, sourceWidth = 22, sourceHeight = 30 }, -- arm_r_upper
    { x = 96, y = 202, width = 37, height = 30 }, -- deaths/body
    { x = 132, y = 380, width = 94, height = 110 }, -- deaths/headSingle
    { x = 2, y = 416, width = 91, height = 107 }, -- deaths/headSingleShot
    { x = 2, y = 352, width = 58, height = 60 }, -- deaths/headSkull
    { x = 138, y = 162, width = 90, height = 130, sourceX = 2, sourceY = 0, sourceWidth = 95, sourceHeight = 130 }, -- deaths/lightning1
    { x = 2, y = 164, width = 90, height = 130, sourceX = 2, sourceY = 0, sourceWidth = 95, sourceHeight = 130 }, -- deaths/lightning2
    { x = 97, y = 494, width = 56, height = 115 }, -- deaths/sawbladeLeft
    { x = 157, y = 494, width = 48, height = 118 }, -- deaths/sawbladeRight
    { x = 2, y = 56, width = 134, height = 106, sourceX = 2, sourceY = 0, sourceWidth = 138, sourceHeight = 106 }, -- hair
    { x = 140, y = 2, width = 102, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 2, width = 136, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 135, sourceHeight = 52 }, -- head_lower
    { x = 170, y = 294, width = 74, height = 42, sourceX = 4, sourceY = 2, sourceWidth = 77, sourceHeight = 46 }, -- misc/eyes_closed
    { x = 170, y = 338, width = 70, height = 38, sourceX = 4, sourceY = 4, sourceWidth = 77, sourceHeight = 46 }, -- misc/eyes_dead
    { x = 94, y = 294, width = 74, height = 46, sourceX = 4, sourceY = 0, sourceWidth = 77, sourceHeight = 46 }, -- misc/eyes_normal
    { x = 138, y = 106, width = 94, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 93, sourceHeight = 53 }, -- tail
    { x = 66, y = 342, width = 62, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 62, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 296, width = 62, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 62, sourceHeight = 53 }, -- torso_upper
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
