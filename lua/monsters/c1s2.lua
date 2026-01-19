local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 204,
      y = 168,
      width = 32,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 204,
      y = 150,
      width = 34,
      height = 16,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 234,
      y = 26,
      width = 18,
      height = 32,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 19,
      sourceHeight = 32
    },
    {
      x = 226,
      y = 90,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 27
    },
    {
      x = 226,
      y = 120,
      width = 14,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 18,
      sourceHeight = 32
    },
    {
      x = 226,
      y = 60,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 28
    },
    {
      x = 78,
      y = 190,
      width = 36,
      height = 40,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 188,
      y = 204,
      width = 66,
      height = 72
    },
    {
      x = 188,
      y = 278,
      width = 66,
      height = 70,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 124,
      y = 320,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 116,
      y = 204,
      width = 70,
      height = 114,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 96,
      width = 74,
      height = 116,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 290,
      width = 60,
      height = 94,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 78,
      y = 96,
      width = 48,
      height = 92,
      sourceX = 8,
      sourceY = 4,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 124,
      height = 92,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 92
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
      width = 104,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 104,
      sourceHeight = 51
    },
    {
      x = 2,
      y = 252,
      width = 70,
      height = 36
    },
    {
      x = 128,
      y = 148,
      width = 74,
      height = 54,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 74,
      sourceHeight = 53
    },
    {
      x = 2,
      y = 214,
      width = 72,
      height = 36,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 36
    },
    {
      x = 234,
      y = 2,
      width = 20,
      height = 22,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 25,
      sourceHeight = 27
    },
    {
      x = 64,
      y = 320,
      width = 58,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 39
    },
    {
      x = 64,
      y = 362,
      width = 54,
      height = 34,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 57,
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
