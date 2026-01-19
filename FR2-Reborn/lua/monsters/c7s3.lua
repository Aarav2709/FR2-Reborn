local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 220,
      y = 100,
      width = 32,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 220,
      y = 84,
      width = 32,
      height = 14,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 108,
      y = 48,
      width = 18,
      height = 32,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 18,
      sourceHeight = 31
    },
    {
      x = 240,
      y = 2,
      width = 14,
      height = 24,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 20,
      sourceHeight = 27
    },
    {
      x = 108,
      y = 82,
      width = 18,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 17,
      sourceHeight = 29
    },
    {
      x = 240,
      y = 28,
      width = 14,
      height = 22,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 220,
      y = 116,
      width = 24,
      height = 42,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 2,
      y = 260,
      width = 66,
      height = 68,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 180,
      y = 242,
      width = 66,
      height = 68,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 64,
      y = 334,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 142,
      width = 90,
      height = 116,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 128,
      y = 84,
      width = 90,
      height = 116,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 116
    },
    {
      x = 2,
      y = 330,
      width = 60,
      height = 94,
      sourceX = 12,
      sourceY = 4,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 64,
      y = 396,
      width = 48,
      height = 96,
      sourceX = 12,
      sourceY = 2,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 128,
      y = 2,
      width = 110,
      height = 80,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 113,
      sourceHeight = 79
    },
    {
      x = 2,
      y = 48,
      width = 104,
      height = 92,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 138,
      sourceHeight = 112
    },
    {
      x = 2,
      y = 2,
      width = 124,
      height = 44,
      sourceX = 0,
      sourceY = 4,
      sourceWidth = 139,
      sourceHeight = 59
    },
    {
      x = 180,
      y = 202,
      width = 72,
      height = 38,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 37
    },
    {
      x = 70,
      y = 298,
      width = 62,
      height = 34,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 94,
      y = 256,
      width = 78,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 77,
      sourceHeight = 39
    },
    {
      x = 94,
      y = 202,
      width = 84,
      height = 52,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 51
    },
    {
      x = 2,
      y = 426,
      width = 46,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 46,
      sourceHeight = 41
    },
    {
      x = 134,
      y = 298,
      width = 38,
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
