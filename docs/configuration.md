# Configuración

Task Master puede configurarse a través de variables de entorno en un archivo `.env` en la raíz de tu proyecto.

## Configuración Requerida

- `ANTHROPIC_API_KEY`: Tu clave API de Anthropic para Claude (Ejemplo: `ANTHROPIC_API_KEY=sk-ant-api03-...`)

## Configuración Opcional

- `MODEL` (Predeterminado: `"claude-3-7-sonnet-20250219"`): Modelo de Claude a utilizar (Ejemplo: `MODEL=claude-3-opus-20240229`)
- `MAX_TOKENS` (Predeterminado: `"4000"`): Máximo de tokens para respuestas (Ejemplo: `MAX_TOKENS=8000`)
- `TEMPERATURE` (Predeterminado: `"0.7"`): Temperatura para respuestas del modelo (Ejemplo: `TEMPERATURE=0.5`)
- `DEBUG` (Predeterminado: `"false"`): Habilitar registro de depuración (Ejemplo: `DEBUG=true`)
- `LOG_LEVEL` (Predeterminado: `"info"`): Nivel de salida de consola (Ejemplo: `LOG_LEVEL=debug`)
- `DEFAULT_SUBTASKS` (Predeterminado: `"3"`): Cantidad predeterminada de subtareas (Ejemplo: `DEFAULT_SUBTASKS=5`)
- `DEFAULT_PRIORITY` (Predeterminado: `"medium"`): Prioridad predeterminada (Ejemplo: `DEFAULT_PRIORITY=high`)
- `PROJECT_NAME` (Predeterminado: `"MCP SaaS MVP"`): Nombre del proyecto en metadatos (Ejemplo: `PROJECT_NAME=Mi Proyecto Asombroso`)
- `PROJECT_VERSION` (Predeterminado: `"1.0.0"`): Versión en metadatos (Ejemplo: `PROJECT_VERSION=2.1.0`)
- `PERPLEXITY_API_KEY`: Para características respaldadas por investigación (Ejemplo: `PERPLEXITY_API_KEY=pplx-...`)
- `PERPLEXITY_MODEL` (Predeterminado: `"sonar-medium-online"`): Modelo de Perplexity (Ejemplo: `PERPLEXITY_MODEL=sonar-large-online`)

## Ejemplo de Archivo .env

```
# Requerido
ANTHROPIC_API_KEY=sk-ant-api03-tu-clave-api

# Opcional - Configuración de Claude
MODEL=claude-3-7-sonnet-20250219
MAX_TOKENS=4000
TEMPERATURE=0.7

# Opcional - API de Perplexity para Investigación
PERPLEXITY_API_KEY=pplx-tu-clave-api
PERPLEXITY_MODEL=sonar-medium-online

# Opcional - Información del Proyecto
PROJECT_NAME=Mi Proyecto
PROJECT_VERSION=1.0.0

# Opcional - Configuración de Aplicación
DEFAULT_SUBTASKS=3
DEFAULT_PRIORITY=medium
DEBUG=false
LOG_LEVEL=info
```

## Solución de Problemas

### Si `task-master init` no responde:

Intenta ejecutarlo directamente con Node:

```bash
node node_modules/claude-task-master/scripts/init.js
```

O clona el repositorio y ejecuta:

```bash
git clone https://github.com/eyaltoledano/claude-task-master.git
cd claude-task-master
node scripts/init.js
```