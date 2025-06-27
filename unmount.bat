@echo off
cd /d "%~dp0rclone"

echo 🔄 Versuche, Laufwerk zu trennen...

:: Rclone beenden (dadurch wird der Cache übertragen)
taskkill /f /im rclone.exe >nul 2>&1

:: Explorer neu starten, um Laufwerk korrekt zu trennen
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 >nul
start explorer.exe

echo ✅ Rclone unmounted und Explorer neu gestartet.
exit
