local DESIGN_HEIGHT = 400
if (system.getInfo("platform") == "win32" and system.getInfo("environment") ~= "simulator")
    or os.getenv("FR2_PC_UI") == "1" then
  DESIGN_HEIGHT = 460
end
local MIN_ASPECT = 16 / 9
local preferredFps = 60
if system and system.getPreference then
  local ok, savedFps = pcall(system.getPreference, "app", "preferredFps", "number")
  if ok and (savedFps == 30 or savedFps == 60) then
    preferredFps = savedFps
  end
end

local longSide = math.max(display.pixelWidth, display.pixelHeight)
local shortSide = math.min(display.pixelWidth, display.pixelHeight)
local aspect = longSide / shortSide

local landscapeWidth, landscapeHeight
if aspect >= MIN_ASPECT then
  landscapeHeight = DESIGN_HEIGHT
  landscapeWidth = DESIGN_HEIGHT * aspect
else
  landscapeWidth = DESIGN_HEIGHT * MIN_ASPECT
  landscapeHeight = landscapeWidth / aspect
end

application = {
  content = {
    width = math.floor(landscapeHeight + 0.5),
    height = math.floor(landscapeWidth + 0.5),
    scale = "letterbox",
    xAlign = "center",
    yAlign = "center",
    fps = preferredFps,
  }
}
