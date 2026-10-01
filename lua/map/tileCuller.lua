-- Column-based culler for animated map objects (hazards, bounce pads, cannons...).
-- Objects start hidden and are shown only while their column is near the camera,
-- which keeps sprite work off-screen to a minimum on long maps.
local M = {}

local COLUMN_WIDTH = 80
local COLUMNS_BEHIND = 4
local COLUMNS_AHEAD = 6

local columns = {}
local firstVisible, lastVisible

local function columnOf(x)
  return math.floor((x + COLUMN_WIDTH) / COLUMN_WIDTH)
end

local function setColumnVisible(column, visible)
  local objects = columns[column]
  if not objects then
    return
  end
  for i = #objects, 1, -1 do
    local object = objects[i]
    if object.removeSelf then
      object.isVisible = visible
    else
      -- The object was removed elsewhere; forget it.
      table.remove(objects, i)
    end
  end
end

local function isColumnVisible(column)
  return firstVisible ~= nil and column >= firstVisible and column <= lastVisible
end

function M.reset()
  columns = {}
  firstVisible = nil
  lastVisible = nil
end

function M.addAnimatedTile(x, object)
  if not object then
    return
  end
  local column = columnOf(x)
  local list = columns[column]
  if not list then
    list = {}
    columns[column] = list
  end
  list[#list + 1] = object
  object.isVisible = isColumnVisible(column)
end

-- leftX: world x of the left screen edge; viewWidth: visible world width.
function M.update(leftX, viewWidth)
  local newFirst = columnOf(leftX) - COLUMNS_BEHIND
  local newLast = columnOf(leftX + viewWidth) + COLUMNS_AHEAD
  if newFirst == firstVisible and newLast == lastVisible then
    return
  end
  if firstVisible then
    for column = firstVisible, lastVisible do
      if column < newFirst or column > newLast then
        setColumnVisible(column, false)
      end
    end
  end
  for column = newFirst, newLast do
    if not isColumnVisible(column) then
      setColumnVisible(column, true)
    end
  end
  firstVisible = newFirst
  lastVisible = newLast
end

return M
