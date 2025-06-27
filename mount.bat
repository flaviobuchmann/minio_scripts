@echo off
cd /d "%~dp0rclone"

SET REMOTE=minio
SET BUCKET=miniobucket
SET DRIVE=M:
SET CACHE_DIR=%TEMP%\rclone-cache

rclone.exe mount %REMOTE%:%BUCKET% %DRIVE% ^
  --vfs-cache-mode full ^
  --vfs-write-back 5s ^
  --vfs-cache-poll-interval 5s ^
  --dir-cache-time 5s ^
  --poll-interval 5s ^
  --cache-dir "%CACHE_DIR%" ^
  --network-mode ^
  --allow-non-empty ^
  --allow-other
