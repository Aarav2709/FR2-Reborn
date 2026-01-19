local AttachmentType = require("spine-lua.AttachmentType")
local RegionAttachment = require("spine-lua.RegionAttachment")
local BoundingBoxAttachment = require("spine-lua.BoundingBoxAttachment")
local AttachmentLoader = {}

function AttachmentLoader.new()
  local self = {}
  
  function self:newRegionAttachment(skin, name, path)
    return RegionAttachment.new(name)
  end
  
  function self:newMeshAttachment(skin, name, path)
    return MeshAttachment.new(name)
  end
  
  function self:newSkinningMeshAttachment(skin, name, path)
    return SkinningMeshAttachment.new(name)
  end
  
  function self:newBoundingBoxAttachment(skin, name)
    return BoundingBoxAttachment.new(name)
  end
  
  return self
end

return AttachmentLoader
