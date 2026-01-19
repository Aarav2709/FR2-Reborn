local AnimationState = {}

function AnimationState.new(data)
  if not data then
    error("data cannot be nil", 2)
  end
  local self = {
    data = data,
    tracks = {},
    trackCount = 0,
    events = {},
    onStart = nil,
    onEnd = nil,
    onComplete = nil,
    onEvent = nil,
    timeScale = 1
  }

  local function setCurrent(index, entry)
    local current = self.tracks[index]
    if current then
      local previous = current.previous
      current.previous = nil
      if current.onEnd then
        current.onEnd(index)
      end
      if self.onEnd then
        self.onEnd(index)
      end
      entry.mixDuration = self.data:getMix(current.animation.name, entry.animation.name)
      if entry.mixDuration > 0 then
        entry.mixTime = 0
        if previous and current.mixTime / current.mixDuration < 0.5 then
          entry.previous = previous
        else
          entry.previous = current
        end
      end
    end
    self.tracks[index] = entry
    self.trackCount = math.max(self.trackCount, index)
    if entry.onStart then
      entry.onStart(index)
    end
    if self.onStart then
      self.onStart(index)
    end
  end

  function self:update(delta)
    delta = delta * self.timeScale
    for i = 0, self.trackCount do
      local current = self.tracks[i]
      if current then
        current.time = current.time + delta * current.timeScale
        if current.previous then
          local previousDelta = delta * current.previous.timeScale
          current.previous.time = current.previous.time + previousDelta
          current.mixTime = current.mixTime + previousDelta
        end
        local next = current.next
        if next then
          next.time = current.lastTime - next.delay
          if 0 <= next.time then
            setCurrent(i, next)
          end
        elseif not current.loop and current.lastTime >= current.endTime then
          self:clearTrack(i)
        end
      end
    end
  end

  function self:apply(skeleton)
    for i = 0, self.trackCount do
      local current = self.tracks[i]
      if current then
        local time = current.time
        local lastTime = current.lastTime
        local endTime = current.endTime
        local loop = current.loop
        if not loop and time > endTime then
          time = endTime
        end
        local previous = current.previous
        if not previous then
          if current.mix == 1 then
            current.animation:apply(skeleton, current.lastTime, time, loop, self.events)
          else
            current.animation:mix(skeleton, current.lastTime, time, loop, self.events, current.mix)
          end
        else
          local previousTime = previous.time
          if not previous.loop and previousTime > previous.endTime then
            previousTime = previous.endTime
          end
          previous.animation:apply(skeleton, previousTime, previousTime, previous.loop, nil)
          local alpha = current.mixTime / current.mixDuration * current.mix
          if 1 <= alpha then
            alpha = 1
            current.previous = nil
          end
          current.animation:mix(skeleton, current.lastTime, time, loop, self.events, alpha)
        end
        local eventCount = #self.events
        for ii = 1, eventCount do
          local event = self.events[ii]
          if current.onEvent then
            current.onEvent(i, event)
          end
          if self.onEvent then
            self.onEvent(i, event)
          end
        end
        for ii = 1, eventCount do
          table.remove(self.events)
        end
        local complete
        if current.loop then
          complete = lastTime % endTime > time % endTime
        else
          complete = lastTime < endTime and endTime <= time
        end
        if complete then
          local count = math.floor(time / endTime)
          if current.onComplete then
            current.onComplete(i, count)
          end
          if self.onComplete then
            self.onComplete(i, count)
          end
        end
        current.lastTime = current.time
      end
    end
  end

  function self:clearTracks()
    for i, current in pairs(self.tracks) do
      self.clearTrack(i)
    end
    self.tracks = {}
    self.trackCount = 0
  end

  function self:clearTrack(trackIndex)
    local current = self.tracks[trackIndex]
    if not current then
      return
    end
    if current.onEnd then
      current.onEnd(trackIndex)
    end
    if self.onEnd then
      self.onEnd(trackIndex)
    end
    self.tracks[trackIndex] = nil
    if trackIndex == self.trackCount - 1 then
    end
  end

  function self:setAnimationByName(trackIndex, animationName, loop)
    local animation = self.data.skeletonData:findAnimation(animationName)
    if not animation then
      print("⚠️ WARNING: Animation not found: " .. animationName .. " - skipping")
      return nil  -- Hata yerine nil dön
    end
    return self:setAnimation(trackIndex, animation, loop)
  end

  function self:setAnimation(trackIndex, animation, loop)
    local entry = AnimationState.TrackEntry.new()
    entry.animation = animation
    entry.loop = loop
    entry.endTime = animation.duration
    setCurrent(trackIndex, entry)
    return entry
  end

  function self:addAnimationByName(trackIndex, animationName, loop, delay)
    local animation = self.data.skeletonData:findAnimation(animationName)
    if not animation then
      error("Animation not found: " .. animationName)
    end
    return self:addAnimation(trackIndex, animation, loop, delay)
  end

  function self:addAnimation(trackIndex, animation, loop, delay)
    local entry = AnimationState.TrackEntry.new()
    entry.animation = animation
    entry.loop = loop
    entry.endTime = animation.duration
    local last = self.tracks[trackIndex]
    if last then
      while last.next do
        last = last.next
      end
      last.next = entry
    else
      self.tracks[trackIndex] = entry
    end
    delay = delay or 0
    if delay <= 0 then
      if last then
        delay = delay + last.endTime - self.data:getMix(last.animation.name, animation.name)
      else
        delay = 0
      end
    end
    entry.delay = delay
    self.trackCount = math.max(self.trackCount, trackIndex)
    return entry
  end

  function self:getCurrent(trackIndex)
    return self.tracks[trackIndex]
  end

  return self
end

AnimationState.TrackEntry = {}

function AnimationState.TrackEntry.new(data)
  local self = {
    next = nil,
    previous = nil,
    animation = nil,
    loop = false,
    delay = 0,
    time = 0,
    lastTime = -1,
    endTime = 0,
    timeScale = 1,
    mixTime = 0,
    mixDuration = 0,
    mix = 1,
    onStart = nil,
    onEnd = nil,
    onComplete = nil,
    onEvent = nil
  }
  return self
end

return AnimationState