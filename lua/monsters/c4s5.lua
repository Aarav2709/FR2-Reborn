local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 138,
      y = 240,
      width = 36,
      height = 14
    },
    {
      x = 182,
      y = 122,
      width = 36,
      height = 14
    },
    {
      x = 138,
      y = 256,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 21,
      sourceHeight = 29
    },
    {
      x = 162,
      y = 284,
      width = 18,
      height = 26,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 226,
      y = 108,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 21,
      sourceHeight = 29
    },
    {
      x = 162,
      y = 256,
      width = 18,
      height = 26,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 226,
      y = 66,
      width = 26,
      height = 40,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 182,
      y = 210,
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
      height = 66,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 312,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 92,
      y = 122,
      width = 88,
      height = 116,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 122,
      width = 88,
      height = 116,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 182,
      y = 308,
      width = 62,
      height = 96,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 406,
      width = 52,
      height = 96,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 126,
      y = 2,
      width = 116,
      height = 62,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 116,
      sourceHeight = 79
    },
    {
      x = 2,
      y = 2,
      width = 122,
      height = 118,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 124,
      sourceHeight = 117
    },
    {
      x = 70,
      y = 240,
      width = 66,
      height = 46,
      sourceX = 34,
      sourceY = 0,
      sourceWidth = 117,
      sourceHeight = 46
    },
    {
      x = 182,
      y = 176,
      width = 70,
      height = 32,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 70,
      sourceHeight = 37
    },
    {
      x = 182,
      y = 280,
      width = 66,
      height = 26,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 182,
      y = 140,
      width = 72,
      height = 34,
      sourceX = 4,
      sourceY = 12,
      sourceWidth = 76,
      sourceHeight = 50
    },
    {
      x = 126,
      y = 66,
      width = 98,
      height = 54,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 98,
      sourceHeight = 53
    },
    {
      x = 70,
      y = 288,
      width = 50,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 49,
      sourceHeight = 41
    },
    {
      x = 122,
      y = 312,
      width = 48,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 47,
      sourceHeight = 46
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
