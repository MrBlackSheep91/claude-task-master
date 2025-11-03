# Script de Limpieza Segura para Windows PC
# Creado por Claude - Task Master AI
# Uso: Ejecutar como Administrador para mejores resultados

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Limpieza Segura de PC - Windows" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Función para obtener espacio liberado
function Get-FreedSpace {
    param($before, $after)
    $freed = [math]::Round(($before - $after) / 1GB, 2)
    return $freed
}

# Obtener espacio inicial
$initialSpace = (Get-PSDrive C).Free

Write-Host "Iniciando limpieza segura..." -ForegroundColor Yellow
Write-Host ""

# 1. Limpiar archivos temporales de Windows
Write-Host "[1/8] Limpiando archivos temporales de Windows..." -ForegroundColor Green
try {
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Archivos temporales eliminados" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ Algunos archivos temporales no se pudieron eliminar (en uso)" -ForegroundColor Yellow
}

# 2. Limpiar caché de Windows Update
Write-Host "[2/8] Limpiando caché de Windows Update..." -ForegroundColor Green
try {
    Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name wuauserv -ErrorAction SilentlyContinue
    Write-Host "  ✓ Caché de Windows Update limpiado" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ No se pudo limpiar el caché de Windows Update" -ForegroundColor Yellow
}

# 3. Limpiar Papelera de Reciclaje
Write-Host "[3/8] Vaciando Papelera de Reciclaje..." -ForegroundColor Green
try {
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Papelera de reciclaje vaciada" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ No se pudo vaciar la papelera" -ForegroundColor Yellow
}

# 4. Limpiar archivos de prefetch
Write-Host "[4/8] Limpiando archivos de Prefetch..." -ForegroundColor Green
try {
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Archivos de Prefetch eliminados" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ No se pudieron eliminar archivos de Prefetch" -ForegroundColor Yellow
}

# 5. Limpiar caché de navegadores (Edge, Chrome)
Write-Host "[5/8] Limpiando caché de navegadores..." -ForegroundColor Green
try {
    # Edge
    Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    # Chrome
    Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Caché de navegadores limpiado" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ Algunos cachés no se pudieron limpiar (navegador abierto?)" -ForegroundColor Yellow
}

# 6. Limpiar logs antiguos de Windows
Write-Host "[6/8] Limpiando logs antiguos de Windows..." -ForegroundColor Green
try {
    Get-ChildItem -Path "C:\Windows\Logs" -Recurse -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } |
        Remove-Item -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Logs antiguos eliminados" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ Algunos logs no se pudieron eliminar" -ForegroundColor Yellow
}

# 7. Limpiar archivos de errores de Windows
Write-Host "[7/8] Limpiando reportes de errores..." -ForegroundColor Green
try {
    Remove-Item -Path "C:\ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  ✓ Reportes de errores eliminados" -ForegroundColor Gray
} catch {
    Write-Host "  ⚠ No se pudieron eliminar todos los reportes" -ForegroundColor Yellow
}

# 8. Ejecutar Disk Cleanup (opcional - requiere interacción)
Write-Host "[8/8] Iniciando Liberador de espacio en disco de Windows..." -ForegroundColor Green
Write-Host "  ℹ Se abrirá una ventana para seleccionar opciones adicionales" -ForegroundColor Cyan
try {
    Start-Process cleanmgr.exe -ArgumentList "/sagerun:1" -Wait -ErrorAction SilentlyContinue
} catch {
    Write-Host "  ⚠ No se pudo ejecutar el liberador de espacio" -ForegroundColor Yellow
}

# Calcular espacio liberado
Start-Sleep -Seconds 2
$finalSpace = (Get-PSDrive C).Free
$freedSpace = Get-FreedSpace -before $initialSpace -after $finalSpace

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Limpieza Completada!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Espacio liberado aproximado: $freedSpace GB" -ForegroundColor Yellow
Write-Host ""
Write-Host "RECOMENDACIONES ADICIONALES:" -ForegroundColor Cyan
Write-Host "  1. Ejecuta 'Desfragmentar y optimizar unidades' desde el menú inicio" -ForegroundColor White
Write-Host "  2. Revisa 'Aplicaciones' en Configuración para desinstalar programas no usados" -ForegroundColor White
Write-Host "  3. Usa 'Sensor de almacenamiento' en Configuración para limpieza automática" -ForegroundColor White
Write-Host ""
Write-Host "Presiona cualquier tecla para salir..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
