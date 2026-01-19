local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 206,
      y = 132,
      width = 36,
      height = 14
    },
    {
      x = 206,
      y = 116,
      width = 36,
      height = 14
    },
    {
      x = 66,
      y = 268,
      width = 22,
      height = 26
    },
    {
      x = 238,
      y = 30,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 66,
      y = 240,
      width = 22,
      height = 26
    },
    {
      x = 238,
      y = 2,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 60,
      y = 308,
      width = 28,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 2,
      y = 240,
      width = 62,
      height = 66,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 90,
      y = 252,
      width = 62,
      height = 64,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 308,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 124,
      width = 88,
      height = 114,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 92,
      y = 138,
      width = 84,
      height = 112,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 370,
      width = 54,
      height = 98,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 58,
      y = 370,
      width = 54,
      height = 92,
      sourceX = 8,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 122,
      y = 2,
      width = 114,
      height = 80,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 113,
      sourceHeight = 79
    },
    {
      x = 2,
      y = 50,
      width = 104,
      height = 72,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 2,
      y = 2,
      width = 118,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 117,
      sourceHeight = 46
    },
    {
      x = 178,
      y = 200,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 37
    },
    {
      x = 178,
      y = 240,
      width = 64,
      height = 30,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 178,
      y = 148,
      width = 76,
      height = 50
    },
    {
      x = 108,
      y = 84,
      width = 96,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 51
    },
    {
      x = 154,
      y = 272,
      width = 56,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 55,
      sourceHeight = 44
    },
    {
      x = 206,
      y = 84,
      width = 44,
      height = 30,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 55,
      sourceHeight = 29
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
