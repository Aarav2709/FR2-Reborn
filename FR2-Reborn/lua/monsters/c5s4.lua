local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 112,
      y = 142,
      width = 38,
      height = 16
    },
    {
      x = 112,
      y = 124,
      width = 40,
      height = 16,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 226,
      y = 202,
      width = 28,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 27,
      sourceHeight = 33
    },
    {
      x = 224,
      y = 238,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 226,
      y = 166,
      width = 28,
      height = 34,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 27,
      sourceHeight = 33
    },
    {
      x = 84,
      y = 182,
      width = 22,
      height = 30,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 112,
      y = 84,
      width = 40,
      height = 38,
      sourceX = 0,
      sourceY = 4,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 144,
      y = 166,
      width = 80,
      height = 70,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 142,
      y = 238,
      width = 80,
      height = 68,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 84,
      y = 214,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 182,
      width = 80,
      height = 118,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 154,
      y = 46,
      width = 80,
      height = 118,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 2,
      y = 346,
      width = 68,
      height = 98,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 140,
      y = 352,
      width = 66,
      height = 98,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 150,
      height = 80,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 150,
      sourceHeight = 120
    },
    {
      x = 2,
      y = 84,
      width = 108,
      height = 96,
      sourceX = 8,
      sourceY = 0,
      sourceWidth = 123,
      sourceHeight = 98
    },
    {
      x = 84,
      y = 276,
      width = 56,
      height = 44,
      sourceX = 2,
      sourceY = 6,
      sourceWidth = 61,
      sourceHeight = 50
    },
    {
      x = 2,
      y = 302,
      width = 72,
      height = 42,
      sourceX = 6,
      sourceY = 4,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 76,
      y = 322,
      width = 62,
      height = 34,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 154,
      y = 2,
      width = 92,
      height = 42,
      sourceX = 0,
      sourceY = 4,
      sourceWidth = 92,
      sourceHeight = 45
    },
    {
      x = 112,
      y = 160,
      width = 30,
      height = 30,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 31,
      sourceHeight = 35
    },
    {
      x = 142,
      y = 308,
      width = 70,
      height = 42,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 41
    },
    {
      x = 2,
      y = 446,
      width = 56,
      height = 36,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 60,
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
