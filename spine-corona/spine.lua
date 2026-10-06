spine = {}
spine.utils = require("spine-lua.utils")
spine.SkeletonJson = require("spine-lua.SkeletonJson")
spine.SkeletonData = require("spine-lua.SkeletonData")
spine.BoneData = require("spine-lua.BoneData")
spine.SlotData = require("spine-lua.SlotData")
spine.Skin = require("spine-lua.Skin")
spine.RegionAttachment = require("spine-lua.RegionAttachment")
spine.MeshAttachment = require("spine-lua.MeshAttachment")
spine.SkinnedMeshAttachment = require("spine-lua.SkinnedMeshAttachment")
spine.Skeleton = require("spine-lua.Skeleton")
spine.Bone = require("spine-lua.Bone")
spine.Slot = require("spine-lua.Slot")
spine.AttachmentType = require("spine-lua.AttachmentType")
spine.AttachmentLoader = require("spine-lua.AttachmentLoader")
spine.Animation = require("spine-lua.Animation")
spine.AnimationStateData = require("spine-lua.AnimationStateData")
spine.AnimationState = require("spine-lua.AnimationState")
spine.EventData = require("spine-lua.EventData")
spine.Event = require("spine-lua.Event")
spine.SkeletonBounds = require("spine-lua.SkeletonBounds")
composer = require("composer")

function spine.utils.readFile(fileName, base)
  base = base or system.ResourceDirectory
  local path = system.pathForFile(fileName, base)
  local file = io.open(path, "r")
  if not file then
    return nil
  end
  local contents = file:read("*a")
  io.close(file)
  return contents
end

local json = require("json")

function spine.utils.readJSON(text)
  return json.decode(text)
end

spine.Skeleton.failed = {}
spine.Skeleton.new_super = spine.Skeleton.new

