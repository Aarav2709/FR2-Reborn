local SheetInfo = {}

local frames = {}
for i = 1, 256 do
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

function SheetInfo:getSheet()
  return self.sheet
end

function SheetInfo:getFrameIndex(name)
  return nil
end

return SheetInfo
