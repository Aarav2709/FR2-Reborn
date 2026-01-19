local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 212,
      y = 180,
      width = 38,
      height = 18,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 38,
      sourceHeight = 17
    },
    {
      x = 212,
      y = 160,
      width = 38,
      height = 18,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 38,
      sourceHeight = 17
    },
    {
      x = 104,
      y = 140,
      width = 20,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 35
    },
    {
      x = 106,
      y = 176,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 28
    },
    {
      x = 104,
      y = 104,
      width = 20,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 35
    },
    {
      x = 88,
      y = 176,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 28
    },
    {
      x = 212,
      y = 112,
      width = 38,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 45
    },
    {
      x = 70,
      y = 422,
      width = 68,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 67,
      sourceHeight = 72
    },
    {
      x = 72,
      y = 322,
      width = 68,
      height = 66,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 67,
      sourceHeight = 72
    },
    {
      x = 196,
      y = 316,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 154,
      width = 84,
      height = 120,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 119
    },
    {
      x = 126,
      y = 112,
      width = 84,
      height = 120,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 119
    },
    {
      x = 2,
      y = 320,
      width = 68,
      height = 100,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 140,
      y = 390,
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
      height = 100,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 130,
      sourceHeight = 110
    },
    {
      x = 134,
      y = 2,
      width = 108,
      height = 108,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 107
    },
    {
      x = 2,
      y = 104,
      width = 100,
      height = 48,
      sourceX = 16,
      sourceY = 12,
      sourceWidth = 116,
      sourceHeight = 59
    },
    {
      x = 162,
      y = 234,
      width = 70,
      height = 40
    },
    {
      x = 76,
      y = 282,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 10,
      sourceWidth = 74,
      sourceHeight = 48
    },
    {
      x = 2,
      y = 276,
      width = 72,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 41
    },
    {
      x = 2,
      y = 422,
      width = 66,
      height = 80,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 65,
      sourceHeight = 79
    },
    {
      x = 88,
      y = 234,
      width = 72,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 46
    },
    {
      x = 162,
      y = 276,
      width = 70,
      height = 38,
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
