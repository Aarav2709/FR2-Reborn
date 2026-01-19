local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 206,
      y = 176,
      width = 38,
      height = 16
    },
    {
      x = 206,
      y = 158,
      width = 38,
      height = 16
    },
    {
      x = 228,
      y = 194,
      width = 20,
      height = 36,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 35
    },
    {
      x = 204,
      y = 232,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 28
    },
    {
      x = 206,
      y = 194,
      width = 20,
      height = 36,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 35
    },
    {
      x = 204,
      y = 232,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 28
    },
    {
      x = 206,
      y = 110,
      width = 38,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 45
    },
    {
      x = 2,
      y = 430,
      width = 68,
      height = 72
    },
    {
      x = 66,
      y = 328,
      width = 68,
      height = 66,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 68,
      sourceHeight = 72
    },
    {
      x = 76,
      y = 82,
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
      width = 70,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 134,
      y = 110,
      width = 70,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 328,
      width = 62,
      height = 100,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 76,
      y = 144,
      width = 54,
      height = 100,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 130,
      height = 78,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 130,
      sourceHeight = 92
    },
    {
      x = 134,
      y = 2,
      width = 108,
      height = 106,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 106
    },
    {
      x = 74,
      y = 246,
      width = 52,
      height = 42,
      sourceX = 48,
      sourceY = 10,
      sourceWidth = 111,
      sourceHeight = 56
    },
    {
      x = 128,
      y = 272,
      width = 70,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 70,
      sourceHeight = 39
    },
    {
      x = 2,
      y = 290,
      width = 70,
      height = 36,
      sourceX = 0,
      sourceY = 12,
      sourceWidth = 74,
      sourceHeight = 48
    },
    {
      x = 2,
      y = 128,
      width = 72,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 40
    },
    {
      x = 244,
      y = 2,
      width = 2,
      height = 2,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 25,
      sourceHeight = 27
    },
    {
      x = 2,
      y = 82,
      width = 72,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 132,
      y = 230,
      width = 70,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 40
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
