@echo off
REM Script de Limpieza Rapida para Windows PC
REM Creado por Claude - Task Master AI
REM Uso: Click derecho -> Ejecutar como Administrador

echo ========================================
echo   Limpieza Rapida de PC - Windows
echo ========================================
echo.

echo Limpiando archivos temporales...
del /q /f /s %TEMP%\* 2>nul
del /q /f /s C:\Windows\Temp\* 2>nul
echo   [OK] Archivos temporales eliminados

echo.
echo Vaciando Papelera de Reciclaje...
rd /s /q %systemdrive%\$Recycle.bin 2>nul
echo   [OK] Papelera vaciada

echo.
echo Limpiando archivos de Prefetch...
del /q /f /s C:\Windows\Prefetch\* 2>nul
echo   [OK] Prefetch limpiado

echo.
echo Limpiando cache de navegadores...
del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" 2>nul
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" 2>nul
echo   [OK] Cache de navegadores limpiado

echo.
echo Limpiando reportes de errores...
del /q /f /s C:\ProgramData\Microsoft\Windows\WER\* 2>nul
echo   [OK] Reportes eliminados

echo.
echo ========================================
echo   Limpieza Completada!
echo ========================================
echo.
echo NOTA: Para una limpieza mas profunda, ejecuta el script .ps1
echo.
pause
