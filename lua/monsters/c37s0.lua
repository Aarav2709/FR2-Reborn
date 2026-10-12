-- Sprite sheet of c37s0 (images/monsters/c37s0/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 2, y = 238, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0l
    { x = 40, y = 238, width = 36, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 36, sourceHeight = 15 }, -- 0r
    { x = 92, y = 150, width = 20, height = 38 }, -- arm_l_lower
    { x = 150, y = 188, width = 20, height = 36, sourceX = 0, sourceY = 0, sourceWidth = 20, sourceHeight = 35 }, -- arm_l_upper
    { x = 68, y = 190, width = 22, height = 40, sourceX = 0, sourceY = 0, sourceWidth = 21, sourceHeight = 40 }, -- arm_r_lower
    { x = 68, y = 150, width = 22, height = 38, sourceX = 0, sourceY = 0, sourceWidth = 22, sourceHeight = 37 }, -- arm_r_upper
    { x = 68, y = 321, width = 46, height = 40 }, -- deaths/body
    { x = 80, y = 246, width = 66, height = 71 }, -- deaths/headSingle
    { x = 2, y = 258, width = 62, height = 65 }, -- deaths/headSingleShot
    { x = 184, y = 44, width = 58, height = 60 }, -- deaths/headSkull
    { x = 2, y = 2, width = 64, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 2, y = 120, width = 64, height = 116, sourceX = 18, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 152, y = 228, width = 54, height = 94 }, -- deaths/sawbladeLeft
    { x = 210, y = 192, width = 40, height = 96 }, -- deaths/sawbladeRight
    { x = 78, y = 2, width = 104, height = 48, sourceX = 10, sourceY = 6, sourceWidth = 123, sourceHeight = 92 }, -- hair
    { x = 78, y = 52, width = 102, height = 96, sourceX = 10, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 172, y = 190, width = 32, height = 34, sourceX = 56, sourceY = 0, sourceWidth = 104, sourceHeight = 51 }, -- head_lower
    { x = 182, y = 106, width = 72, height = 40 }, -- misc/eyes_closed
    { x = 184, y = 2, width = 68, height = 40, sourceX = 2, sourceY = 0, sourceWidth = 72, sourceHeight = 40 }, -- misc/eyes_dead
    { x = 182, y = 148, width = 72, height = 40 }, -- misc/eyes_normal
    { x = 68, y = 2, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 114, y = 150, width = 54, height = 36, sourceX = 2, sourceY = 0, sourceWidth = 58, sourceHeight = 39 }, -- torso_lower
    { x = 92, y = 190, width = 56, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 57, sourceHeight = 52 }, -- torso_upper
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
