local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 2,
      y = 238,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 38,
      sourceHeight = 15
    },
    {
      x = 2,
      y = 220,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 38,
      sourceHeight = 15
    },
    {
      x = 60,
      y = 220,
      width = 16,
      height = 30,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 31
    },
    {
      x = 90,
      y = 220,
      width = 10,
      height = 26,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 42,
      y = 220,
      width = 16,
      height = 30,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 31
    },
    {
      x = 78,
      y = 220,
      width = 10,
      height = 26,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 358,
      y = 60,
      width = 32,
      height = 42,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 41
    },
    {
      x = 290,
      y = 106,
      width = 72,
      height = 86
    },
    {
      x = 422,
      y = 136,
      width = 72,
      height = 72
    },
    {
      x = 290,
      y = 194,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 402,
      y = 2,
      width = 90,
      height = 132,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 131
    },
    {
      x = 198,
      y = 118,
      width = 90,
      height = 132,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 131
    },
    {
      x = 136,
      y = 2,
      width = 72,
      height = 114
    },
    {
      x = 210,
      y = 2,
      width = 68,
      height = 114,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 114
    },
    {
      x = 2,
      y = 2,
      width = 132,
      height = 126,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 125
    },
    {
      x = 2,
      y = 130,
      width = 96,
      height = 88,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 100
    },
    {
      x = 280,
      y = 2,
      width = 120,
      height = 56,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 124,
      sourceHeight = 56
    },
    {
      x = 348,
      y = 194,
      width = 72,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 102,
      y = 216,
      width = 62,
      height = 38,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 280,
      y = 60,
      width = 76,
      height = 44,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 43
    },
    {
      x = 100,
      y = 130,
      width = 96,
      height = 84,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 96,
      sourceHeight = 85
    },
    {
      x = 364,
      y = 136,
      width = 56,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 56,
      sourceHeight = 44
    },
    {
      x = 422,
      y = 210,
      width = 54,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 54,
      sourceHeight = 41
    }
  },
  sheetContentWidth = 512,
  sheetContentHeight = 256
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
