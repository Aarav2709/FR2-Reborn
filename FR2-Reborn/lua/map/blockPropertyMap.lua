local M = {}
local composer = require("composer")

function M.init(theme)
  local animatedBlockSheetFile = require("lua.map.assets." .. theme .. ".animatedTiles")
  local blockmap = {}
  blockmap.blocks = {
    {
      animation = {
        sequenceData = {
          name = "idleAnimation",
          frames = {
            animatedBlockSheetFile:getFrameIndex("powerupBox0"),
            animatedBlockSheetFile:getFrameIndex("powerupBox1"),
            animatedBlockSheetFile:getFrameIndex("powerupBox2"),
            animatedBlockSheetFile:getFrameIndex("powerupBox3"),
            animatedBlockSheetFile:getFrameIndex("powerupBox4"),
            animatedBlockSheetFile:getFrameIndex("powerupBox0")
          },
          time = 300,
          loopCount = 1,
          loopDirection = "forward"
        }
      },
      properties = {powerUp = true, idleAnimationInterval = 1000},
      behavior = {
        "lua.map.behaviors.idleAnimation"
      }
    },
    {
      behavior = {
        "lua.map.behaviors.mushroomBehavior"
      }
    },
    {
      properties = {boost = true},
      behavior = {
        "lua.map.behaviors.speedBehavior"
      }
    }
  }
  blockmap.frames = {
    normal001 = 1,
    normal068 = 2,
    normal069 = 2,
    normal070 = 2,
    normal089 = 3,
    normal090 = 3
  }
  local specialThemeDefinitions = require("lua.map.assets." .. theme .. ".specialPropertyData").init(theme)
  
  local function addDefinitions(definitions)
    local startLength = #blockmap.blocks
    local framesToAdd = definitions.frames
    local blocksToAdd = definitions.blocks
    for key, value in pairs(blocksToAdd) do
      blockmap.blocks[startLength + key] = value
    end
    for key, value in pairs(framesToAdd) do
      blockmap.frames[key] = value + startLength
    end
    composer.debugger.debugTable("main", "blockmap after adding special", blockmap)
  end
  
  addDefinitions(specialThemeDefinitions)
  
  function blockmap.getFrameIndex(blockId)
    return blockmap.frames[blockId]
  end
  
  function blockmap.getBlock(blockId)
    return blockmap.blocks[blockmap.getFrameIndex(blockId)]
  end
  
  function blockmap.canTileHaveDecal(blockId)
    if blockId == "001" then
      return false
    elseif blockId == "009" then
      return false
    elseif blockId == "011" then
      return false
    elseif blockId == "013" then
      return false
    elseif blockId == "061" then
      return false
    elseif blockId == "062" then
      return false
    elseif blockId == "063" then
      return false
    elseif blockId == "064" then
      return false
    elseif blockId == "065" then
      return false
    elseif blockId == "066" then
      return false
    elseif blockId == "067" then
      return false
    elseif blockId == "068" then
      return false
    elseif blockId == "069" then
      return false
    elseif blockId == "070" then
      return false
    elseif blockId == "088" then
      return false
    elseif blockId == "089" then
      return false
    elseif blockId == "090" then
      return false
    elseif blockId == "096" then
      return false
    elseif blockId == "097" then
      return false
    elseif blockId == "098" then
      return false
    elseif blockId == "099" then
      return false
    elseif blockId == "100" then
      return false
    elseif blockId == "101" then
      return false
    elseif blockId == "102" then
      return false
    elseif blockId == "103" then
      return false
    elseif blockId == "104" then
      return false
    elseif blockId == "105" then
      return false
    elseif blockId == "106" then
      return false
    elseif blockId == "107" then
      return false
    elseif blockId == "108" then
      return false
    elseif blockId == "109" then
      return false
    elseif blockId == "110" then
      return false
    elseif blockId == "111" then
      return false
    elseif blockId == "112" then
      return false
    else
      return true
    end
  end
  
  return blockmap
end

return M
