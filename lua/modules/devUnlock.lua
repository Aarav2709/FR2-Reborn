-- dev codes: a player shares their Dev ID, a dev signs a code for it with tools/devcode/devcode.js,
-- and the code unlocks things on that player's account only
local composer = require("composer")
local devCode = require("lua.modules.devCode")
local M = {}

local ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
local MAX_COINS = 9999999
local MAX_GEMS = 999999

-- a random ID made once per save, shown as XXXXX-XXXXX
function M.getDevId()
  local id = composer.database.getValue("devId")
  if not id or #devCode.normalize(id) ~= 10 then
    local info = composer.database.getPlayerInformation() or {}
    local seed = table.concat({ os.time(), system.getTimer(), math.random(), tostring({}), tostring(info.playerId) }, "|")
    local digest = crypto.digest(crypto.sha256, seed)
    local chars = {}
    for i = 1, 10 do
      local byte = tonumber(digest:sub(i * 2 - 1, i * 2), 16)
      local index = byte % 32 + 1
      chars[i] = ALPHABET:sub(index, index)
    end
    id = table.concat(chars)
    composer.database.setValue("devId", id)
  end
  id = devCode.normalize(id)
  return id:sub(1, 5) .. "-" .. id:sub(6, 10)
end

-- every shop item, the wins for every master skin, and plenty of coins and gems
local function maxAccount()
  local items = composer.database.getItems() or {}
  local keys, winsNeeded = composer.storeConfig.getAllOwnableItems()
  local added = 0
  for _, key in ipairs(keys) do
    if items[key] == nil then
      items[key] = {}
      added = added + 1
    end
  end
  for characterId, wins in pairs(winsNeeded) do
    items[characterId] = items[characterId] or {}
    items[characterId].w = math.max(tonumber(items[characterId].w) or 0, wins)
  end
  composer.database.setItems(items)
  if composer.database.getMoney() < MAX_COINS then
    composer.database.setMoney(MAX_COINS)
  end
  if composer.database.getGems() < MAX_GEMS then
    composer.database.setGems(MAX_GEMS)
  end
  require("lua.modules.saveData").backup()
  return "Account maxed: " .. added .. " new items, master skins unlocked, coins and gems topped up."
end

local ACTIONS = {
  [devCode.ACTION_MAX] = maxAccount
}

-- checks the code without freezing the game, then calls onDone(ok, message)
function M.redeem(codeText, onDone)
  local devId = M.getDevId()
  local worker = coroutine.create(function()
    return devCode.verify(devId, codeText)
  end)
  local function step()
    local ok, action, reason = coroutine.resume(worker)
    if not ok then
      Runtime:removeEventListener("enterFrame", step)
      print("dev code check failed: " .. tostring(action))
      onDone(false, "Could not check that code.")
    elseif coroutine.status(worker) == "dead" then
      Runtime:removeEventListener("enterFrame", step)
      if not action then
        onDone(false, reason)
      elseif not ACTIONS[action] then
        onDone(false, "This code needs a newer version of the game.")
      else
        local applied, result = pcall(ACTIONS[action])
        if not applied then
          print("dev code action failed: " .. tostring(result))
          onDone(false, "The code is valid, but applying it failed.")
        else
          onDone(true, result)
        end
      end
    end
  end
  Runtime:addEventListener("enterFrame", step)
end

return M
