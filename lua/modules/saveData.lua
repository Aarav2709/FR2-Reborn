local sqlite3 = require("sqlite3")
local json = require("json")
local M = {}

M.VERSION = 1

local DB_NAME = "data.sqlite3"
local BACKUP_NAME = "save_backup.json"
local PREVIOUS_BACKUP_NAME = BACKUP_NAME .. ".previous"
local TABLES = {
  "user_settings", "playerIdToken", "user_avatar", "receipts", "iap_confirm", "settings", "deviceSync",
  "marketItemId", "facebook", "adTime", "marketNotification", "push_enabled", "onboarding",
  "onboardingIntro", "economy", "ownedItems", "powerupSkins", "keyValue"
}
local KNOWN_TABLES = {}
for _, name in ipairs(TABLES) do
  KNOWN_TABLES[name] = true
end

local MIGRATIONS = {}

local function dbPath()
  return system.pathForFile(DB_NAME, system.DocumentsDirectory)
end

local function backupPath()
  return system.pathForFile(BACKUP_NAME, system.DocumentsDirectory)
end

local function previousBackupPath()
  return system.pathForFile(PREVIOUS_BACKUP_NAME, system.DocumentsDirectory)
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

local function readBackupAt(path)
  local file = path and io.open(path, "rb")
  if not file then
    return nil
  end
  local text = file:read("*a")
  file:close()
  local decoded, data = pcall(json.decode, text)
  if not decoded or type(data) ~= "table" or type(data.tables) ~= "table" then
    return nil
  end
  return data
end

local function isUsableBackup(data)
  local version = data and tonumber(data.version) or 0
  if not data or version > M.VERSION or type(data.tables.user_settings) ~= "table"
      or #data.tables.user_settings == 0 or type(data.tables.playerIdToken) ~= "table"
      or #data.tables.playerIdToken == 0 then
    return false
  end
  for _, name in ipairs(TABLES) do
    if type(data.tables[name]) ~= "table" then
      return false
    end
  end
  return true
end

local function readBackup()
  local primary = readBackupAt(backupPath())
  local previous = readBackupAt(previousBackupPath())
  if isUsableBackup(primary) then
    return primary
  end
  if isUsableBackup(previous) then
    return previous
  end
  return nil
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
  if readable and result ~= nil and not readBackup() then
    return
  end
  local damagedPath = system.pathForFile(DB_NAME .. ".damaged-" .. os.time(), system.DocumentsDirectory)
  local moved = os.rename(path, damagedPath)
  if not moved then
  end
end

local function rowCount(db, tableName)
  local count = 0
  pcall(function()
    for row in db:nrows("SELECT COUNT(*) AS n FROM " .. tableName .. ";") do
      count = tonumber(row.n) or 0
    end
  end)
  return count > 0
end

local function hasPlayer(db)
  return rowCount(db, "user_settings")
end

local function hasCompletePlayer(db)
  return hasPlayer(db) and rowCount(db, "playerIdToken")
