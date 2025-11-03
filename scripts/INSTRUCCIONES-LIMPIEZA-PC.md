# 🧹 Guía de Limpieza de PC para Windows

## 📋 Índice
- [Archivos Disponibles](#archivos-disponibles)
- [Opción 1: Script PowerShell (Recomendado)](#opción-1-script-powershell-recomendado)
- [Opción 2: Script Batch (Más Rápido)](#opción-2-script-batch-más-rápido)
- [Qué Limpia Cada Script](#qué-limpia-cada-script)
- [Preguntas Frecuentes](#preguntas-frecuentes)
- [Limpieza Manual Adicional](#limpieza-manual-adicional)

---

## 📁 Archivos Disponibles

1. **windows-pc-cleanup.ps1** - Script completo de PowerShell (RECOMENDADO)
2. **windows-pc-cleanup.bat** - Script rápido de limpieza básica

---

## 🎯 Opción 1: Script PowerShell (Recomendado)

### ¿Por qué usar este?
- Limpieza más completa
- Muestra progreso detallado
- Calcula espacio liberado
- Incluye recomendaciones adicionales

### 📝 Cómo usar:

1. **Descarga el archivo** `windows-pc-cleanup.ps1` a tu PC

2. **Click derecho** en el archivo → **Ejecutar con PowerShell**

3. Si ves un mensaje de seguridad, permite la ejecución:
   - Presiona **Windows + X** → **PowerShell (Administrador)**
   - Ejecuta: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
   - Navega a la carpeta donde descargaste el script
   - Ejecuta: `.\windows-pc-cleanup.ps1`

### ⚠️ IMPORTANTE:
- **Cierra todos los navegadores** antes de ejecutar (Edge, Chrome, Firefox)
- **Ejecuta como Administrador** para mejores resultados
- El script es 100% seguro, solo elimina archivos temporales

---

## ⚡ Opción 2: Script Batch (Más Rápido)

### ¿Por qué usar este?
- Ejecución más rápida
- No requiere configuración
- Ideal para limpiezas frecuentes

### 📝 Cómo usar:

1. **Descarga el archivo** `windows-pc-cleanup.bat` a tu PC

2. **Click derecho** en el archivo → **Ejecutar como Administrador**

3. ¡Listo! El script se ejecutará automáticamente

---

## 🧼 Qué Limpia Cada Script

### ✅ Ambos scripts limpian:
- **Archivos temporales de Windows** (`%TEMP%` y `C:\Windows\Temp`)
- **Papelera de reciclaje**
- **Caché de navegadores** (Edge, Chrome)
- **Archivos Prefetch** (optimización de Windows)
- **Reportes de errores** de Windows

### ✅ Solo el script PowerShell también limpia:
- **Caché de Windows Update**
- **Logs antiguos de Windows** (más de 30 días)
- **Ejecuta el Liberador de espacio** de Windows
- **Muestra estadísticas** de espacio liberado

---

## ❓ Preguntas Frecuentes

### ¿Es seguro ejecutar estos scripts?
**SÍ.** Solo eliminan archivos temporales y caché. No tocan:
- Tus documentos
- Tus fotos
- Tus programas
- Tus configuraciones

### ¿Con qué frecuencia debo ejecutarlo?
- **Uso normal:** Una vez al mes
- **Mucho uso:** Cada 2 semanas
- **PC lenta:** Una vez por semana

### ¿Cuánto espacio liberará?
Depende de tu uso, pero típicamente:
- 1-5 GB en uso normal
- 5-20 GB si nunca has limpiado
- 20+ GB si usas mucho el navegador

### ¿Necesito reiniciar después?
No es necesario, pero puede mejorar el rendimiento.

### ¿Qué hago si dice "acceso denegado"?
Asegúrate de ejecutar como **Administrador**:
1. Click derecho en el archivo
2. Selecciona "Ejecutar como Administrador"

---

## 🔧 Limpieza Manual Adicional

Después de ejecutar los scripts, considera estas limpiezas manuales:

### 1. Desinstalar Programas No Usados
```
Configuración → Aplicaciones → Aplicaciones y características
```
Busca programas que no uses y desinstálalos.

### 2. Activar Sensor de Almacenamiento
```
Configuración → Sistema → Almacenamiento → Sensor de almacenamiento
```
Actívalo para limpieza automática.

### 3. Desfragmentar Disco (Solo HDD, NO SSD)
```
Busca "Desfragmentar" en el menú inicio → Optimizar unidades
```
**NOTA:** NO desfragmentes si tienes un SSD.

### 4. Limpiar Archivos Grandes Innecesarios
```
Configuración → Sistema → Almacenamiento → Archivos temporales
```
Revisa y elimina archivos grandes que no necesites.

### 5. Vaciar Descargas
```
Abre la carpeta "Descargas" y elimina lo que no necesites
```

---

## 🎨 Herramientas Adicionales Recomendadas

### Gratis y Confiables:
- **CCleaner** (versión gratuita) - Limpieza profunda
- **TreeSize Free** - Ver qué ocupa espacio
- **WinDirStat** - Visualizar uso de disco
- **BleachBit** - Alternativa open-source

### Integradas en Windows:
- **Liberador de espacio en disco** (cleanmgr.exe)
- **Sensor de almacenamiento** (Configuración)
- **Administrador de tareas** - Ver procesos que consumen recursos

---

## 📞 Soporte

Si tienes problemas:
1. Asegúrate de ejecutar como **Administrador**
2. Cierra todos los programas antes de ejecutar
3. Verifica que tienes Windows 10 o superior
4. Si persiste el error, ejecuta el script .bat en lugar del .ps1

---

## ⚡ Atajos Rápidos de Windows Útiles

- `Windows + I` → Configuración
- `Windows + E` → Explorador de archivos
- `Windows + R` → Ejecutar
  - Escribe `cleanmgr` → Liberador de espacio
  - Escribe `temp` → Abrir carpeta temporal
  - Escribe `%temp%` → Otra carpeta temporal
  - Escribe `prefetch` → Carpeta prefetch

---

## 📊 Antes y Después

Para ver cuánto espacio tienes:
1. Abre **Este Equipo**
2. Mira el disco **C:**
3. Anota el espacio libre
4. Ejecuta el script
5. Compara el espacio libre después

---

**✨ ¡Mantén tu PC limpia y rápida!**

*Scripts creados por Claude - Task Master AI*
*Última actualización: 2025-11-03*
