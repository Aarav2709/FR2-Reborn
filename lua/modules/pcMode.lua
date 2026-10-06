-- true on the windows build
local M = {}
M.isPC = (system.getInfo("platform") == "win32" and system.getInfo("environment") ~= "simulator")
  or os.getenv("FR2_PC_UI") == "1"
return M
