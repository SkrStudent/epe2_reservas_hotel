@echo off
set "BIN=C:\xampp\mysql\bin"
set "OUT=%~dp0..\db\full_dump.sql"
"%BIN%\mysqldump.exe" -u dbipchile -p reservas_hotel > "%OUT%"
echo Dump actualizado en: %OUT%
pause
