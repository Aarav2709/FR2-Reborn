---@meta

---@class sqlite3_db
local sqlite3_db = {}

---@class sqlite3
sqlite3 = {}

---@param path string
---@return sqlite3_db
function sqlite3.open(path) end

function sqlite3_db:exec(sql) end
function sqlite3_db:nrows(sql) end
function sqlite3_db:urows(sql) end
function sqlite3_db:close() end
