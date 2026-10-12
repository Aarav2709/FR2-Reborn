-- Sprite sheet of c16s4 (images/monsters/c16s4/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 212, y = 20, width = 40, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 39, sourceHeight = 15 }, -- 0l
    { x = 212, y = 2, width = 42, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 41, sourceHeight = 15 }, -- 0r
    { x = 212, y = 38, width = 36, height = 42, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 41 }, -- arm_l_lower
    { x = 70, y = 228, width = 22, height = 36 }, -- arm_l_upper
    { x = 212, y = 82, width = 36, height = 40, sourceX = 0, sourceY = 2, sourceWidth = 36, sourceHeight = 41 }, -- arm_r_lower
    { x = 176, y = 168, width = 22, height = 36 }, -- arm_r_upper
    { x = 72, y = 186, width = 23, height = 40 }, -- deaths/body
    { x = 98, y = 226, width = 65, height = 68 }, -- deaths/headSingle
    { x = 70, y = 300, width = 65, height = 67 }, -- deaths/headSingleShot
    { x = 66, y = 406, width = 58, height = 60 }, -- deaths/headSkull
    { x = 176, y = 210, width = 66, height = 116, sourceX = 20, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 186, width = 66, height = 116, sourceX = 20, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 3, y = 305, width = 62, height = 97 }, -- deaths/sawbladeLeft
    { x = 3, y = 407, width = 60, height = 98 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 104, height = 66, sourceX = 4, sourceY = 14, sourceWidth = 110, sourceHeight = 87 }, -- hair
    { x = 106, y = 2, width = 104, height = 106, sourceX = 8, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 100, y = 168, width = 74, height = 54, sourceX = 36, sourceY = 0, sourceWidth = 115, sourceHeight = 54 }, -- head_lower
    { x = 2, y = 70, width = 96, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 57 }, -- misc/eyes_closed
    { x = 100, y = 110, width = 96, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 57 }, -- misc/eyes_dead
    { x = 2, y = 128, width = 96, height = 56, sourceX = 0, sourceY = 0, sourceWidth = 95, sourceHeight = 57 }, -- misc/eyes_normal
    { x = 138, y = 298, width = 36, height = 28, sourceX = 0, sourceY = 0, sourceWidth = 37, sourceHeight = 27 }, -- tail
    { x = 196, y = 124, width = 50, height = 40, sourceX = 4, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 198, y = 166, width = 46, height = 42, sourceX = 6, sourceY = 0, sourceWidth = 57, sourceHeight = 41 }, -- torso_upper
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
