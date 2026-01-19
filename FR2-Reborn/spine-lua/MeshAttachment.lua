local AttachmentType = require("spine-lua.AttachmentType")
local MeshAttachment = {}

function MeshAttachment.new(name)
  if not name then
    error("name cannot be nil", 2)
  end
  local self = {
    name = name,
    type = AttachmentType.mesh,
    vertices = nil,
    uvs = nil,
    regionUVs = nil,
    triangles = nil,
    hullLength = 0,
    r = 1,
    g = 1,
    b = 1,
    a = 1,
    path = nil,
    rendererObject = nil,
    regionU = 0,
    regionV = 0,
    regionU2 = 0,
    regionV2 = 0,
    regionRotate = false,
    regionOffsetX = 0,
    regionOffsetY = 0,
    regionWidth = 0,
    regionHeight = 0,
    regionOriginalWidth = 0,
    regionOriginalHeight = 0,
    edges = nil,
    width = 0,
    height = 0
  }
  
  function self:updateUVs()
    local width, height = self.regionU2 - self.regionU, self.regionV2 - self.regionV
    local n = #self.regionUVs
    if not self.uvs or #self.uvs ~= n then
      self.uvs = {}
    end
    if self.regionRotate then
      for i = 1, n, 2 do
        self.uvs[i] = self.regionU + self.regionUVs[i + 1] * width
        self.uvs[i + 1] = self.regionV + height - self.regionUVs[i] * height
      end
    else
      for i = 1, n, 2 do
        self.uvs[i] = self.regionU + self.regionUVs[i] * width
        self.uvs[i + 1] = self.regionV + self.regionUVs[i + 1] * height
      end
    end
  end
  
  function self:computeWorldVertices(x, y, slot, worldVertices)
    local bone = slot.bone
    x = x + bone.worldX
    y = y + bone.worldY
    local m00, m01, m10, m11 = bone.m00, bone.m01, bone.m10, bone.m11
    local vertices = self.vertices
    local verticesCount = vertices.length
    if #slot.attachmentVertices == verticesCount then
      vertices = slot.attachmentVertices
    end
    for i = 1, verticesCount, 2 do
      local vx = vertices[i]
      local vy = vertices[i + 1]
      worldVertices[i] = vx * m00 + vy * m01 + x
      worldVertices[i + 1] = vx * m10 + vy * m11 + y
    end
  end
  
  return self
end

return MeshAttachment
