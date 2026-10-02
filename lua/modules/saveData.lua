-- Keeps the player's save safe across game updates.
--
-- The save is data.sqlite3 in the app's Documents folder, which app updates leave in
-- place. This module adds three things on top:
--   * a save version, with upgrade steps for older saves (MIGRATIONS below), so an
--     update that changes what is saved converts old saves instead of breaking them;
--   * a backup of every saved table (save_backup.json, next to the save), written at
--     launch and whenever the app is closed or sent to the background;
--   * a check at launch: a save that can't be read is set aside (data.sqlite3.damaged)
--     and an empty save is filled back from the backup.
local sqlite3 = require("sqlite3")
local json = require("json")
local M = {}

-- Raise this (and add the step to MIGRATIONS) whenever an update changes the save.
M.VERSION = 1

local DB_NAME = "data.sqlite3"
local BACKUP_NAME = "save_backup.json"
-- Every table of the save (see setupTables in database.lua).
local TABLES = {
  "user_settings", "playerIdToken", "user_avatar", "receipts", "iap_confirm", "settings", "deviceSync",
  "marketItemId", "facebook", "adTime", "marketNotification", "push_enabled", "onboarding",
  "onboardingIntro", "economy", "ownedItems", "powerupSkins", "keyValue"
}
local KNOWN_TABLES = {}
for _, name in ipairs(TABLES) do
  KNOWN_TABLES[name] = true
end

-- Steps that bring an older save up to date, keyed by the version they lead to. Each
-- gets the open database. Add one whenever an update changes what is saved; never
-- remove one (a player may skip several updates).
local MIGRATIONS = {
  -- [2] = function(db) db:exec("ALTER TABLE economy ADD COLUMN trophies INTEGER;") end,
}

local function dbPath()
  return system.pathForFile(DB_NAME, system.DocumentsDirectory)
end

local function backupPath()
  return system.pathForFile(BACKUP_NAME, system.DocumentsDirectory)
end

local function fileExists(path)
  local file = path and io.open(path, "rb")
  if file then
    file:close()
    return true
  end
  return false
end

-- Before the tables are set up: a save that can't be read is moved aside, so the game
-- still starts and the backup can fill the new save.
function M.checkSave()
  local path = dbPath()
  if not fileExists(path) then
    return
  end
  local ok, healthy = pcall(function()
    local db = sqlite3.open(path)
    if not db then
      return false
    end
    local result
    for row in db:nrows("PRAGMA integrity_check;") do
      result = row.integrity_check
      break
    end
    db:close()
    return result == "ok"
  end)
  if not (ok and healthy) then
    local damaged = system.pathForFile(DB_NAME .. ".damaged", system.DocumentsDirectory)
    os.remove(damaged)
    os.rename(path, damaged)
  end
end

local function hasPlayer(db)
  local count = 0
  pcall(function()
    for row in db:nrows("SELECT COUNT(*) AS n FROM user_settings;") do
      count = tonumber(row.n) or 0
    end
  end)
  return count > 0
end

-- After the tables are set up: an empty save (no player yet) is filled from the backup.
-- Returns true when it restored one.
function M.restoreIfEmpty()
  local file = io.open(backupPath(), "rb")
  if not file then
    return false
  end
  local text = file:read("*a")
  file:close()
  local ok, data = pcall(json.decode, text)
  if not ok or type(data) ~= "table" or type(data.tables) ~= "table" then
    return false
  end
  local restored = false
  pcall(function()
    local db = sqlite3.open(dbPath())
    if hasPlayer(db) then
      db:close()
      return
    end
    db:exec("BEGIN;")
    for name, rows in pairs(data.tables) do
      if KNOWN_TABLES[name] and type(rows) == "table" then
        for _, row in ipairs(rows) do
          local columns, marks, values = {}, {}, {}
          for column, value in pairs(row) do
            if type(column) == "string" and column:match("^[%w_]+$") then
              columns[#columns + 1] = column
              marks[#marks + 1] = "?"
              values[#values + 1] = value
            end
          end
          if #columns > 0 then
            -- (A column a later update dropped makes the statement fail: that row is skipped.)
            local statement = db:prepare("INSERT OR REPLACE INTO " .. name .. " (" .. table.concat(columns, ", ") ..
              ") VALUES (" .. table.concat(marks, ", ") .. ");")
            if statement then
              statement:bind_values(unpack(values))
              statement:step()
              statement:finalize()
              restored = true
            end
          end
        end
      end
    end
    db:exec("COMMIT;")
    db:close()
  end)
  return restored
end

-- Runs the upgrade steps an older save still needs and stamps the current version.
function M.migrate()
  pcall(function()
    local db = sqlite3.open(dbPath())
    local version = 0
    for row in db:nrows("SELECT value FROM keyValue WHERE key = 'saveVersion';") do
      version = tonumber(row.value) or 0
    end
    if version < M.VERSION then
      for step = version + 1, M.VERSION do
        if MIGRATIONS[step] then
          MIGRATIONS[step](db)
        end
      end
      db:exec("INSERT OR REPLACE INTO keyValue (key, value) VALUES ('saveVersion', '" .. M.VERSION .. "');")
    end
    db:close()
  end)
end

-- Writes every table to the backup file (through a temporary file, so a crash while
-- writing never leaves a half backup). Skipped while there is no player yet.
function M.backup()
  pcall(function()
    local db = sqlite3.open(dbPath())
    if not db then
      return
    end
    local data = { version = M.VERSION, saved = os.time(), tables = {} }
    for _, name in ipairs(TABLES) do
      local rows = {}
      local ok = pcall(function()
        for row in db:nrows("SELECT * FROM " .. name .. ";") do
          rows[#rows + 1] = row
        end
      end)
      if ok then
        data.tables[name] = rows
      end
    end
    db:close()
    if not data.tables.user_settings or #data.tables.user_settings == 0 then
      return
    end
    local text = json.encode(data)
    if not text then
      return
    end
    local path = backupPath()
    local temporary = path .. ".tmp"
    local file = io.open(temporary, "wb")
    if not file then
      return
    end
    file:write(text)
    file:close()
    os.remove(path)
    os.rename(temporary, path)
  end)
end

-- A deliberate reset (log out, dev reset) also drops the backup, or it would come back.
function M.deleteBackup()
  os.remove(backupPath())
end

return M
