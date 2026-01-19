local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 140,
      y = 414,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 140,
      y = 396,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 106,
      y = 162,
      width = 20,
      height = 24,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 26
    },
    {
      x = 236,
      y = 148,
      width = 12,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 106,
      y = 136,
      width = 20,
      height = 24,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 26
    },
    {
      x = 236,
      y = 122,
      width = 12,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 106,
      y = 94,
      width = 30,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 178,
      y = 416,
      width = 74,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 64,
      y = 362,
      width = 74,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 198,
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
      y = 94,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 144,
      y = 2,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 2,
      y = 316,
      width = 60,
      height = 98,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 214,
      width = 68,
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
      height = 90,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 91
    },
    {
      x = 138,
      y = 122,
      width = 96,
      height = 88,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 72,
      y = 308,
      width = 124,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 51
    },
    {
      x = 184,
      y = 370,
      width = 70,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 43
    },
    {
      x = 82,
      y = 436,
      width = 74,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 2,
      y = 462,
      width = 78,
      height = 44
    },
    {
      x = 106,
      y = 212,
      width = 124,
      height = 94,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 124,
      sourceHeight = 93
    },
    {
      x = 2,
      y = 416,
      width = 48,
      height = 44
    },
    {
      x = 140,
      y = 362,
      width = 42,
      height = 32,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 41,
      sourceHeight = 32
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
