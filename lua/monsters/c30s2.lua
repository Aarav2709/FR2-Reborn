-- Sprite sheet of c30s2 (images/monsters/c30s2/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 176, y = 102, width = 38, height = 16, sourceX = 2, sourceY = 0, sourceWidth = 42, sourceHeight = 16 }, -- 0l
    { x = 52, y = 466, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 16 }, -- 0r
    { x = 218, y = 76, width = 22, height = 36 }, -- arm_l_lower
    { x = 84, y = 92, width = 22, height = 32 }, -- arm_l_upper
    { x = 84, y = 54, width = 22, height = 36 }, -- arm_r_lower
    { x = 80, y = 126, width = 22, height = 32 }, -- arm_r_upper
    { x = 221, y = 2, width = 29, height = 40 }, -- deaths/body
    { x = 3, y = 249, width = 58, height = 63 }, -- deaths/headSingle
    { x = 65, y = 258, width = 58, height = 58 }, -- deaths/headSingleShot
    { x = 52, y = 404, width = 58, height = 60 }, -- deaths/headSkull
    { x = 102, y = 144, width = 64, height = 110, sourceX = 16, sourceY = 6, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 168, y = 162, width = 64, height = 110, sourceX = 16, sourceY = 6, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 3, y = 316, width = 56, height = 85 }, -- deaths/sawbladeLeft
    { x = 5, y = 406, width = 43, height = 86 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 108, height = 50, sourceX = 6, sourceY = 18, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 112, y = 2, width = 104, height = 98, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 198, width = 64, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 63, sourceHeight = 48 }, -- head_lower
    { x = 2, y = 104, width = 76, height = 44, sourceX = 4, sourceY = 0, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_closed
    { x = 106, y = 102, width = 68, height = 40, sourceX = 8, sourceY = 2, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_dead
    { x = 2, y = 54, width = 80, height = 48, sourceX = 0, sourceY = 0, sourceWidth = 80, sourceHeight = 47 }, -- misc/eyes_normal
    { x = 218, y = 44, width = 26, height = 30, sourceX = 0, sourceY = 0, sourceWidth = 26, sourceHeight = 29 }, -- tail
    { x = 176, y = 120, width = 66, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 66, sourceHeight = 39 }, -- torso_lower
    { x = 2, y = 148, width = 66, height = 48 }, -- torso_upper
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
