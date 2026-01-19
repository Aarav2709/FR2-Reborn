local BoneData = {}

function BoneData.new(name, parent)
  if not name then
    error("name cannot be nil", 2)
  end
  local self = {
    name = name,
    parent = parent,
    length = 0,
    x = 0,
    y = 0,
    rotation = 0,
    scaleX = 1,
    scaleY = 1,
    inheritScale = true,
    inheritRotation = true
  }
  return self
end

return BoneData