end
function M.restoreIfEmpty()
  local data = readBackup()
  if not data or type(data.tables.user_settings) ~= "table" or #data.tables.user_settings == 0 then
    return false
  end
  local backupVersion = tonumber(data.version) or 0
  if backupVersion > M.VERSION then
    return false
  end
  local db = sqlite3.open(dbPath())
  if not db then
    return false
  end
  if hasCompletePlayer(db) then
    closeQuietly(db)
    return false
  end
  local restoredPlayer = false
  local ok = pcall(function()
    if db:exec("BEGIN;") ~= sqlite3.OK then
      error("could not begin save restore")
    end
    for name, rows in pairs(data.tables) do
      if KNOWN_TABLES[name] and type(rows) == "table" then
        local allowedColumns = {}
        for columnInfo in db:nrows("PRAGMA table_info(" .. name .. ");") do
          allowedColumns[columnInfo.name] = true
        end
        for _, row in ipairs(rows) do
          local columns, marks, values = {}, {}, {}
          for column, value in pairs(row) do
            local kind = type(value)
            if type(column) == "string" and allowedColumns[column] and column:match("^[%w_]+$")
                and (kind == "string" or kind == "number" or kind == "boolean") then
              columns[#columns + 1] = column
              marks[#marks + 1] = "?"
              values[#values + 1] = kind == "boolean" and (value and 1 or 0) or value
            end
          end
          if #columns > 0 then
            local statement = db:prepare("INSERT OR REPLACE INTO " .. name .. " (" .. table.concat(columns, ", ") ..
              ") VALUES (" .. table.concat(marks, ", ") .. ");")
            if not statement then
              error("could not prepare restored row for " .. name)
            end
            local stepOk, stepResult = pcall(function()
              statement:bind_values(unpack(values))
              return statement:step()
            end)
            statement:finalize()
            if not stepOk or stepResult ~= sqlite3.DONE then
              error("could not restore row for " .. name)
            end
            restoredPlayer = restoredPlayer or name == "user_settings"
          end
        end
      end
    end
    if not restoredPlayer then
      error("player record could not be restored")
    end
    if db:exec("COMMIT;") ~= sqlite3.OK then
      error("commit failed")
    end
  end)
  if not ok then
    pcall(function()
      db:exec("ROLLBACK;")
    end)
    restoredPlayer = false
  end
  closeQuietly(db)
  return restoredPlayer
end

local function setSaveVersion(db, version)
  return db:exec("INSERT OR REPLACE INTO keyValue (key, value) VALUES ('saveVersion', '" .. version .. "');")
end

function M.migrate()
  local db = sqlite3.open(dbPath())
  if not db then
    return false
  end
  local ok, err = pcall(function()
    if not hasPlayer(db) then
      if setSaveVersion(db, M.VERSION) ~= sqlite3.OK then
        error("could not initialize save version: " .. tostring(db:errmsg()))
      end
      return
    end
    local version = 0
    for row in db:nrows("SELECT value FROM keyValue WHERE key = 'saveVersion';") do
      version = tonumber(row.value) or 0
    end
    for step = version + 1, M.VERSION do
      local stepOk, stepError = pcall(function()
        if db:exec("BEGIN;") ~= sqlite3.OK then
          error("could not begin save upgrade: " .. tostring(db:errmsg()))
        end
        if MIGRATIONS[step] then
          MIGRATIONS[step](db, function(sql)
            if db:exec(sql) ~= sqlite3.OK then
              error("save upgrade " .. step .. " failed: " .. tostring(db:errmsg()))
            end
          end)
        end
        if setSaveVersion(db, step) ~= sqlite3.OK then
          error("could not record save version: " .. tostring(db:errmsg()))
        end
        if db:exec("COMMIT;") ~= sqlite3.OK then
          error("commit failed")
        end
      end)
      if not stepOk then
        pcall(function()
          db:exec("ROLLBACK;")
        end)
        error(stepError)
      end
    end
  end)
  closeQuietly(db)
  if not ok then
  end
  return ok
end

-- writes every table to the backup file (through a temporary file, so a crash while
-- writing never leaves a half backup). skipped while there is no player yet.
function M.backup()
  local ok, err = pcall(function()
    local db = sqlite3.open(dbPath())
    if not db then
      error("could not open database")
    end
    local data = { saved = os.time(), tables = {} }
    local complete = true
    for _, name in ipairs(TABLES) do
      local rows = {}
      local rowsOk = pcall(function()
        for row in db:nrows("SELECT * FROM " .. name .. ";") do
          rows[#rows + 1] = row
        end
      end)
      if not rowsOk then
        complete = false
        break
      end
      data.tables[name] = rows
    end
    closeQuietly(db)
    if not complete then
      error("could not read every save table")
    end
    if #data.tables.user_settings == 0 or #data.tables.playerIdToken == 0 then
      error("no complete player record to back up")
    end
    local version = 0
    for _, row in ipairs(data.tables.keyValue) do
      if row.key == "saveVersion" then
        version = tonumber(row.value) or 0
        break
      end
    end
    data.version = version
    local text = json.encode(data)
    if not text then
      error("could not encode save data")
    end
    local path = backupPath()
    local temporary = path .. ".tmp"
    local file = io.open(temporary, "wb")
    if not file then
      error("could not create temporary backup")
    end
    local wrote = file:write(text)
    local flushed = file:flush()
    local closed = file:close()
    if not wrote or not flushed or not closed then
      os.remove(temporary)
      error("could not write complete temporary backup")
    end

    if isUsableBackup(readBackupAt(path)) then
      local previous = previousBackupPath()
      os.remove(previous)
      local moved = os.rename(path, previous)
      if not moved then
        os.remove(temporary)
        error("could not preserve previous backup")
      end
    elseif fileExists(path) then
      os.remove(path)
    end
    local promoted = os.rename(temporary, path)
    if not promoted then
      if not fileExists(path) then
        os.rename(previousBackupPath(), path)
      end
      os.remove(temporary)
      error("could not promote new backup")
    end
  end)
  if not ok then
  end
  return ok
end

function M.deleteBackup()
  os.remove(backupPath())
  os.remove(previousBackupPath())
  os.remove(backupPath() .. ".tmp")
end

return M
