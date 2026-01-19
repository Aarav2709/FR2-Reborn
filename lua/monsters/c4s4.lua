local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 132,
      y = 268,
      width = 36,
      height = 14
    },
    {
      x = 132,
      y = 252,
      width = 36,
      height = 14
    },
    {
      x = 228,
      y = 286,
      width = 22,
      height = 22,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 21,
      sourceHeight = 26
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
      x = 228,
      y = 262,
      width = 22,
      height = 22,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 21,
      sourceHeight = 26
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
      x = 174,
      y = 138,
      width = 28,
      height = 40,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 68,
      y = 252,
      width = 62,
      height = 66,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 270,
      width = 62,
      height = 64,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 66,
      y = 320,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 88,
      y = 138,
      width = 84,
      height = 112,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 124,
      width = 84,
      height = 112,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 336,
      width = 52,
      height = 96,
      sourceX = 8,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 170,
      y = 262,
      width = 56,
      height = 94,
      sourceX = 6,
      sourceY = 0,
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
      x = 174,
      y = 222,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 37
    },
    {
      x = 2,
      y = 238,
      width = 64,
      height = 30,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 174,
      y = 180,
      width = 76,
      height = 40,
      sourceX = 0,
      sourceY = 10,
      sourceWidth = 76,
      sourceHeight = 50
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
      x = 206,
      y = 84,
      width = 48,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 48,
      sourceHeight = 41
    },
    {
      x = 206,
      y = 128,
      width = 44,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 43,
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
