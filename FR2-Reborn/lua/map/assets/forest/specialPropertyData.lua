local M = {}

function M.init(theme)
  local animatedBlockSheetFile = require("lua.map.assets." .. theme .. ".animatedTiles")
  local blockmap = {}
  blockmap.blocks = {
    {
      behavior = {
        "lua.map.behaviors.thornBehavior"
      },
      noBaseImage = true
    }
  }
  blockmap.frames = {special001 = 1, special002 = 1}
  return blockmap
end

return M
