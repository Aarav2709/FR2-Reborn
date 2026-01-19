local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 210,
      y = 162,
      width = 36,
      height = 12,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 38,
      sourceHeight = 15
    },
    {
      x = 172,
      y = 162,
      width = 36,
      height = 12,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 38,
      sourceHeight = 15
    },
    {
      x = 220,
      y = 206,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 20,
      sourceHeight = 31
    },
    {
      x = 238,
      y = 204,
      width = 12,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 220,
      y = 176,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 20,
      sourceHeight = 31
    },
    {
      x = 238,
      y = 176,
      width = 12,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 210,
      y = 242,
      width = 28,
      height = 40,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 41
    },
    {
      x = 88,
      y = 180,
      width = 72,
      height = 86
    },
    {
      x = 136,
      y = 268,
      width = 72,
      height = 84,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 83
    },
    {
      x = 162,
      y = 180,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 136,
      width = 84,
      height = 132,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 131
    },
    {
      x = 2,
      y = 2,
      width = 84,
      height = 132,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 131
    },
    {
      x = 88,
      y = 2,
      width = 72,
      height = 114
    },
    {
      x = 162,
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
      y = 270,
      width = 132,
      height = 130,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 129
    },
    {
      x = 124,
      y = 402,
      width = 96,
      height = 98,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 402,
      width = 120,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 119,
      sourceHeight = 51
    },
    {
      x = 172,
      y = 118,
      width = 72,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 136,
      y = 354,
      width = 62,
      height = 38,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 2,
      y = 456,
      width = 74,
      height = 44,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 43
    },
    {
      x = 88,
      y = 118,
      width = 82,
      height = 60,
      sourceX = 6,
      sourceY = 16,
      sourceWidth = 93,
      sourceHeight = 85
    },
    {
      x = 78,
      y = 456,
      width = 44,
      height = 42,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 56,
      sourceHeight = 44
    },
    {
      x = 200,
      y = 354,
      width = 42,
      height = 42,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 54,
      sourceHeight = 41
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
