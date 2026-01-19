local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 4,
      y = 4,
      width = 332,
      height = 206,
      sourceX = 126,
      sourceY = 0,
      sourceWidth = 480,
      sourceHeight = 300
    },
    {
      x = 4,
      y = 452,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 68,
      y = 452,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 132,
      y = 216,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 132,
      y = 278,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 132,
      y = 340,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 342,
      y = 4,
      width = 128,
      height = 100,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 342,
      y = 110,
      width = 128,
      height = 100,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 4,
      y = 216,
      width = 122,
      height = 112,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 122,
      sourceHeight = 111
    },
    {
      x = 4,
      y = 334,
      width = 122,
      height = 112,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 122,
      sourceHeight = 111
    }
  },
  sheetContentWidth = 512,
  sheetContentHeight = 512
}
SheetInfo.frameIndex = {
  cannon = 1,
  powerupBox0 = 2,
  powerupBox1 = 3,
  powerupBox2 = 4,
  powerupBox3 = 5,
  powerupBox4 = 6,
  speedFlat1 = 7,
  speedFlat2 = 8,
  speedHill1 = 9,
  speedHill2 = 10
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
