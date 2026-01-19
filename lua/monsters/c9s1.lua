local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 78,
      y = 186,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 78,
      y = 168,
      width = 38,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 232,
      y = 36,
      width = 18,
      height = 32,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 232,
      y = 100,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 232,
      y = 2,
      width = 18,
      height = 32,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 232,
      y = 70,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 220,
      y = 130,
      width = 30,
      height = 42,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 76,
      y = 280,
      width = 72,
      height = 72,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 120,
      width = 74,
      height = 72,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 198,
      y = 174,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 194,
      width = 72,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 124,
      y = 160,
      width = 72,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 358,
      width = 62,
      height = 98,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 76,
      y = 354,
      width = 66,
      height = 98,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 128,
      height = 116,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 140,
      sourceHeight = 120
    },
    {
      x = 132,
      y = 2,
      width = 98,
      height = 98,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 115,
      sourceHeight = 98
    },
    {
      x = 132,
      y = 102,
      width = 86,
      height = 56,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 89,
      sourceHeight = 56
    },
    {
      x = 150,
      y = 284,
      width = 72,
      height = 40,
      sourceX = 6,
      sourceY = 4,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 150,
      y = 326,
      width = 70,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 38
    },
    {
      x = 2,
      y = 314,
      width = 72,
      height = 42,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 78,
      y = 120,
      width = 44,
      height = 46,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 44,
      sourceHeight = 49
    },
    {
      x = 2,
      y = 458,
      width = 56,
      height = 40,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 41
    },
    {
      x = 198,
      y = 236,
      width = 56,
      height = 46,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 60,
      sourceHeight = 45
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
