local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 90,
      y = 84,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 90,
      y = 66,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 104,
      y = 164,
      width = 18,
      height = 30,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 240,
      y = 30,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 84,
      y = 164,
      width = 18,
      height = 30,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 240,
      y = 2,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 90,
      y = 102,
      width = 32,
      height = 42,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 124,
      y = 104,
      width = 78,
      height = 70,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 75
    },
    {
      x = 2,
      y = 122,
      width = 80,
      height = 74,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 75
    },
    {
      x = 2,
      y = 418,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 198,
      width = 76,
      height = 118,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 124,
      y = 176,
      width = 76,
      height = 118,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 318,
      width = 68,
      height = 98,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 72,
      y = 318,
      width = 64,
      height = 96,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 132,
      height = 62,
      sourceX = 6,
      sourceY = 6,
      sourceWidth = 140,
      sourceHeight = 76
    },
    {
      x = 136,
      y = 2,
      width = 102,
      height = 100,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 104
    },
    {
      x = 2,
      y = 66,
      width = 86,
      height = 54,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 89,
      sourceHeight = 56
    },
    {
      x = 120,
      y = 416,
      width = 72,
      height = 42,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 134,
      y = 460,
      width = 70,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 41
    },
    {
      x = 60,
      y = 464,
      width = 72,
      height = 42,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 84,
      y = 146,
      width = 20,
      height = 16,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 25,
      sourceHeight = 23
    },
    {
      x = 194,
      y = 296,
      width = 58,
      height = 38,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 68,
      sourceHeight = 41
    },
    {
      x = 60,
      y = 418,
      width = 58,
      height = 44,
      sourceX = 0,
      sourceY = 0,
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
