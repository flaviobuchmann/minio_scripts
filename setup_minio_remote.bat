@echo off
cd /d "%~dp0rclone"

:: Access Key eingeben
set /p ACCESS_KEY=Access Key (Benutzername): 

:: Passwort-Eingabe mit * über PowerShell
for /f "delims=" %%P in ('powershell -Command "$pw = Read-Host 'Secret Key (Passwort)' -AsSecureString; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw))"') do set SECRET_KEY=%%P

:: Vorherige Remote löschen (optional)
rclone.exe config delete minio >nul 2>&1

:: Neue Remote mit den eingegebenen Werten erstellen
rclone.exe config create minio s3 ^
  provider Minio ^
  env_auth false ^
  access_key_id %ACCESS_KEY% ^
  secret_access_key %SECRET_KEY% ^
  endpoint http://52.205.49.166:9000 ^
  acl private ^
  region "" ^
  location_constraint "" ^
  server_side_encryption "" ^
  sse_kms_key_id ""

echo.
echo ✅ Rclone-Remote "minio" wurde erfolgreich eingerichtet.
timeout /t 2 >nul
exit
