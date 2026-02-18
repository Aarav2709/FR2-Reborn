local SheetInfo = {}

local frames = {}
for i = 1, 25 do
  frames[i] = {
    x = 0,
    y = 0,
    width = 160,
    height = 100
  }
end

SheetInfo.sheet = {
  frames = frames,
  sheetContentWidth = 160,
  sheetContentHeight = 100
}

SheetInfo.frameIndex = {
  big_shroom1 = 1,
  big_shroom2 = 2,
  big_shroom3 = 3,
  big_shroom4 = 4,
  small_shroom1 = 5,
  small_shroom2 = 6,
  small_shroom3 = 7,
  small_shroom4 = 8,
  powerupBox0 = 9,
  powerupBox1 = 10,
  powerupBox2 = 11,
  powerupBox3 = 12,
  powerupBox4 = 13,
  roofThorns1 = 14,
  roofThorns2 = 15,
  roofThorns3 = 16,
  roofThorns4 = 17,
  groundThorns1 = 18,
  groundThorns2 = 19,
  groundThorns3 = 20,
  groundThorns4 = 21,
  speedFlat1 = 22,
  speedFlat2 = 23,
  speedHill1 = 24,
  speedHill2 = 25,
  cannon = 1
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
