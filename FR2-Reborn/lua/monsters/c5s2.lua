local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 162,
      y = 492,
      width = 38,
      height = 16
    },
    {
      x = 162,
      y = 474,
      width = 40,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 138,
      y = 472,
      width = 22,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 21,
      sourceHeight = 34
    },
    {
      x = 226,
      y = 38,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 226,
      y = 2,
      width = 24,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 212,
      y = 430,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 172,
      y = 430,
      width = 38,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 41
    },
    {
      x = 132,
      y = 110,
      width = 78,
      height = 78,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 78
    },
    {
      x = 92,
      y = 392,
      width = 78,
      height = 78,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 78
    },
    {
      x = 162,
      y = 190,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 332,
      width = 88,
      height = 128,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 127
    },
    {
      x = 2,
      y = 202,
      width = 88,
      height = 128,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 127
    },
    {
      x = 92,
      y = 202,
      width = 68,
      height = 104,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 103
    },
    {
      x = 152,
      y = 2,
      width = 72,
      height = 106,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 105
    },
    {
      x = 2,
      y = 2,
      width = 148,
      height = 98,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 150,
      sourceHeight = 138
    },
    {
      x = 2,
      y = 102,
      width = 128,
      height = 98,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 127,
      sourceHeight = 106
    },
    {
      x = 162,
      y = 252,
      width = 66,
      height = 52,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 54
    },
    {
      x = 170,
      y = 306,
      width = 72,
      height = 42,
      sourceX = 6,
      sourceY = 4,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 170,
      y = 350,
      width = 62,
      height = 34,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 2,
      y = 462,
      width = 72,
      height = 44,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 92,
      y = 308,
      width = 76,
      height = 82,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 75,
      sourceHeight = 86
    },
    {
      x = 172,
      y = 386,
      width = 66,
      height = 42,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 41
    },
    {
      x = 76,
      y = 472,
      width = 60,
      height = 38
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
