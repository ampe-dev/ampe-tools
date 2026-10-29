@echo off
rem ==================================================================
rem AMPE - Directory Inventory
rem Version: 1.1
rem Publisher: AMPE
rem Source code: https://github.com/ampe-dev/ampe-tools/blob/main/server-inventory/ampe_inventory.cmd
rem Description: https://github.com/ampe-dev/ampe-tools/tree/main/server-inventory
rem Purpose: list files/folders, sizes and modification dates.
rem No network requests. Does not copy, alter or delete source files.
rem ==================================================================
setlocal EnableExtensions DisableDelayedExpansion
set "SOURCE=%~dp0"
set "OUTPUT=%~dp0ampe_inventory.txt"
set "DEST=%TEMP%\AMPE_INVENTORY_LIST_%RANDOM%_%RANDOM%"

echo AMPE - Directory Inventory v1.1
echo Source: "%SOURCE%"
echo Report: "%OUTPUT%"
echo.
echo Lists names, sizes and modification dates in this folder and subfolders.
echo No source files are copied or modified; no data is sent to the Internet.
echo.
robocopy "%SOURCE%" "%DEST%" /L /E /XJ /SL /FP /BYTES /TS /NP /NJH /NJS /XF "%OUTPUT%" /UNILOG:"%OUTPUT%"
set "RESULT=%ERRORLEVEL%"
echo.
if %RESULT% GEQ 8 (
    echo Scan finished with errors; inventory may be incomplete.
) else (
    echo Scan completed.
)
echo Report: "%OUTPUT%"
echo.
pause
endlocal
