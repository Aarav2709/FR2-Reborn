local AttachmentType = require("spine-lua.AttachmentType")
local SkinnedMeshAttachment = {}

function SkinnedMeshAttachment.new(name)
  if not name then
    error("name cannot be nil", 2)
  end
  local self = {
    name = name,
    type = AttachmentType.mesh,
    bones = nil,
    weights = nil,
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
    local skeletonBones = slot.skeleton.bones
    local weights = self.weights
    local bones = self.bones
    local w, v, b, f = 0, 0, 0, 0
    local n = bones.length
    local wx, wy, bone, vx, vy, weight
    if #slot.attachmentVertices == 0 then
      while v < n do
        wx = 0
        wy = 0
        local nn = bones[v] + v
        v = v + 1
        while nn >= v do
          bone = skeletonBones[bones[v]]
          vx = weights[b]
          vy = weights[b + 1]
          weight = weights[b + 2]
          wx = wx + (vx * bone.m00 + vy * bone.m01 + bone.worldX) * weight
          wy = wy + (vx * bone.m10 + vy * bone.m11 + bone.worldY) * weight
          v = v + 1
          b = b + 3
        end
        worldVertices[w] = wx + x
        worldVertices[w + 1] = wy + y
        w = w + 2
      end
    else
      local ffd = slot.attachmentVertices
      while n > v do
        wx = 0
        wy = 0
        local nn = bones[v] + v
        v = v + 1
        while nn >= v do
          bone = skeletonBones[bones[v]]
          vx = weights[b] + ffd[f]
          vy = weights[b + 1] + ffd[f + 1]
          weight = weights[b + 2]
          wx = wx + (vx * bone.m00 + vy * bone.m01 + bone.worldX) * weight
          wy = wy + (vx * bone.m10 + vy * bone.m11 + bone.worldY) * weight
          v = v + 1
          b = b + 3
          f = f + 2
        end
        worldVertices[w] = wx + x
        worldVertices[w + 1] = wy + y
        w = w + 2
      end
    end
  end
  
  return self
end

return MeshAttachment
