local Slot = {}

function Slot.new(slotData, skeleton, bone)
  if not slotData then
    error("slotData cannot be nil", 2)
  end
  if not skeleton then
    error("skeleton cannot be nil", 2)
  end
  if not bone then
    error("bone cannot be nil", 2)
  end
  local self = {
    data = slotData,
    skeleton = skeleton,
    bone = bone,
    r = 1,
    g = 1,
    b = 1,
    a = 1,
    attachment = nil,
    attachmentTime = 0,
    attachmentVertices = nil
  }
  
  function self:setColor(r, g, b, a)
    self.r = r
    self.g = g
    self.b = b
    self.a = a
  end
  
  function self:setAttachment(attachment)
    self.attachment = attachment
    self.attachmentTime = self.skeleton.time
  end
  
  function self:setAttachmentTime(time)
    self.attachmentTime = self.skeleton.time - time
  end
  
  function self:getAttachmentTime()
    return self.skeleton.time - self.attachmentTime
  end
  
  function self:setToSetupPose()
    local data = self.data
    self:setColor(data.r, data.g, data.b, data.a)
    local attachment
    if data.attachmentName then
      attachment = self.skeleton:getAttachment(data.name, data.attachmentName)
    end
    self:setAttachment(attachment)
  end
  
  self:setToSetupPose()
  return self
end

return Slot
