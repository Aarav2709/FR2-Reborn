-- True on the Windows build: a desktop UI (keyboard race HUD, mouse hover, denser
-- menus). The simulator keeps the phone UI unless FR2_PC_UI=1 is set (for testing).
local M = {}
M.isPC = (system.getInfo("platform") == "win32" and system.getInfo("environment") ~= "simulator")
  or os.getenv("FR2_PC_UI") == "1"
return M
