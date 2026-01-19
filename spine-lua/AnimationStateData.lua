local AnimationStateData = {}

function AnimationStateData.new(skeletonData)
  if not skeletonData then
    error("skeletonData cannot be nil", 2)
  end
  local self = {
    skeletonData = skeletonData,
    animationToMixTime = {},
    defaultMix = 0
  }
  
  function self:setMix(fromName, toName, duration)
    if not self.animationToMixTime[fromName] then
      self.animationToMixTime[fromName] = {}
    end
    self.animationToMixTime[fromName][toName] = duration
  end
  
  function self:getMix(fromName, toName)
    local first = self.animationToMixTime[fromName]
    if not first then
      return self.defaultMix
    end
    local duration = first[toName]
    if not duration then
      return self.defaultMix
    end
    return duration
  end
  
  return self
end

return AnimationStateData
