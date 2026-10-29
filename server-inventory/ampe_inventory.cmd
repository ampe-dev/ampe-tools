@echo off
rem ==================================================================
rem AMPE - Directory Inventory
rem Version: 1.2
rem Publisher: AMPE
rem Source code: https://github.com/ampe-dev/ampe-tools/blob/main/server-inventory/ampe_inventory.cmd
rem Description: https://github.com/ampe-dev/ampe-tools/tree/main/server-inventory
rem Purpose: list files/folders, sizes and modification dates.
rem No network requests. Does not copy, alter or delete source files.
rem ==================================================================
setlocal EnableExtensions DisableDelayedExpansion
rem The trailing dot avoids a quoted folder path ending with a backslash.
set "SOURCE=%~dp0."
set "OUTPUT=%~dp0ampe_inventory.txt"
set "DEST=%TEMP%\AMPE_INVENTORY_LIST_%RANDOM%_%RANDOM%"

echo AMPE - Directory Inventory v1.2
echo Source: "%SOURCE%"
echo Report: "%OUTPUT%"
echo.
echo Scanning this folder and its subfolders...
echo No source files will be copied, changed or deleted.
echo.
robocopy "%SOURCE%" "%DEST%" /L /E /XJ /SL /R:0 /W:0 /FP /BYTES /TS /NP /NJH /NJS /XF "%OUTPUT%" /UNILOG:"%OUTPUT%"
set "RESULT=%ERRORLEVEL%"
echo.
if not exist "%OUTPUT%" (
    echo ERROR: Could not create ampe_inventory.txt.
    echo Check write permissions in the folder shown above.
) else (
    if %RESULT% GEQ 8 (
        echo Scan finished with errors. The report may be incomplete.
    ) else (
        echo Scan completed. Report created successfully.
    )
)
echo Report: "%OUTPUT%"
echo.
pause
endlocal
