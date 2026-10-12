-- Sprite sheet of c35s1 (images/monsters/c35s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 44, y = 110, width = 40, height = 14 }, -- 0l
    { x = 2, y = 110, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 15 }, -- 0r
    { x = 460, y = 2, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 19, sourceHeight = 35 }, -- arm_l_lower
    { x = 444, y = 90, width = 18, height = 32, sourceX = 0, sourceY = 0, sourceWidth = 18, sourceHeight = 31 }, -- arm_l_upper
    { x = 482, y = 2, width = 18, height = 36 }, -- arm_r_lower
    { x = 464, y = 90, width = 18, height = 30 }, -- arm_r_upper
    { x = 128, y = 122, width = 48, height = 39 }, -- deaths/body
    { x = 242, y = 116, width = 67, height = 71 }, -- deaths/headSingle
    { x = 367, y = 116, width = 64, height = 65 }, -- deaths/headSingleShot
    { x = 384, y = 52, width = 58, height = 60 }, -- deaths/headSkull
    { x = 112, y = 2, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 176, y = 2, width = 62, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 313, y = 116, width = 50, height = 92 }, -- deaths/sawbladeLeft
    { x = 88, y = 122, width = 36, height = 96 }, -- deaths/sawbladeRight
    { x = 86, y = 110, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 17, sourceHeight = 16 }, -- hair
    { x = 2, y = 2, width = 108, height = 106, sourceX = 6, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 314, y = 2, width = 76, height = 48, sourceX = 28, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 240, y = 58, width = 70, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 70, sourceHeight = 53 }, -- misc/eyes_closed
    { x = 312, y = 58, width = 70, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 70, sourceHeight = 53 }, -- misc/eyes_dead
    { x = 240, y = 2, width = 72, height = 54, sourceX = 0, sourceY = 0, sourceWidth = 71, sourceHeight = 53 }, -- misc/eyes_normal
    { x = 86, y = 110, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 444, y = 48, width = 64, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 64, sourceHeight = 39 }, -- torso_lower
    { x = 392, y = 2, width = 66, height = 44, sourceX = 0, sourceY = 0, sourceWidth = 65, sourceHeight = 44 }, -- torso_upper
  },
  sheetContentWidth = 512,
  sheetContentHeight = 256
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
