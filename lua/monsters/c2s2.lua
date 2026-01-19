local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 106,
      y = 300,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 2,
      y = 486,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 128,
      y = 474,
      width = 20,
      height = 26
    },
    {
      x = 166,
      y = 474,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 230,
      y = 324,
      width = 20,
      height = 26
    },
    {
      x = 150,
      y = 474,
      width = 14,
      height = 26,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 178,
      y = 432,
      width = 30,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 174,
      y = 166,
      width = 74,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 170,
      y = 92,
      width = 74,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 128,
      y = 324,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 216,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 2,
      y = 96,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 106,
      y = 96,
      width = 62,
      height = 100,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 106,
      y = 198,
      width = 66,
      height = 100,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 140,
      height = 92,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 91
    },
    {
      x = 144,
      y = 2,
      width = 96,
      height = 88,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 2,
      y = 432,
      width = 124,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 51
    },
    {
      x = 128,
      y = 386,
      width = 70,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 43
    },
    {
      x = 174,
      y = 284,
      width = 74,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 174,
      y = 240,
      width = 78,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 42
    },
    {
      x = 2,
      y = 336,
      width = 124,
      height = 94,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 124,
      sourceHeight = 93
    },
    {
      x = 128,
      y = 432,
      width = 48,
      height = 40,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 48,
      sourceHeight = 44
    },
    {
      x = 186,
      y = 324,
      width = 42,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 41,
      sourceHeight = 38
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
