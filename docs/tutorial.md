# Tutorial de Task Master

Este tutorial te guiará a través de la configuración y uso de Task Master para desarrollo impulsado por IA.

## Configuración Inicial

Hay dos formas de configurar Task Master: usando MCP (recomendado) o mediante instalación npm.

### Opción 1: Usando MCP (Recomendado)

MCP (Model Control Protocol) proporciona la forma más sencilla de comenzar con Task Master directamente en tu editor.

1. **Añade la configuración MCP a tu editor** (Se recomienda Cursor, pero funciona con otros editores de texto):

```json
{
	"mcpServers": {
		"taskmaster-ai": {
			"command": "npx",
			"args": ["-y", "task-master-mcp"],
			"env": {
				"ANTHROPIC_API_KEY": "TU_CLAVE_API_ANTHROPIC_AQUÍ",
				"PERPLEXITY_API_KEY": "TU_CLAVE_API_PERPLEXITY_AQUÍ",
				"MODEL": "claude-3-7-sonnet-20250219",
				"PERPLEXITY_MODEL": "sonar-pro",
				"MAX_TOKENS": 64000,
				"TEMPERATURE": 0.2,
				"DEFAULT_SUBTASKS": 5,
				"DEFAULT_PRIORITY": "medium"
			}
		}
	}
}
```

2. **Habilita el MCP** en la configuración de tu editor

3. **Solicita a la IA** inicializar Task Master:

```
¿Puedes inicializar taskmaster-ai en mi proyecto?
```

La IA:

- Creará la estructura necesaria del proyecto
- Configurará los archivos de configuración iniciales
- Te guiará a través del resto del proceso

4. Coloca tu documento PRD en el directorio `scripts/` (p.ej., `scripts/prd.txt`)

5. **Usa comandos en lenguaje natural** para interactuar con Task Master:

```
¿Puedes analizar mi PRD en scripts/prd.txt?
¿Cuál es la siguiente tarea en la que debería trabajar?
¿Puedes ayudarme a implementar la tarea 3?
```

### Opción 2: Instalación Manual

Si prefieres usar la interfaz de línea de comandos directamente:

```bash
# Instalar globalmente
npm install -g task-master-ai

# O instalar localmente dentro de tu proyecto
npm install task-master-ai
```

Inicializa un nuevo proyecto:

```bash
# Si está instalado globalmente
task-master init

# Si está instalado localmente
npx task-master-init
```

Esto te pedirá detalles del proyecto y configurará un nuevo proyecto con los archivos y la estructura necesarios.

## Comandos Comunes

Después de configurar Task Master, puedes usar estos comandos (ya sea mediante prompts de IA o CLI):

```bash
# Analizar un PRD y generar tareas
task-master parse-prd tu-prd.txt

# Listar todas las tareas
task-master list

# Mostrar la siguiente tarea en la que trabajar
task-master next

# Generar archivos de tareas
task-master generate
```

## Configuración de la Integración con Cursor AI

