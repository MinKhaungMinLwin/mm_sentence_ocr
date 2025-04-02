@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Set working directory to script's directory
cd /d "%~dp0"

:: Check and create 'gt' folder if not exists
if not exist "uncleaned\gt" mkdir "uncleaned\gt"

:: Rename files safely
for %%f in ("uncleaned\pic\*.png") do (
    set "name=%%~nxf"
    set "newname=!name: =_!"
    set "newname=!newname:(=_!"
    set "newname=!newname:)=_!"
    set "newname=!newname:၊=_!"
    set "newname=!newname:“=_!"
    set "newname=!newname:”=_!"
    set "newname=!newname:‘=_!"
    set "newname=!newname:’=_!"
    ren "uncleaned\pic\%%~nxf" "!newname!"
)

:: Run Tesseract OCR correctly after renaming
for %%f in ("uncleaned\pic\*.png") do (
    echo Processing: %%~nxf
    tesseract "uncleaned\pic\%%~nxf" "uncleaned\gt\%%~nf" --psm 6 -l mya makebox
)

echo Done!
pause
