@echo off
set "BIN=C:\xampp\mysql\bin"
set "IN=%~dp0..\db\full_dump.sql"
"%BIN%\mysql.exe" -u dbipchile -p -e "CREATE DATABASE IF NOT EXISTS reservas_hotel CHARACTER SET utf8mb4;"
"%BIN%\mysql.exe" -u dbipchile -p reservas_hotel < "%IN%"
echo BD restaurada desde: %IN%
pause
