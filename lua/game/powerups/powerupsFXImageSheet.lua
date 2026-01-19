local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 138,
      y = 2,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 250,
      y = 2,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 362,
      y = 2,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 138,
      y = 114,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 2,
      y = 132,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 250,
      y = 114,
      width = 108,
      height = 108,
      sourceX = 2,
      sourceY = 4,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 474,
      y = 2,
      width = 2,
      height = 2,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 454,
      y = 114,
      width = 50,
      height = 64,
      sourceX = 8,
      sourceY = 10,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 362,
      y = 206,
      width = 80,
      height = 90,
      sourceX = 8,
      sourceY = 8,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 362,
      y = 114,
      width = 88,
      height = 88,
      sourceX = 20,
      sourceY = 20,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 446,
      y = 206,
      width = 58,
      height = 56,
      sourceX = 50,
      sourceY = 52,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 474,
      y = 2,
      width = 2,
      height = 2,
      sourceX = 0,
      sourceY = 0,
      sourceWidth = 111,
      sourceHeight = 111
    },
    {
      x = 2,
      y = 2,
      width = 132,
      height = 126,
      sourceX = 4,
      sourceY = 0,
      sourceWidth = 136,
      sourceHeight = 126
    }
  },
  sheetContentWidth = 512,
  sheetContentHeight = 512
}
SheetInfo.frameIndex = {
  activate1 = 1,
  activate2 = 2,
  activate3 = 3,
  activate4 = 4,
  activate5 = 5,
  activate6 = 6,
  activate7 = 7,
  shine1 = 8,
  shine2 = 9,
  shine3 = 10,
  shine4 = 11,
  shine5 = 12,
  shine6 = 13
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
