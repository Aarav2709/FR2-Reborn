local SkeletonData = {}

function SkeletonData.new()
  local self = {
    bones = {},
    slots = {},
    slotNameIndices = {},
    skins = {},
    events = {},
    animations = {},
    defaultSkin = nil
  }
  
  function self:findBone(boneName)
    if not boneName then
      error("boneName cannot be nil.", 2)
    end
    for i, bone in ipairs(self.bones) do
      if bone.name == boneName then
        return bone
      end
    end
    return nil
  end
  
  function self:findBoneIndex(boneName)
    if not boneName then
      error("boneName cannot be nil.", 2)
    end
    for i, bone in ipairs(self.bones) do
      if bone.name == boneName then
        return i
      end
    end
    return -1
  end
  
  function self:findSlot(slotName)
    if not slotName then
      error("slotName cannot be nil.", 2)
    end
    for i, slot in ipairs(self.slots) do
      if slot.name == slotName then
        return slot
      end
    end
    return nil
  end
  
  function self:findSlotIndex(slotName)
    if not slotName then
      error("slotName cannot be nil.", 2)
    end
    return self.slotNameIndices[slotName] or -1
  end
  
  function self:findSkin(skinName)
    if not skinName then
      error("skinName cannot be nil.", 2)
    end
    for i, skin in ipairs(self.skins) do
      if skin.name == skinName then
        return skin
      end
    end
    return nil
  end
  
  function self:findEvent(eventName)
    if not eventName then
      error("eventName cannot be nil.", 2)
    end
    for i, event in ipairs(self.events) do
      if event.name == eventName then
        return event
      end
    end
    return nil
  end
  
  function self:findAnimation(animationName)
    if not animationName then
      error("animationName cannot be nil.", 2)
    end
    for i, animation in ipairs(self.animations) do
      if animation.name == animationName then
        return animation
      end
    end
    return nil
  end
  
  return self
end

return SkeletonData
