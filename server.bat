@echo off
set PYTHON=C:\Users\tigel\AppData\Local\Microsoft\WindowsApps\python.exe
set DIR=%~dp0

cd /d "%DIR%"

netstat -ano | findstr ":8080" > nul 2>&1
if %errorlevel% == 0 (
  start "" "http://localhost:8080/demo.html"
  exit /b
)

start /min "" "%PYTHON%" -m http.server 8080
ping -n 3 127.0.0.1 > nul
start "" "http://localhost:8080/demo.html"
