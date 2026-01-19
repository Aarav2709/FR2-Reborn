local Bone = require("spine-lua.Bone")
local Slot = require("spine-lua.Slot")
local AttachmentLoader = require("spine-lua.AttachmentLoader")
local Skeleton = {}

function Skeleton.new(skeletonData)
  if not skeletonData then
    error("skeletonData cannot be nil", 2)
  end
  local self = {
    data = skeletonData,
    bones = {},
    slots = {},
    slotsByName = {},
    drawOrder = {},
    r = 1,
    g = 1,
    b = 1,
    a = 1,
    x = 0,
    y = 0,
    skin = nil,
    flipX = false,
    flipY = false,
    time = 0
  }
  
  function self:updateWorldTransform()
    for i, bone in ipairs(self.bones) do
      bone:updateWorldTransform(self.flipX, self.flipY)
    end
  end
  
  function self:setToSetupPose()
    self:setBonesToSetupPose()
    self:setSlotsToSetupPose()
  end
  
  function self:setBonesToSetupPose()
    for i, bone in ipairs(self.bones) do
      bone:setToSetupPose()
    end
  end
  
  function self:setSlotsToSetupPose()
    for i, slot in ipairs(self.slots) do
      self.drawOrder[i] = slot
      slot:setToSetupPose()
    end
  end
  
  function self:getRootBone()
    return self.bones[1]
  end
  
  function self:findBone(boneName)
    if not boneName then
      error("boneName cannot be nil.", 2)
    end
    for i, bone in ipairs(self.bones) do
      if bone.data.name == boneName then
        return bone
      end
    end
    return nil
  end
  
  function self:findSlot(slotName)
    if not slotName then
      error("slotName cannot be nil.", 2)
    end
    return self.slotsByName[slotName]
  end
  
  function self:setSkin(skinName)
    local newSkin
    if skinName then
      newSkin = self.data:findSkin(skinName)
      if not newSkin then
        error("Skin not found = " .. skinName, 2)
      end
      if self.skin then
        for k, v in pairs(self.skin.attachments) do
          local attachment = v[3]
          local slotIndex = v[1]
          local slot = self.slots[slotIndex]
          if slot.attachment == attachment then
            local name = v[2]
            local newAttachment = newSkin:getAttachment(slotIndex, name)
            if newAttachment then
              slot:setAttachment(newAttachment)
            end
          end
        end
      else
        for i, slot in ipairs(self.slots) do
          local name = slot.data.attachmentName
          if name then
            local attachment = newSkin:getAttachment(i, name)
            if attachment then
              slot:setAttachment(attachment)
            end
          end
        end
      end
    end
    self.skin = newSkin
  end
  
  function self:getAttachment(slotName, attachmentName)
    if not slotName then
      error("slotName cannot be nil.", 2)
    end
    if not attachmentName then
      error("attachmentName cannot be nil.", 2)
    end
    local slotIndex = skeletonData.slotNameIndices[slotName]
    if slotIndex == -1 then
      error("Slot not found = " .. slotName, 2)
    end
    if self.skin then
      local attachment = self.skin:getAttachment(slotIndex, attachmentName)
      if attachment then
        return attachment
      end
    end
    if self.data.defaultSkin then
      return self.data.defaultSkin:getAttachment(slotIndex, attachmentName)
    end
    return nil
  end
  
  function self:setAttachment(slotName, attachmentName)
    if not slotName then
      error("slotName cannot be nil.", 2)
    end
    for i, slot in ipairs(self.slots) do
      if slot.data.name == slotName then
        if not attachmentName then
          slot:setAttachment(nil)
        else
          slot:setAttachment(self:getAttachment(slotName, attachmentName))
        end
        return
      end
    end
    error("Slot not found = " .. slotName, 2)
  end
  
  function self:update(delta)
    self.time = self.time + delta
  end
  
  function self:setColor(r, g, b, a)
    self.r = r
    self.g = g
    self.b = b
    self.a = a
  end
  
  for i, boneData in ipairs(skeletonData.bones) do
    local parent
    if boneData.parent then
      parent = self.bones[spine.utils.indexOf(skeletonData.bones, boneData.parent)]
    end
    table.insert(self.bones, Bone.new(boneData, parent))
  end
  for i, slotData in ipairs(skeletonData.slots) do
    local bone = self.bones[spine.utils.indexOf(skeletonData.bones, slotData.boneData)]
    local slot = Slot.new(slotData, self, bone)
    table.insert(self.slots, slot)
    self.slotsByName[slot.data.name] = slot
    table.insert(self.drawOrder, slot)
  end
  return self
end

return Skeleton
