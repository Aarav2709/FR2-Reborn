local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 182,
      y = 284,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 182,
      y = 266,
      width = 36,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 15
    },
    {
      x = 230,
      y = 2,
      width = 20,
      height = 24,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 26
    },
    {
      x = 230,
      y = 54,
      width = 12,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 220,
      y = 266,
      width = 20,
      height = 24,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 26
    },
    {
      x = 230,
      y = 28,
      width = 12,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 78,
      y = 460,
      width = 30,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 106,
      y = 228,
      width = 74,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 182,
      y = 192,
      width = 72,
      height = 72,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 72
    },
    {
      x = 144,
      y = 356,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 246,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 2,
      y = 126,
      width = 102,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 101,
      sourceHeight = 118
    },
    {
      x = 176,
      y = 92,
      width = 62,
      height = 98,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 106,
      y = 126,
      width = 68,
      height = 100,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 366,
      width = 140,
      height = 92,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 140,
      sourceHeight = 91
    },
    {
      x = 132,
      y = 2,
      width = 96,
      height = 88,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 106,
      y = 302,
      width = 124,
      height = 52,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 51
    },
    {
      x = 110,
      y = 466,
      width = 70,
      height = 44,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 70,
      sourceHeight = 43
    },
    {
      x = 2,
      y = 460,
      width = 74,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 73,
      sourceHeight = 38
    },
    {
      x = 144,
      y = 418,
      width = 78,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 45
    },
    {
      x = 2,
      y = 2,
      width = 128,
      height = 122
    },
    {
      x = 202,
      y = 356,
      width = 48,
      height = 44
    },
    {
      x = 132,
      y = 92,
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
