local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 2,
      y = 2,
      width = 176,
      height = 392,
      sourceX = 22,
      sourceY = 6,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 180,
      y = 2,
      width = 176,
      height = 280,
      sourceX = 22,
      sourceY = 121,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 180,
      y = 284,
      width = 176,
      height = 186,
      sourceX = 22,
      sourceY = 218,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 362,
      width = 180,
      height = 148,
      sourceX = 17,
      sourceY = 258,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 736,
      y = 162,
      width = 178,
      height = 160,
      sourceX = 17,
      sourceY = 246,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 548,
      y = 182,
      width = 184,
      height = 170,
      sourceX = 10,
      sourceY = 236,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 736,
      y = 2,
      width = 184,
      height = 158,
      sourceX = 16,
      sourceY = 248,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 362,
      width = 180,
      height = 148,
      sourceX = 17,
      sourceY = 258,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 362,
      width = 180,
      height = 148,
      sourceX = 17,
      sourceY = 258,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 554,
      y = 2,
      width = 180,
      height = 162,
      sourceX = 14,
      sourceY = 244,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 2,
      width = 194,
      height = 178,
      sourceX = 0,
      sourceY = 228,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 182,
      width = 188,
      height = 178,
      sourceX = 16,
      sourceY = 228,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 548,
      y = 354,
      width = 184,
      height = 156,
      sourceX = 17,
      sourceY = 250,
      sourceWidth = 204,
      sourceHeight = 406
    },
    {
      x = 358,
      y = 362,
      width = 180,
      height = 148,
      sourceX = 17,
      sourceY = 258,
      sourceWidth = 204,
      sourceHeight = 406
    }
  },
  sheetContentWidth = 1024,
  sheetContentHeight = 512
}
SheetInfo.frameIndex = {
  chestFall1 = 1,
  chestFall2 = 2,
  chestFall3 = 3,
  chestFall4 = 4,
  chestFall5 = 5,
  chestFall6 = 6,
  chestFall7 = 7,
  chestFall8 = 8,
  chestIdle1 = 9,
  chestIdle2 = 10,
  chestIdle3 = 11,
  chestIdle4 = 12,
  chestIdle5 = 13,
  chestIdle6 = 14
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
