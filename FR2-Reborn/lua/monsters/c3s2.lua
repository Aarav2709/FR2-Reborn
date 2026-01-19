local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 176,
      y = 436,
      width = 42,
      height = 18,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 42,
      sourceHeight = 17
    },
    {
      x = 176,
      y = 416,
      width = 42,
      height = 18,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 42,
      sourceHeight = 17
    },
    {
      x = 222,
      y = 92,
      width = 22,
      height = 44
    },
    {
      x = 222,
      y = 448,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 222,
      y = 46,
      width = 22,
      height = 44
    },
    {
      x = 220,
      y = 416,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 222,
      y = 2,
      width = 32,
      height = 42,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 41
    },
    {
      x = 96,
      y = 142,
      width = 74,
      height = 88,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 87
    },
    {
      x = 172,
      y = 138,
      width = 74,
      height = 84,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 83
    },
    {
      x = 194,
      y = 224,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 128,
      y = 2,
      width = 92,
      height = 134,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 133
    },
    {
      x = 2,
      y = 142,
      width = 92,
      height = 134,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 133
    },
    {
      x = 2,
      y = 278,
      width = 72,
      height = 114
    },
    {
      x = 2,
      y = 394,
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
      width = 124,
      height = 138,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 137
    },
    {
      x = 96,
      y = 232,
      width = 96,
      height = 88,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 100
    },
    {
      x = 76,
      y = 322,
      width = 116,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 117,
      sourceHeight = 51
    },
    {
      x = 148,
      y = 462,
      width = 72,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 176,
      y = 376,
      width = 62,
      height = 38,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 72,
      y = 462,
      width = 74,
      height = 42,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 43
    },
    {
      x = 76,
      y = 376,
      width = 98,
      height = 84,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 85
    },
    {
      x = 194,
      y = 330,
      width = 52,
      height = 42,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 56,
      sourceHeight = 44
    },
    {
      x = 194,
      y = 286,
      width = 52,
      height = 42,
      sourceX = 0,
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
