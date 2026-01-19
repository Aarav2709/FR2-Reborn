local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 160,
      y = 378,
      width = 38,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 2,
      y = 404,
      width = 38,
      height = 14,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 39,
      sourceHeight = 16
    },
    {
      x = 144,
      y = 342,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 144,
      y = 372,
      width = 14,
      height = 28,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 144,
      y = 312,
      width = 22,
      height = 28,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 23,
      sourceHeight = 33
    },
    {
      x = 86,
      y = 198,
      width = 16,
      height = 28,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 22,
      sourceHeight = 29
    },
    {
      x = 50,
      y = 318,
      width = 26,
      height = 42,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 40,
      sourceHeight = 42
    },
    {
      x = 86,
      y = 240,
      width = 80,
      height = 70,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 168,
      y = 308,
      width = 80,
      height = 68,
      sourceX = 0,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 72
    },
    {
      x = 86,
      y = 312,
      width = 56,
      height = 60,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 58,
      sourceHeight = 60
    },
    {
      x = 2,
      y = 198,
      width = 82,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 170,
      y = 188,
      width = 82,
      height = 118,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 95,
      sourceHeight = 117
    },
    {
      x = 176,
      y = 88,
      width = 66,
      height = 98,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 106,
      y = 140,
      width = 62,
      height = 98,
      sourceX = 6,
      sourceY = 0,
      sourceWidth = 72,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 172,
      height = 100,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 172,
      sourceHeight = 109
    },
    {
      x = 2,
      y = 104,
      width = 102,
      height = 92,
      sourceX = 14,
      sourceY = 4,
      sourceWidth = 123,
      sourceHeight = 98
    },
    {
      x = 78,
      y = 374,
      width = 42,
      height = 30,
      sourceX = 2,
      sourceY = 10,
      sourceWidth = 47,
      sourceHeight = 45
    },
    {
      x = 176,
      y = 46,
      width = 72,
      height = 40,
      sourceX = 4,
      sourceY = 2,
      sourceWidth = 79,
      sourceHeight = 45
    },
    {
      x = 106,
      y = 104,
      width = 66,
      height = 34,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 69,
      sourceHeight = 34
    },
    {
      x = 176,
      y = 2,
      width = 72,
      height = 42,
      sourceX = 10,
      sourceY = 2,
      sourceWidth = 92,
      sourceHeight = 45
    },
    {
      x = 50,
      y = 362,
      width = 26,
      height = 26,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 31,
      sourceHeight = 35
    },
    {
      x = 2,
      y = 318,
      width = 46,
      height = 44,
      sourceX = 12,
      sourceY = 0,
      sourceWidth = 68,
      sourceHeight = 43
    },
    {
      x = 2,
      y = 364,
      width = 42,
      height = 38,
      sourceX = 10,
      sourceY = 0,
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
