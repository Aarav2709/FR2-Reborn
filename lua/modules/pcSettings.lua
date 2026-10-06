-- options that only exist on the pc build (settings shows them there)
local M = {}

local SIZES = { { 1280, 720 }, { 1600, 900 }, { 1920, 1080 } }
local VOLUMES = { 1, 0.75, 0.5, 0.25 }
local DEFAULT_KEYS = { jump = "space", power = "x" }
local KEY_NAMES = {
  space = "Space", up = "Up", down = "Down", left = "Left", right = "Right", enter = "Enter",
  leftShift = "Left Shift", rightShift = "Right Shift", leftControl = "Left Ctrl", rightControl = "Right Ctrl",
  tab = "Tab", backspace = "Backspace"
}

local function getPreference(name, kind)
  local ok, value = pcall(system.getPreference, "app", name, kind)
  if ok then
    return value
  end
end

local function setPreference(name, value)
  pcall(system.setPreferences, "app", { [name] = value })
end

function M.getKey(action)
  local key = getPreference("key_" .. action, "string")
  if key == nil or key == "" then
    key = DEFAULT_KEYS[action]
  end
  return key
end

function M.setKey(action, key)
  setPreference("key_" .. action, key)
end

function M.keyLabel(action)
  local key = M.getKey(action)
  return KEY_NAMES[key] or (#key == 1 and key:upper()) or key
end

function M.matchesKey(action, keyName)
  local key = M.getKey(action)
  if key == "space" then
    return keyName == "space" or keyName == "spacebar"
  end
  return keyName == key
end

function M.isFullscreen()
  local ok, mode = pcall(native.getProperty, "windowMode")
  return ok and mode == "fullscreen"
end

function M.toggleFullscreen()
  pcall(native.setProperty, "windowMode", M.isFullscreen() and "normal" or "fullscreen")
  setPreference("fullscreen", M.isFullscreen() and 0 or 1)
end

function M.sizeIndex()
  local saved = tonumber(getPreference("windowSizeIndex", "number")) or 1
  return math.max(1, math.min(saved, #SIZES))
end

function M.sizeLabel()
  local size = SIZES[M.sizeIndex()]
  return size[1] .. "x" .. size[2]
end

local function applySize()
  local size = SIZES[M.sizeIndex()]
  pcall(native.setProperty, "windowSize", { width = size[1], height = size[2] })
end

function M.cycleSize()
  setPreference("windowSizeIndex", M.sizeIndex() % #SIZES + 1)
  if not M.isFullscreen() then
    applySize()
  end
end

function M.volume()
  local saved = tonumber(getPreference("volume", "number"))
  return saved or 1
end

function M.volumePercent()
  return math.floor(M.volume() * 100 + 0.5)
end

function M.applyVolume()
  pcall(audio.setVolume, M.volume())
end

function M.cycleVolume()
  local current = M.volume()
  local nextVolume = VOLUMES[1]
  for i, level in ipairs(VOLUMES) do
    if math.abs(level - current) < 0.01 then
      nextVolume = VOLUMES[i % #VOLUMES + 1]
    end
  end
  setPreference("volume", nextVolume)
  M.applyVolume()
end

function M.apply()
  M.applyVolume()
  if getPreference("fullscreen", "number") == 0 then
    pcall(native.setProperty, "windowMode", "normal")
    applySize()
  end
end

return M
