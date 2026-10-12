-- Sprite sheet of c39s1 (images/monsters/c39s1/monster.png): the parts the rig draws
-- and the death frames (lightning1 and lightning2 must stay next to each other).
local sheet = {
  frames = {
    { x = 216, y = 2, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 38, sourceHeight = 15 }, -- 0l
    { x = 216, y = 20, width = 38, height = 16, sourceX = 0, sourceY = 0, sourceWidth = 38, sourceHeight = 15 }, -- 0r
    { x = 216, y = 38, width = 22, height = 40 }, -- arm_l_lower
    { x = 86, y = 48, width = 22, height = 34 }, -- arm_l_upper
    { x = 216, y = 80, width = 22, height = 40 }, -- arm_r_lower
    { x = 86, y = 84, width = 22, height = 34 }, -- arm_r_upper
    { x = 2, y = 298, width = 41, height = 39 }, -- deaths/body
    { x = 125, y = 304, width = 71, height = 73 }, -- deaths/headSingle
    { x = 2, y = 380, width = 70, height = 68 }, -- deaths/headSingleShot
    { x = 148, y = 240, width = 58, height = 60 }, -- deaths/headSkull
    { x = 184, y = 122, width = 70, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning1
    { x = 76, y = 158, width = 70, height = 116, sourceX = 14, sourceY = 0, sourceWidth = 95, sourceHeight = 116 }, -- deaths/lightning2
    { x = 68, y = 278, width = 53, height = 98 }, -- deaths/sawbladeLeft
    { x = 210, y = 242, width = 40, height = 101 }, -- deaths/sawbladeRight
    { x = 2, y = 2, width = 108, height = 44, sourceX = 4, sourceY = 2, sourceWidth = 116, sourceHeight = 48 }, -- hair
    { x = 112, y = 2, width = 102, height = 104, sourceX = 12, sourceY = 0, sourceWidth = 115, sourceHeight = 106 }, -- head
    { x = 2, y = 48, width = 82, height = 52, sourceX = 0, sourceY = 0, sourceWidth = 81, sourceHeight = 51 }, -- head_lower
    { x = 2, y = 102, width = 72, height = 48 }, -- misc/eyes_closed
    { x = 110, y = 108, width = 72, height = 48 }, -- misc/eyes_dead
    { x = 2, y = 152, width = 72, height = 48 }, -- misc/eyes_normal
    { x = 240, y = 38, width = 4, height = 4, sourceX = 0, sourceY = 0, sourceWidth = 25, sourceHeight = 27 }, -- tail
    { x = 2, y = 264, width = 62, height = 30 }, -- torso_lower
    { x = 2, y = 202, width = 62, height = 60, sourceX = 0, sourceY = 0, sourceWidth = 61, sourceHeight = 59 }, -- torso_upper
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
