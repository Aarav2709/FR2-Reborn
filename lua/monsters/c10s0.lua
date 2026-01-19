local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 216,
      y = 112,
      width = 38,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 216,
      y = 96,
      width = 38,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 72,
      y = 254,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 96,
      y = 254,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 96,
      y = 116,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 120,
      y = 116,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 216,
      y = 156,
      width = 24,
      height = 42,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 2,
      y = 138,
      width = 76,
      height = 72,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 138,
      y = 96,
      width = 76,
      height = 72,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 80,
      y = 146,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 128,
      y = 212,
      width = 68,
      height = 118,
      sourceX = 20,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 212,
      width = 68,
      height = 118,
      sourceX = 20,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 66,
      y = 332,
      width = 60,
      height = 98,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 332,
      width = 62,
      height = 98,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 134,
      height = 82,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 150,
      sourceHeight = 85
    },
    {
      x = 138,
      y = 2,
      width = 102,
      height = 92,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 98
    },
    {
      x = 96,
      y = 86,
      width = 40,
      height = 28,
      sourceX = 4,
      sourceY = 12,
      sourceWidth = 47,
      sourceHeight = 45
    },
    {
      x = 138,
      y = 170,
      width = 72,
      height = 40,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 2,
      y = 432,
      width = 66,
      height = 34,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 2,
      y = 86,
      width = 92,
      height = 50,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 92,
      sourceHeight = 49
    },
    {
      x = 216,
      y = 128,
      width = 26,
      height = 26,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 31,
      sourceHeight = 35
    },
    {
      x = 80,
      y = 208,
      width = 46,
      height = 44,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 43
    },
    {
      x = 212,
      y = 200,
      width = 42,
      height = 38,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 60,
      sourceHeight = 37
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
