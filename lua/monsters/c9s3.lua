local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 220,
      y = 252,
      width = 34,
      height = 16,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 220,
      y = 234,
      width = 34,
      height = 16,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 226,
      y = 144,
      width = 22,
      height = 32,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 226,
      y = 206,
      width = 16,
      height = 26,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 226,
      y = 110,
      width = 22,
      height = 32,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 226,
      y = 178,
      width = 16,
      height = 26,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 74,
      y = 370,
      width = 36,
      height = 42,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 2,
      y = 354,
      width = 70,
      height = 72,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 146,
      y = 230,
      width = 72,
      height = 72,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 428,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 146,
      y = 110,
      width = 78,
      height = 118,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 90,
      width = 78,
      height = 118,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 82,
      y = 90,
      width = 62,
      height = 98,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 76,
      y = 270,
      width = 66,
      height = 98,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 142,
      height = 86,
      sourceX = 0,
      sourceY = 6,
      sourceWidth = 141,
      sourceHeight = 92
    },
    {
      x = 146,
      y = 2,
      width = 100,
      height = 106,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 105
    },
    {
      x = 2,
      y = 210,
      width = 76,
      height = 54,
      sourceX = 8,
      sourceY = 2,
      sourceWidth = 89,
      sourceHeight = 56
    },
    {
      x = 2,
      y = 310,
      width = 72,
      height = 42,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 144,
      y = 304,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 38
    },
    {
      x = 2,
      y = 266,
      width = 72,
      height = 42,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 60,
      y = 428,
      width = 42,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 44,
      sourceHeight = 56
    },
    {
      x = 82,
      y = 190,
      width = 62,
      height = 40,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 41
    },
    {
      x = 80,
      y = 232,
      width = 58,
      height = 36,
      sourceX = 0,
      sourceY = 4,
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
