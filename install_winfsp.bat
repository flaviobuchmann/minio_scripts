@echo off
cd /d "%~dp0"

:: WinFsp-Installer starten und CMD-Fenster sofort schliessen
start "" "winfsp\winfsp-2.0.23075.msi"
exit
