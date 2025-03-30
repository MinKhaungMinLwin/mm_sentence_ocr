@echo off
chcp 65001 >nul
for %%f in (uncleaned\pic\*.png) do (
    echo Processing: %%~nxf
    tesseract "%%f" "uncleaned\gt\%%~nf" --psm 6 -l mya makebox
)
pause
