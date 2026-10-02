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
local MIGRATIONS = {}

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

local function closeQuietly(db)
  if db then
    pcall(function()
      db:close()
    end)
  end
end

function M.checkSave()
  local path = dbPath()
  if not fileExists(path) then
    return
  end
  local db
  local readable, result = pcall(function()
    db = sqlite3.open(path)
    if not db then
      error("cannot open")
    end
    local check
    for row in db:nrows("PRAGMA integrity_check;") do
      check = row.integrity_check
      break
    end
    return check
  end)
  closeQuietly(db)
  db = nil
  local healthy = readable and result == "ok"
  if healthy then
    return
  end
  if readable and result ~= nil and not fileExists(backupPath()) then
    return
  end
  os.rename(path, system.pathForFile(DB_NAME .. ".damaged-" .. os.time(), system.DocumentsDirectory))
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
function M.restoreIfEmpty()
  local file = io.open(backupPath(), "rb")
  if not file then
    return false
  end
  local text = file:read("*a")
  file:close()
  local decoded, data = pcall(json.decode, text)
  if not decoded or type(data) ~= "table" or type(data.tables) ~= "table" then
    return false
  end
  local db = sqlite3.open(dbPath())
  if not db then
    return false
  end
  if hasPlayer(db) then
    closeQuietly(db)
    return false
  end
  local restored = false
  local ok = pcall(function()
    db:exec("BEGIN;")
    for name, rows in pairs(data.tables) do
      if KNOWN_TABLES[name] and type(rows) == "table" then
        for _, row in ipairs(rows) do
          local columns, marks, values = {}, {}, {}
          for column, value in pairs(row) do
            local kind = type(value)
            if type(column) == "string" and column:match("^[%w_]+$") and (kind == "string" or kind == "number" or kind == "boolean") then
              columns[#columns + 1] = column
              marks[#marks + 1] = "?"
              values[#values + 1] = kind == "boolean" and (value and 1 or 0) or value
            end
          end
          if #columns > 0 then
            -- (A column a later update dropped makes the statement fail: that row is skipped.)
            local statement = db:prepare("INSERT OR REPLACE INTO " .. name .. " (" .. table.concat(columns, ", ") ..
              ") VALUES (" .. table.concat(marks, ", ") .. ");")
            if statement then
              statement:bind_values(unpack(values))
              if statement:step() == sqlite3.DONE then
                restored = true
              end
              statement:finalize()
            end
          end
        end
      end
    end
    if db:exec("COMMIT;") ~= sqlite3.OK then
      error("commit failed")
    end
  end)
  if not ok then
    pcall(function()
      db:exec("ROLLBACK;")
    end)
    restored = false
  end
  closeQuietly(db)
  return restored
end

local function setSaveVersion(db, version)
  return db:exec("INSERT OR REPLACE INTO keyValue (key, value) VALUES ('saveVersion', '" .. version .. "');")
end

function M.migrate()
  local db = sqlite3.open(dbPath())
  if not db then
    return
  end
  pcall(function()
    if not hasPlayer(db) then
      setSaveVersion(db, M.VERSION)
      return
    end
    local version = 0
    for row in db:nrows("SELECT value FROM keyValue WHERE key = 'saveVersion';") do
      version = tonumber(row.value) or 0
    end
    for step = version + 1, M.VERSION do
      local stepOk = pcall(function()
        db:exec("BEGIN;")
        if MIGRATIONS[step] then
          MIGRATIONS[step](db, function(sql)
            if db:exec(sql) ~= sqlite3.OK then
              error("save upgrade " .. step .. " failed: " .. tostring(db:errmsg()))
            end
          end)
        end
        setSaveVersion(db, step)
        if db:exec("COMMIT;") ~= sqlite3.OK then
          error("commit failed")
        end
      end)
      if not stepOk then
        pcall(function()
          db:exec("ROLLBACK;")
        end)
        break
      end
    end
  end)
  closeQuietly(db)
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
