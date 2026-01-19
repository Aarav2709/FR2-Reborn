local AttachmentType = require("spine-lua.AttachmentType")
local BoundingBoxAttachment = {}

function BoundingBoxAttachment.new(name)
  if not name then
    error("name cannot be nil", 2)
  end
  local self = {
    name = name,
    type = AttachmentType.boundingbox,
    vertices = {}
  }
  
  function self:computeWorldVertices(x, y, bone, worldVertices)
    x = x + bone.worldX
    y = y + bone.worldY
    local m00 = bone.m00
    local m01 = bone.m01
    local m10 = bone.m10
    local m11 = bone.m11
    local vertices = self.vertices
    local count = #vertices
    for i = 1, count, 2 do
      local px = vertices[i]
      local py = vertices[i + 1]
      worldVertices[i] = px * m00 + py * m01 + x
      worldVertices[i + 1] = px * m10 + py * m11 + y
    end
  end
  
  return self
end

return BoundingBoxAttachment
