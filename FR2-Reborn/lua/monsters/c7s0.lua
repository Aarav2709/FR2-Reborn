local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 94,
      y = 206,
      width = 36,
      height = 14
    },
    {
      x = 94,
      y = 190,
      width = 36,
      height = 14
    },
    {
      x = 120,
      y = 60,
      width = 18,
      height = 30,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 18,
      sourceHeight = 31
    },
    {
      x = 120,
      y = 122,
      width = 16,
      height = 26,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 20,
      sourceHeight = 27
    },
    {
      x = 120,
      y = 92,
      width = 18,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 17,
      sourceHeight = 29
    },
    {
      x = 232,
      y = 102,
      width = 16,
      height = 24,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 220,
      y = 220,
      width = 26,
      height = 42,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 2,
      y = 352,
      width = 64,
      height = 68,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 422,
      width = 64,
      height = 66,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 180,
      y = 272,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 150,
      width = 90,
      height = 116,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 140,
      y = 102,
      width = 90,
      height = 116,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 68,
      y = 366,
      width = 60,
      height = 96,
      sourceX = 12,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 76,
      y = 268,
      width = 46,
      height = 96,
      sourceX = 12,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 60,
      width = 116,
      height = 88,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 116,
      sourceHeight = 87
    },
    {
      x = 144,
      y = 2,
      width = 104,
      height = 98,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 138,
      sourceHeight = 112
    },
    {
      x = 2,
      y = 2,
      width = 140,
      height = 56,
      sourceX = 0,
      sourceY = 4,
      sourceWidth = 139,
      sourceHeight = 59
    },
    {
      x = 2,
      y = 312,
      width = 72,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 37
    },
    {
      x = 116,
      y = 464,
      width = 62,
      height = 34,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 2,
      y = 268,
      width = 72,
      height = 42,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 71,
      sourceHeight = 43
    },
    {
      x = 132,
      y = 220,
      width = 86,
      height = 50,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 51
    },
    {
      x = 68,
      y = 464,
      width = 46,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 46,
      sourceHeight = 41
    },
    {
      x = 94,
      y = 150,
      width = 40,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 37
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
