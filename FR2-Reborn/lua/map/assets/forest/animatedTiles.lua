local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 178,
      y = 100,
      width = 168,
      height = 94,
      sourceX = 86,
      sourceY = 60,
      sourceWidth = 320,
      sourceHeight = 200
    },
    {
      x = 182,
      y = 4,
      width = 170,
      height = 90,
      sourceX = 84,
      sourceY = 64,
      sourceWidth = 320,
      sourceHeight = 200
    },
    {
      x = 4,
      y = 4,
      width = 172,
      height = 88,
      sourceX = 82,
      sourceY = 66,
      sourceWidth = 320,
      sourceHeight = 200
    },
    {
      x = 4,
      y = 98,
      width = 168,
      height = 108,
      sourceX = 86,
      sourceY = 46,
      sourceWidth = 320,
      sourceHeight = 200
    },
    {
      x = 176,
      y = 316,
      width = 166,
      height = 108,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 178,
      y = 200,
      width = 166,
      height = 110,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 4,
      y = 328,
      width = 166,
      height = 108,
      sourceX = 2,
      sourceY = 2,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 4,
      y = 212,
      width = 166,
      height = 110,
      sourceX = 2,
      sourceY = 0,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 438,
      y = 478,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 438,
      y = 540,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 4,
      y = 650,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 4,
      y = 712,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 380,
      y = 602,
      width = 58,
      height = 56,
      sourceX = 54,
      sourceY = 22,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 352,
      y = 110,
      width = 154,
      height = 86,
      sourceX = 8,
      sourceY = 12,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 348,
      y = 384,
      width = 152,
      height = 88,
      sourceX = 10,
      sourceY = 12,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 350,
      y = 294,
      width = 154,
      height = 84,
      sourceX = 8,
      sourceY = 12,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 350,
      y = 202,
      width = 154,
      height = 86,
      sourceX = 8,
      sourceY = 12,
      sourceWidth = 170,
      sourceHeight = 110
    },
    {
      x = 4,
      y = 560,
      width = 118,
      height = 84,
      sourceX = 22,
      sourceY = 92,
      sourceWidth = 160,
      sourceHeight = 200
    },
    {
      x = 256,
      y = 596,
      width = 118,
      height = 84,
      sourceX = 22,
      sourceY = 92,
      sourceWidth = 160,
      sourceHeight = 200
    },
    {
      x = 132,
      y = 536,
      width = 118,
      height = 86,
      sourceX = 22,
      sourceY = 90,
      sourceWidth = 160,
      sourceHeight = 200
    },
    {
      x = 128,
      y = 628,
      width = 112,
      height = 96,
      sourceX = 22,
      sourceY = 80,
      sourceWidth = 160,
      sourceHeight = 200
    },
    {
      x = 358,
      y = 4,
      width = 128,
      height = 100,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 176,
      y = 430,
      width = 128,
      height = 100,
      sourceX = 14,
      sourceY = 0,
      sourceWidth = 160,
      sourceHeight = 100
    },
    {
      x = 4,
      y = 442,
      width = 122,
      height = 112,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 122,
      sourceHeight = 111
    },
    {
      x = 310,
      y = 478,
      width = 122,
      height = 112,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 122,
      sourceHeight = 111
    }
  },
  sheetContentWidth = 512,
  sheetContentHeight = 1024
}
SheetInfo.frameIndex = {
  big_shroom1 = 1,
  big_shroom2 = 2,
  big_shroom3 = 3,
  big_shroom4 = 4,
  groundThorns1 = 5,
  groundThorns2 = 6,
  groundThorns3 = 7,
  groundThorns4 = 8,
  powerupBox0 = 9,
  powerupBox1 = 10,
  powerupBox2 = 11,
  powerupBox3 = 12,
  powerupBox4 = 13,
  roofThorns1 = 14,
  roofThorns2 = 15,
  roofThorns3 = 16,
  roofThorns4 = 17,
  small_shroom1 = 18,
  small_shroom2 = 19,
  small_shroom3 = 20,
  small_shroom4 = 21,
  speedFlat1 = 22,
  speedFlat2 = 23,
  speedHill1 = 24,
  speedHill2 = 25
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
