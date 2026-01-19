local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 88,
      y = 128,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 88,
      y = 110,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 222,
      y = 194,
      width = 18,
      height = 32,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 128,
      y = 140,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 222,
      y = 160,
      width = 18,
      height = 32,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 128,
      y = 110,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 88,
      y = 146,
      width = 30,
      height = 42,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 144,
      y = 160,
      width = 76,
      height = 72,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 286,
      width = 76,
      height = 64,
      sourceX = 2,
      sourceY = 6,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 76,
      y = 378,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 170,
      width = 76,
      height = 114,
      sourceX = 8,
      sourceY = 4,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 144,
      y = 234,
      width = 74,
      height = 118,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 396,
      width = 64,
      height = 92,
      sourceX = 6,
      sourceY = 4,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 80,
      y = 190,
      width = 62,
      height = 96,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 140,
      height = 106,
      sourceX = 0,
      sourceY = 8,
      sourceWidth = 141,
      sourceHeight = 118
    },
    {
      x = 144,
      y = 60,
      width = 96,
      height = 98,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 144,
      y = 2,
      width = 108,
      height = 56,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 107,
      sourceHeight = 56
    },
    {
      x = 2,
      y = 352,
      width = 72,
      height = 42,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 140,
      y = 354,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 38
    },
    {
      x = 2,
      y = 110,
      width = 84,
      height = 58
    },
    {
      x = 120,
      y = 170,
      width = 22,
      height = 14,
      sourceX = 2,
      sourceY = 6,
      sourceWidth = 29,
      sourceHeight = 24
    },
    {
      x = 80,
      y = 288,
      width = 60,
      height = 44,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 43
    },
    {
      x = 80,
      y = 334,
      width = 58,
      height = 42,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 60,
      sourceHeight = 45
    }
  },
  sheetContentWidth = 256,
  sheetContentHeight = 512
}
SheetInfo.frameIndex = {
  ["0l"] = 1,
  ["0r"] = 2,
  arm_l_lower = 3,
  arm_l_upper = 4,
  arm_r_lower = 5,
  arm_r_upper = 6,
  ["deaths/body"] = 7,
  ["deaths/headSingle"] = 8,
  ["deaths/headSingleShot"] = 9,
  ["deaths/headSkull"] = 10,
  ["deaths/lightning1"] = 11,
  ["deaths/lightning2"] = 12,
  ["deaths/sawbladeLeft"] = 13,
  ["deaths/sawbladeRight"] = 14,
  hair = 15,
  head = 16,
  head_lower = 17,
  ["misc/eyes_closed"] = 18,
  ["misc/eyes_dead"] = 19,
  ["misc/eyes_normal"] = 20,
  tail = 21,
  torso_lower = 22,
  torso_upper = 23
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
