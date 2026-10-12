-- Sprite sheet of c21s3 (images/monsters/c21s3/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 218, y = 2, width = 36, height = 16 }, -- 0l
    { x = 218, y = 20, width = 36, height = 16 }, -- 0r
    { x = 218, y = 38, width = 30, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 29, sourceHeight = 33 }, -- arm_l_lower
    { x = 174, y = 114, width = 22, height = 30 }, -- arm_l_upper
    { x = 136, y = 232, width = 30, height = 34, sourceX = 0, sourceY = 0, sourceWidth = 29, sourceHeight = 33 }, -- arm_r_lower
    { x = 144, y = 172, width = 22, height = 30 }, -- arm_r_upper
    { x = 39, y = 375, width = 44, height = 32 }, -- deaths/body
    { x = 64, y = 296, width = 66, height = 75 }, -- deaths/headSingle
    { x = 134, y = 306, width = 66, height = 71 }, -- deaths/headSingleShot
    { x = 76, y = 232, width = 58, height = 60 }, -- deaths/headSkull
    { x = 174, y = 146, width = 72, height = 112, sourceX = 12, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 164, width = 72, height = 112, sourceX = 12, sourceY = 4, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 204, y = 306, width = 47, height = 91 }, -- deaths/sawbladeLeft
    { x = 2, y = 332, width = 33, height = 94 }, -- deaths/sawbladeRight
    { x = 110, y = 2, width = 106, height = 52, sourceX = 10, sourceY = 6, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 2, y = 2, width = 106, height = 102, sourceX = 10, sourceY = 0, sourceWidth = 127, sourceHeight = 106 }, -- head
    { x = 198, y = 74, width = 52, height = 48, sourceX = 30, sourceY = 2, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 110, y = 56, width = 86, height = 56 }, -- misc/eyes_closed
    { x = 90, y = 114, width = 82, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 86, sourceHeight = 56 }, -- misc/eyes_dead
    { x = 2, y = 106, width = 86, height = 56 }, -- misc/eyes_normal
    { x = 76, y = 172, width = 66, height = 58, sourceX = 0, sourceY = 2, sourceWidth = 67, sourceHeight = 61 }, -- tail
    { x = 168, y = 260, width = 58, height = 42 }, -- torso_lower
    { x = 2, y = 278, width = 58, height = 50, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 50 }, -- torso_upper
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
