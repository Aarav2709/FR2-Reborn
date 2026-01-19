local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 214,
      y = 212,
      width = 30,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 218,
      y = 196,
      width = 30,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 122,
      y = 194,
      width = 18,
      height = 26
    },
    {
      x = 122,
      y = 138,
      width = 20,
      height = 26,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 25
    },
    {
      x = 122,
      y = 166,
      width = 18,
      height = 26
    },
    {
      x = 122,
      y = 110,
      width = 20,
      height = 26,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 25
    },
    {
      x = 218,
      y = 154,
      width = 32,
      height = 40,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 74,
      y = 258,
      width = 66,
      height = 72
    },
    {
      x = 2,
      y = 318,
      width = 66,
      height = 70,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 142,
      y = 318,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 142,
      y = 200,
      width = 70,
      height = 116,
      sourceX = 18,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 160,
      width = 70,
      height = 116,
      sourceX = 18,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 390,
      width = 64,
      height = 96,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 74,
      y = 160,
      width = 46,
      height = 96,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 142,
      height = 106
    },
    {
      x = 146,
      y = 2,
      width = 96,
      height = 98,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 2,
      y = 110,
      width = 118,
      height = 48,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 118,
      sourceHeight = 47
    },
    {
      x = 144,
      y = 154,
      width = 72,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 2,
      y = 278,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 37
    },
    {
      x = 146,
      y = 102,
      width = 94,
      height = 50
    },
    {
      x = 214,
      y = 228,
      width = 24,
      height = 24,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 26,
      sourceHeight = 30
    },
    {
      x = 200,
      y = 364,
      width = 50,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 50,
      sourceHeight = 32
    },
    {
      x = 200,
      y = 318,
      width = 50,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 49,
      sourceHeight = 44
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
