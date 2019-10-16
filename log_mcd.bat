@echo off

cd D:\log_archive >NUL 2>&1

for /f "tokens=1* delims=" %%a in ('date /T') do set datestr=%%a >NUL 2>&1
mkdir %datestr% >NUL 2>&1

ROBOCOPY D:\log D:\log_archive\%datestr% /mov /minage:7 >NUL 2>&1


COMPACT /C /S:"D:\log_archive\%datestr%" >NUL 2>&1



forfiles -p "D:\log_archive" -d -10 -c "cmd /c IF @isdir == TRUE rd /S /Q @path" >NUL 2>&1
