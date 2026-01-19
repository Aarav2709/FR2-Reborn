local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 200,
      y = 182,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 200,
      y = 164,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 236,
      y = 40,
      width = 18,
      height = 36,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 18,
      sourceHeight = 35
    },
    {
      x = 226,
      y = 132,
      width = 16,
      height = 30,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 236,
      y = 2,
      width = 18,
      height = 36,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 18,
      sourceHeight = 35
    },
    {
      x = 226,
      y = 100,
      width = 16,
      height = 30,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 74,
      y = 196,
      width = 32,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 2,
      y = 410,
      width = 66,
      height = 72
    },
    {
      x = 178,
      y = 336,
      width = 66,
      height = 72
    },
    {
      x = 2,
      y = 258,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 108,
      y = 236,
      width = 68,
      height = 116,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 98,
      width = 70,
      height = 116,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 178,
      y = 236,
      width = 68,
      height = 98,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 74,
      y = 98,
      width = 52,
      height = 96,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 124,
      height = 94,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 93
    },
    {
      x = 128,
      y = 56,
      width = 96,
      height = 90,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 106
    },
    {
      x = 128,
      y = 2,
      width = 106,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 105,
      sourceHeight = 51
    },
    {
      x = 128,
      y = 192,
      width = 70,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 70,
      sourceHeight = 41
    },
    {
      x = 2,
      y = 216,
      width = 70,
      height = 40,
      sourceX = 0,
      sourceY = 6,
      sourceWidth = 74,
      sourceHeight = 46
    },
    {
      x = 128,
      y = 148,
      width = 70,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 70,
      sourceHeight = 41
    },
    {
      x = 226,
      y = 78,
      width = 20,
      height = 20,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 25,
      sourceHeight = 27
    },
    {
      x = 62,
      y = 354,
      width = 58,
      height = 36,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 58,
      sourceHeight = 39
    },
    {
      x = 2,
      y = 354,
      width = 58,
      height = 40
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
