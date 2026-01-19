local composer = require("composer")
local M = {
  fpsTimeStamps = nil,
  fpsText = nil,
  luaMemText = nil,
  texMemText = nil,
  profiler = nil
}

local function dbg(moduleName, ...)
  if M[moduleName] then
    local scene = composer.getSceneName("current")
    if scene then
      print("[" .. moduleName .. "][" .. scene .. "]: " .. unpack(arg))
    else
      print("[" .. moduleName .. "]" .. unpack(arg))
    end
  end
end

local function debugPrint(moduleName, ...)
  if M[moduleName] then
    local scene = composer.getSceneName("current")
    if scene then
      print("[" .. moduleName .. "][" .. scene .. "]: " .. string.format(unpack(arg)))
    else
      print("[" .. moduleName .. "]" .. string.format(unpack(arg)))
    end
  end
end

M.debugPrint = debugPrint

local function debugTable(moduleName, label, t, level)
  if M[moduleName] then
    if label then
      dbg(moduleName, label)
    end
    level = level or 0
    if 10 < level then
      return
    end
    if t then
      for k, v in pairs(t) do
        local prefix = ""
        for i = 1, level do
          prefix = prefix .. "    "
        end
        dbg(moduleName, prefix .. "[" .. tostring(k) .. "] = " .. tostring(v))
        if type(v) == "table" then
          dbg(moduleName, prefix .. "{")
          debugTable(moduleName, nil, v, level + 1)
          dbg(moduleName, prefix .. "}")
        end
      end
    end
  end
end

M.debugTable = debugTable

local function logFPS()
  if composer.debugger.fpsGame then
    if not M.fpsText then
      M.fpsText = display.newText("", 10, 10, native.systemFont, 12)
      M.fpsText:setFillColor(1, 0.1, 0.1)
    end
    if not M.fpsTimeStamps then
      M.fpsTimeStamps = {}
    end
    if M.fpsTimeStamps then
      local currentTimestamp = system.getTimer()
      M.fpsTimeStamps[#M.fpsTimeStamps + 1] = currentTimestamp
      local fpsCount = 0
      for i = 1, #M.fpsTimeStamps do
        if currentTimestamp - M.fpsTimeStamps[i] < 1000 then
          fpsCount = fpsCount + 1
        end
      end
      M.fpsText.text = fpsCount
    end
  end
end

M.logFPS = logFPS

local function logMemUsage()
  if composer.debugger.memoryCheck then
    if not M.texMemText then
      M.texMemText = display.newText("", 30, 30, native.systemFont, 12)
      M.texMemText.anchorX = 0
      M.texMemText:setFillColor(1, 0.1, 0.1)
    end
    if not M.luaMemText then
      M.luaMemText = display.newText("", 30, 10, native.systemFont, 12)
      M.luaMemText.anchorX = 0
      M.luaMemText:setFillColor(1, 0.1, 0.1)
    end
    local luaMemory = collectgarbage("count") / 1024
    local textureMemory = system.getInfo("textureMemoryUsed") / 1048576
    M.luaMemText.text = "LUAMEM: " .. luaMemory
    M.texMemText.text = "TextureMEM: " .. textureMemory
  end
end

M.logMemUsage = logMemUsage

local function profile(stringIdentifier)
  if composer.debugger.profiling then
    if not M.profiler then
      M.profiler = {}
    end
    if not M.profiler[stringIdentifier] then
      M.profiler[stringIdentifier] = {}
      M.profiler[stringIdentifier].timestamps = {}
      M.profiler[stringIdentifier].numberOfEvents = 0
    end
    M.profiler[stringIdentifier].numberOfEvents = M.profiler[stringIdentifier].numberOfEvents + 1
    M.profiler[stringIdentifier].timestamps[#M.profiler[stringIdentifier].timestamps + 1] = system.getTimer()
  end
end

M.profile = profile

local function flushProfiler()
  if not composer.debugger.profiling or not M.profiler then
    return
  end
  print("-----------------------------")
  print("----------PROFILER-----------")
  print("-----------------------------")
  for key, value in pairs(M.profiler) do
    local timeSpentInEvent = 0
    local minTime = 9999999
    local maxTime = 0
    local startPos = #M.profiler[key].timestamps
    if M.profiler[key].numberOfEvents % 2 == 1 then
      startPos = startPos - 1
    end
    for i = startPos, 2, -2 do
      local timeInCall = M.profiler[key].timestamps[i] - M.profiler[key].timestamps[i - 1]
      timeSpentInEvent = timeSpentInEvent + timeInCall
      if maxTime < timeInCall then
        maxTime = timeInCall
      end
      if minTime > timeInCall then
        minTime = timeInCall
      end
    end
    print("-----------------------------")
    print("PROFILER PART: ", key)
    print("Number Of Calls: " .. M.profiler[key].numberOfEvents * 0.5)
    print("Time Spent In Function: " .. timeSpentInEvent .. " milliseconds")
    print("Minimum Spent In Function: " .. minTime .. " milliseconds")
    print("Maximum Spent In Function: " .. maxTime .. " milliseconds")
    print("-----------------------------")
  end
  M.profiler = nil
end

local function debugClean()
  if M.fpsText then
    M.fpsText:removeSelf()
    M.fpsText = nil
  end
  M.fpsTimeStamps = nil
  if M.luaMemText then
    M.luaMemText:removeSelf()
    M.luaMemText = nil
  end
  if M.texMemText then
    M.texMemText:removeSelf()
    M.texMemText = nil
  end
  flushProfiler()
end

M.clean = debugClean
composer.debugger = M
