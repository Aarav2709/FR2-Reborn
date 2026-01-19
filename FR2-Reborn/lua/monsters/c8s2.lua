local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 216,
      y = 160,
      width = 30,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 224,
      y = 144,
      width = 30,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 122,
      y = 164,
      width = 18,
      height = 26
    },
    {
      x = 232,
      y = 176,
      width = 14,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 122,
      y = 136,
      width = 18,
      height = 26
    },
    {
      x = 216,
      y = 176,
      width = 14,
      height = 24,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 224,
      y = 102,
      width = 30,
      height = 40,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 40
    },
    {
      x = 142,
      y = 274,
      width = 66,
      height = 72
    },
    {
      x = 142,
      y = 200,
      width = 66,
      height = 72
    },
    {
      x = 2,
      y = 320,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 206,
      width = 66,
      height = 112,
      sourceX = 20,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 74,
      y = 192,
      width = 66,
      height = 112,
      sourceX = 20,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 70,
      y = 306,
      width = 64,
      height = 96,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 404,
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
      height = 54,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 118,
      sourceHeight = 53
    },
    {
      x = 142,
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
      y = 166,
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
      width = 76,
      height = 50
    },
    {
      x = 122,
      y = 110,
      width = 22,
      height = 24,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 26,
      sourceHeight = 30
    },
    {
      x = 136,
      y = 348,
      width = 54,
      height = 38,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 54,
      sourceHeight = 41
    },
    {
      x = 210,
      y = 202,
      width = 42,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 42,
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