Task Master está diseñado para funcionar perfectamente con [Cursor AI](https://www.cursor.so/), proporcionando un flujo de trabajo estructurado para el desarrollo impulsado por IA.

### Usando Cursor con MCP (Recomendado)

Si ya has configurado Task Master con MCP en Cursor, la integración es automática. Puedes simplemente usar lenguaje natural para interactuar con Task Master:

```
¿Qué tareas están disponibles para trabajar a continuación?
¿Puedes analizar la complejidad de nuestras tareas?
Me gustaría implementar la tarea 4. ¿Qué implica?
```

### Configuración Manual de Cursor

Si no estás usando MCP, aún puedes configurar la integración con Cursor:

1. Después de inicializar tu proyecto, ábrelo en Cursor
2. El archivo `.cursor/rules/dev_workflow.mdc` es cargado automáticamente por Cursor, proporcionando a la IA conocimiento sobre el sistema de gestión de tareas
3. Coloca tu documento PRD en el directorio `scripts/` (p.ej., `scripts/prd.txt`)
4. Abre el chat de IA de Cursor y cambia al modo Agente

### Configuración Alternativa de MCP en Cursor

También puedes configurar el servidor MCP en la configuración de Cursor:

1. Ve a la configuración de Cursor
2. Navega a la sección MCP
3. Haz clic en "Añadir Nuevo Servidor MCP"
4. Configura con los siguientes detalles:
   - Nombre: "Task Master"
   - Tipo: "Command"
   - Comando: "npx -y task-master-mcp"
5. Guarda la configuración

Una vez configurado, puedes interactuar con los comandos de gestión de tareas de Task Master directamente a través de la interfaz de Cursor, proporcionando una experiencia más integrada.

## Generación Inicial de Tareas

En el chat de IA de Cursor, instruye al agente para generar tareas desde tu PRD:

```
Por favor, usa el comando task-master parse-prd para generar tareas desde mi PRD. El PRD se encuentra en scripts/prd.txt.
```

El agente ejecutará:

```bash
task-master parse-prd scripts/prd.txt
```

Esto:

- Analizará tu documento PRD
- Generará un archivo `tasks.json` estructurado con tareas, dependencias, prioridades y estrategias de prueba
- El agente entenderá este proceso debido a las reglas de Cursor

### Generar Archivos de Tareas Individuales

A continuación, pide al agente que genere archivos de tareas individuales:

```
Por favor, genera archivos de tareas individuales a partir de tasks.json
```

El agente ejecutará:

```bash
task-master generate
```

Esto crea archivos de tareas individuales en el directorio `tasks/` (p.ej., `task_001.txt`, `task_002.txt`), facilitando la referencia a tareas específicas.

## Flujo de Trabajo de Desarrollo Impulsado por IA

El agente de Cursor está preconfigurado (a través del archivo de reglas) para seguir este flujo de trabajo:

### 1. Descubrimiento y Selección de Tareas

Pide al agente que liste las tareas disponibles:

```
¿Qué tareas están disponibles para trabajar a continuación?
```

El agente:

- Ejecutará `task-master list` para ver todas las tareas
- Ejecutará `task-master next` para determinar la siguiente tarea en la que trabajar
- Analizará dependencias para determinar qué tareas están listas para ser trabajadas
- Priorizará tareas basándose en el nivel de prioridad y el orden de ID
- Sugerirá la(s) siguiente(s) tarea(s) a implementar

### 2. Implementación de Tareas

Al implementar una tarea, el agente:

- Referenciará la sección de detalles de la tarea para especificaciones de implementación
- Considerará dependencias de tareas anteriores
- Seguirá los estándares de codificación del proyecto
- Creará pruebas apropiadas basadas en la estrategia de prueba de la tarea

Puedes preguntar:

```
Implementemos la tarea 3. ¿Qué implica?
```

### 3. Verificación de Tareas

Antes de marcar una tarea como completa, verifica según:

- La estrategia de prueba especificada en la tarea
- Cualquier prueba automatizada en el código base
- Verificación manual si es requerida

### 4. Finalización de Tareas

Cuando una tarea está completada, dile al agente:

```
La tarea 3 está ahora completa. Por favor, actualiza su estado.
```

El agente ejecutará:

```bash
task-master set-status --id=3 --status=done
```

### 5. Manejo de Desviaciones en la Implementación

Si durante la implementación descubres que:

- El enfoque actual difiere significativamente de lo planeado
- Las tareas futuras necesitan ser modificadas debido a las elecciones de implementación actuales
- Han surgido nuevas dependencias o requisitos

Dile al agente:

```
Hemos cambiado nuestro enfoque. Ahora estamos usando Express en lugar de Fastify. Por favor, actualiza todas las tareas futuras para reflejar este cambio.
```

El agente ejecutará:

```bash
task-master update --from=4 --prompt="Ahora estamos usando Express en lugar de Fastify."
```

Esto reescribirá o redefinirá las tareas subsiguientes en tasks.json mientras preserva el trabajo completado.

### 6. Desglose de Tareas Complejas

Para tareas complejas que necesitan más granularidad:

```
La tarea 5 parece compleja. ¿Puedes desglosarla en subtareas?
```

El agente ejecutará:

```bash
task-master expand --id=5 --num=3
```

Puedes proporcionar contexto adicional:

```
Por favor, desglosa la tarea 5 con un enfoque en consideraciones de seguridad.
```

El agente ejecutará:

```bash
task-master expand --id=5 --prompt="Enfócate en aspectos de seguridad"
```

También puedes expandir todas las tareas pendientes:

```
Por favor, desglosa todas las tareas pendientes en subtareas.
```

El agente ejecutará:

```bash
task-master expand --all
```

Para generación de subtareas respaldada por investigación usando Perplexity AI:

```
Por favor, desglosa la tarea 5 usando generación respaldada por investigación.
```

El agente ejecutará:

```bash
task-master expand --id=5 --research
```

## Ejemplos de Interacciones con Cursor AI

### Comenzar un nuevo proyecto

```
Acabo de inicializar un nuevo proyecto con Claude Task Master. Tengo un PRD en scripts/prd.txt.
¿Puedes ayudarme a analizarlo y configurar las tareas iniciales?
```

### Trabajar en tareas

```
¿Cuál es la siguiente tarea en la que debería trabajar? Por favor, considera dependencias y prioridades.
```

### Implementar una tarea específica

```
Me gustaría implementar la tarea 4. ¿Puedes ayudarme a entender qué debe hacerse y cómo abordarlo?
```

### Gestionar subtareas

```
Necesito regenerar las subtareas para la tarea 3 con un enfoque diferente. ¿Puedes ayudarme a borrarlas y regenerarlas?
```

### Manejar cambios

```
Hemos decidido usar MongoDB en lugar de PostgreSQL. ¿Puedes actualizar todas las tareas futuras para reflejar este cambio?
```

### Completar trabajo

```
He terminado de implementar el sistema de autenticación descrito en la tarea 2. Todas las pruebas están pasando.
Por favor, márcala como completa y dime en qué debería trabajar a continuación.
```

### Analizar complejidad

```
¿Puedes analizar la complejidad de nuestras tareas para ayudarme a entender cuáles necesitan ser desglosadas más?
```

### Ver informe de complejidad

```
¿Puedes mostrarme el informe de complejidad en un formato más legible?
```