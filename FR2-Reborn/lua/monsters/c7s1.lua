local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 96,
      y = 226,
      width = 34,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 96,
      y = 210,
      width = 34,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 36,
      sourceHeight = 14
    },
    {
      x = 120,
      y = 90,
      width = 18,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 17,
      sourceHeight = 29
    },
    {
      x = 120,
      y = 146,
      width = 16,
      height = 24,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 120,
      y = 60,
      width = 18,
      height = 28,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 17,
      sourceHeight = 29
    },
    {
      x = 120,
      y = 120,
      width = 16,
      height = 24,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 22,
      sourceHeight = 27
    },
    {
      x = 96,
      y = 242,
      width = 28,
      height = 42,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 41
    },
    {
      x = 124,
      y = 316,
      width = 66,
      height = 70,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 66,
      sourceHeight = 72
    },
    {
      x = 2,
      y = 312,
      width = 66,
      height = 72
    },
    {
      x = 66,
      y = 386,
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
      width = 92,
      height = 118,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 118
    },
    {
      x = 140,
      y = 102,
      width = 92,
      height = 118,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 118
    },
    {
      x = 192,
      y = 372,
      width = 62,
      height = 96,
      sourceX = 10,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 200,
      y = 274,
      width = 50,
      height = 96,
      sourceX = 10,
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
      x = 126,
      y = 274,
      width = 72,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 39
    },
    {
      x = 2,
      y = 470,
      width = 62,
      height = 34,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 2,
      y = 270,
      width = 72,
      height = 40,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 71,
      sourceHeight = 39
    },
    {
      x = 132,
      y = 222,
      width = 86,
      height = 50,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 51
    },
    {
      x = 76,
      y = 286,
      width = 46,
      height = 38,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 46,
      sourceHeight = 41
    },
    {
      x = 96,
      y = 172,
      width = 38,
      height = 36,
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