function spine.Skeleton.new(skeletonData, group)
  local self = spine.Skeleton.new_super(skeletonData)
  self.group = group or display.newGroup()
  self.images = {}

  function self:createImage(attachment)
    local image = display.newImage(attachment.name .. ".png")
    if image then
      image.fill.effect = "filter.linearGradient"
    end
    return image
  end

  function self:modifyImage(attachment)
    return false
  end

  local updateWorldTransform_super = self.updateWorldTransform

  local regionType, meshType = spine.AttachmentType.region, spine.AttachmentType.mesh
  local failedImage = spine.Skeleton.failed
  local abs = math.abs

  function self:updateWorldTransform()
    updateWorldTransform_super(self)
    local images = self.images
    local skeletonR, skeletonG, skeletonB, skeletonA = self.r, self.g, self.b, self.a
    local flipX, flipY = self.flipX and -1 or 1, self.flipY and -1 or 1
    local drawOrder = self.drawOrder
    local order = self.imageOrder
    if not order then
      order = {}
      self.imageOrder = order
    end
    local count = 0
    local orderChanged = false
    for i = 1, #drawOrder do
      local slot = drawOrder[i]
      local image = images[slot]
      local attachment = slot.attachment
      if not attachment then
        if image then
          display.remove(image)
          images[slot] = nil
          orderChanged = true
        end
      else
        local attachmentType = attachment.type
        if attachmentType == regionType or attachmentType == meshType then
          if image and image ~= failedImage and not image.translate then
            images[slot] = nil
            image = nil
          end
          if image and image.attachment ~= attachment then
            if self:modifyImage(image, attachment) then
              image.lastR, image.lastA = nil, nil
              image.attachment = attachment
            else
              display.remove(image)
              images[slot] = nil
              image = nil
            end
          end
          if not image then
            image = self:createImage(attachment)
            if image then
              image.attachment = attachment
              image.anchorX = 0.5
              image.anchorY = 0.5
            else
              image = failedImage
            end
            if slot.data.additiveBlending then
              image.blendMode = "add"
            end
            images[slot] = image
            orderChanged = true
          end
          if image ~= failedImage then
            local bone = slot.bone
            local attachmentX, attachmentY = attachment.x, attachment.y
            local x = bone.worldX + attachmentX * bone.m00 + attachmentY * bone.m01
            local y = -(bone.worldY + attachmentX * bone.m10 + attachmentY * bone.m11)
            local lastX = image.lastX
            if not lastX then
              image.x, image.y = x, y
              image.lastX, image.lastY = x, y
            elseif lastX ~= x or image.lastY ~= y then
              image:translate(x - lastX, y - image.lastY)
              image.lastX, image.lastY = x, y
            end
            local xScale = attachment.scaleX * flipX
            local yScale = attachment.scaleY * flipY
            local attachmentRotation = attachment.rotation
            if abs(attachmentRotation) % 180 == 90 then
              xScale = xScale * bone.worldScaleY
              yScale = yScale * bone.worldScaleX
            else
              xScale = xScale * bone.worldScaleX
              yScale = yScale * bone.worldScaleY
            end
            local lastScaleX = image.lastScaleX
            if not lastScaleX then
              image.xScale, image.yScale = xScale, yScale
              image.lastScaleX, image.lastScaleY = xScale, yScale
            elseif lastScaleX ~= xScale or image.lastScaleY ~= yScale then
              image:scale(xScale / lastScaleX, yScale / image.lastScaleY)
              image.lastScaleX, image.lastScaleY = xScale, yScale
            end
            local rotation = -(bone.worldRotation + attachmentRotation) * flipX * flipY
            local lastRotation = image.lastRotation
            if not lastRotation then
              image.rotation = rotation
              image.lastRotation = rotation
            elseif rotation ~= lastRotation then
              image:rotate(rotation - lastRotation)
              image.lastRotation = rotation
            end
            local r, g, b = skeletonR * slot.r, skeletonG * slot.g, skeletonB * slot.b
            if image.lastR ~= r or image.lastG ~= g or image.lastB ~= b or not image.lastR then
              image:setFillColor(r, g, b)
              image.lastR, image.lastG, image.lastB = r, g, b
            end
            local a = skeletonA * slot.a
            if a and (image.lastA ~= a or not image.lastA) then
              image.lastA = a
              image.alpha = a
            end
            count = count + 1
            if order[count] ~= image then
              order[count] = image
              orderChanged = true
            end
          end
        end
      end
    end
    if order[count + 1] ~= nil then
      for i = #order, count + 1, -1 do
        order[i] = nil
      end
      orderChanged = true
    end
    if orderChanged then
      local group = self.group
      for i = 1, count do
        group:insert(order[i])
      end
    end
    if self.debug then
      for i, bone in ipairs(self.bones) do
        if not bone.line then
          bone.line = display.newLine(0, 0, bone.data.length, 0)
          bone.line:setStrokeColor(1, 0, 0)
        end
        bone.line.x = bone.worldX
        bone.line.y = -bone.worldY
        bone.line.rotation = -bone.worldRotation
        if self.flipX then
          bone.line.xScale = -1
          bone.line.rotation = -bone.line.rotation
        else
          bone.line.xScale = 1
        end
        if self.flipY then
          bone.line.yScale = -1
          bone.line.rotation = -bone.line.rotation
        else
          bone.line.yScale = 1
        end
        self.group:insert(bone.line)
        if not bone.circle then
          bone.circle = display.newCircle(0, 0, 3)
          bone.circle:setFillColor(0, 1, 0)
        end
        bone.circle.x = bone.worldX
        bone.circle.y = -bone.worldY
        self.group:insert(bone.circle)
      end
    end
    if self.debugAabb then
      if not self.bounds then
        self.bounds = spine.SkeletonBounds.new()
        self.boundsRect = display.newRect(self.group, 0, 0, 0, 0)
        self.boundsRect:setFillColor(0, 0, 0, 0)
        self.boundsRect.strokeWidth = 1
        self.boundsRect:setStrokeColor(0, 1, 0, 1)
      end
      self.bounds:update(self, true)
      local width = self.bounds:getWidth()
      local height = self.bounds:getHeight()
      self.boundsRect.x = self.bounds.minX + width / 2
      self.boundsRect.y = -self.bounds.minY - height / 2
      self.boundsRect.width = width
      self.boundsRect.height = height
      self.group:insert(self.boundsRect)
    end
  end

  return self
end

return spine
