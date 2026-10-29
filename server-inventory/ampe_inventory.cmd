@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "SOURCE=%~dp0"
set "OUTPUT=%~dp0ampe_inventory.txt"
set "DEST=%TEMP%\AMPE_INVENTORY_LIST_%RANDOM%_%RANDOM%"

echo AMPE - Directory Inventory v1.0
echo Source: "%SOURCE%"
echo Report: "%OUTPUT%"
echo.
echo Lists names, sizes and modification dates inside this folder.
echo No files are copied or modified; no data is sent to the Internet.
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
