-- Content scaling for every screen shape.
--
-- The UI is laid out for a landscape area 400 units tall. On phones the height is
-- fixed at 400 and the width follows the screen's aspect ratio (16:9 -> 711, 20:9 -> 889).
-- Squarer screens (tablets, 3:2 phones) keep a width of 711 and get extra height.
-- The computed size matches the screen exactly, so "letterbox" never shows bars and
-- display.contentWidth/contentHeight always cover the whole display.
local DESIGN_HEIGHT = 400
local MIN_ASPECT = 16 / 9

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
    -- Solar2D expects the portrait dimensions here, even for landscape apps.
    width = math.floor(landscapeHeight + 0.5),
    height = math.floor(landscapeWidth + 0.5),
    scale = "letterbox",
    xAlign = "center",
    yAlign = "center",
    -- Movement is time based (one-off kicks are impulses), so races play at the
    -- original's pace at 60 frames per second too, just smoother.
    fps = 60,
  }
}
