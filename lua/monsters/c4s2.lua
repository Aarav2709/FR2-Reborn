local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 216,
      y = 284,
      width = 36,
      height = 14
    },
    {
      x = 206,
      y = 168,
      width = 36,
      height = 14
    },
    {
      x = 238,
      y = 2,
      width = 16,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 15,
      sourceHeight = 28
    },
    {
      x = 216,
      y = 330,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 70,
      y = 240,
      width = 18,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 17,
      sourceHeight = 27
    },
    {
      x = 216,
      y = 300,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 176,
      y = 144,
      width = 28,
      height = 46,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 46
    },
    {
      x = 90,
      y = 258,
      width = 66,
      height = 68,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 240,
      width = 66,
      height = 68,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 158,
      y = 284,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 124,
      width = 86,
      height = 114,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 90,
      y = 144,
      width = 84,
      height = 112,
      sourceX = 6,
      sourceY = 2,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 342,
      width = 52,
      height = 100,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 68,
      y = 328,
      width = 54,
      height = 94,
      sourceX = 8,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 122,
      y = 2,
      width = 114,
      height = 80,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 114,
      sourceHeight = 79
    },
    {
      x = 2,
      y = 50,
      width = 104,
      height = 72,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 2,
      y = 2,
      width = 118,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 117,
      sourceHeight = 46
    },
    {
      x = 176,
      y = 244,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 37
    },
    {
      x = 2,
      y = 310,
      width = 64,
      height = 30,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 176,
      y = 192,
      width = 74,
      height = 50,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 76,
      sourceHeight = 50
    },
    {
      x = 108,
      y = 84,
      width = 96,
      height = 58,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 57
    },
    {
      x = 206,
      y = 84,
      width = 42,
      height = 48,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 46,
      sourceHeight = 47
    },
    {
      x = 206,
      y = 134,
      width = 38,
      height = 32
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
