@echo off
set "BOX=%LOCALAPPDATA%\Corona Labs\Corona Simulator\Sandbox"
for /d %%D in ("%BOX%\fr2-reborn-*") do (
  del /q "%%D\Documents\data.sqlite3*" "%%D\Documents\save_backup.json*" 2>nul
  echo Reset: %%D
)
pause
