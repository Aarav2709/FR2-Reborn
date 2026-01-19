local SheetInfo = {}
SheetInfo.sheet = {
  frames = {
    {
      x = 184,
      y = 130,
      width = 32,
      height = 32,
      sourceX = 34,
      sourceY = 35,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 186,
      y = 72,
      width = 54,
      height = 56,
      sourceX = 23,
      sourceY = 22,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 186,
      y = 2,
      width = 62,
      height = 68,
      sourceX = 19,
      sourceY = 18,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 174,
      width = 78,
      height = 78,
      sourceX = 12,
      sourceY = 11,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 98,
      y = 2,
      width = 86,
      height = 84,
      sourceX = 8,
      sourceY = 9,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 2,
      width = 94,
      height = 94,
      sourceX = 5,
      sourceY = 1,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 98,
      y = 88,
      width = 84,
      height = 84,
      sourceX = 5,
      sourceY = 7,
      sourceWidth = 100,
      sourceHeight = 100
    },
    {
      x = 2,
      y = 98,
      width = 76,
      height = 74,
      sourceX = 4,
      sourceY = 16,
      sourceWidth = 100,
      sourceHeight = 100
    }
  },
  sheetContentWidth = 256,
  sheetContentHeight = 256
}
SheetInfo.frameIndex = {
  ["0"] = 1,
  ["1"] = 2,
  ["2"] = 3,
  ["3"] = 4,
  ["4"] = 5,
  ["5"] = 6,
  ["6"] = 7,
  ["7"] = 8
}

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return self.frameIndex[name]
end

return SheetInfo
