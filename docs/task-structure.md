# Estructura de Tareas

Las tareas en Task Master siguen un formato específico diseñado para proporcionar información completa tanto para humanos como para asistentes de IA.

## Campos de Tareas en tasks.json

Las tareas en tasks.json tienen la siguiente estructura:

- `id`: Identificador único para la tarea (Ejemplo: `1`)
- `title`: Título breve y descriptivo de la tarea (Ejemplo: `"Inicializar Repositorio"`)
- `description`: Descripción concisa de lo que implica la tarea (Ejemplo: `"Crear un nuevo repositorio, configurar estructura inicial."`)
- `status`: Estado actual de la tarea (Ejemplo: `"pending"`, `"done"`, `"deferred"`)
- `dependencies`: IDs de tareas que deben completarse antes de esta tarea (Ejemplo: `[1, 2]`)
  - Las dependencias se muestran con indicadores de estado (✅ para completadas, ⏱️ para pendientes)
  - Esto ayuda a identificar rápidamente qué tareas prerrequisito están bloqueando el trabajo
- `priority`: Nivel de importancia de la tarea (Ejemplo: `"high"`, `"medium"`, `"low"`)
- `details`: Instrucciones de implementación en profundidad (Ejemplo: `"Usar ID/secreto de cliente GitHub, manejar callback, establecer token de sesión."`)
- `testStrategy`: Enfoque de verificación (Ejemplo: `"Desplegar y llamar al endpoint para confirmar respuesta 'Hello World'."`)
- `subtasks`: Lista de tareas más pequeñas y específicas que componen la tarea principal (Ejemplo: `[{"id": 1, "title": "Configurar OAuth", ...}]`)

## Formato de Archivo de Tarea

Los archivos de tareas individuales siguen este formato:

```
# Task ID: <id>
# Title: <título>
# Status: <estado>
# Dependencies: <lista de IDs de dependencias separados por comas>
# Priority: <prioridad>
# Description: <descripción breve>
# Details:
<notas detalladas de implementación>

# Test Strategy:
<enfoque de verificación>
```

## Características en Detalle

### Analizando la Complejidad de Tareas

El comando `analyze-complexity`:

- Analiza cada tarea usando IA para evaluar su complejidad en una escala de 1-10
- Recomienda un número óptimo de subtareas basado en DEFAULT_SUBTASKS configurado
- Genera prompts personalizados para expandir cada tarea
- Crea un informe JSON completo con comandos listos para usar
- Guarda el informe en scripts/task-complexity-report.json por defecto

El informe generado contiene:

- Análisis de complejidad para cada tarea (puntuada de 1-10)
- Número recomendado de subtareas basado en la complejidad
- Prompts de expansión generados por IA personalizados para cada tarea
- Comandos de expansión listos para ejecutar directamente dentro de cada análisis de tarea

### Visualizando el Informe de Complejidad

El comando `complexity-report`:

- Muestra una versión formateada y fácil de leer del informe de análisis de complejidad
- Muestra tareas organizadas por puntuación de complejidad (de mayor a menor)
- Proporciona estadísticas de distribución de complejidad (baja, media, alta)
- Destaca tareas recomendadas para expansión basadas en el umbral de puntuación
- Incluye comandos de expansión listos para usar para cada tarea compleja
- Si no existe un informe, ofrece generar uno en el momento

### Expansión Inteligente de Tareas

El comando `expand` comprueba automáticamente y usa el informe de complejidad:

Cuando existe un informe de complejidad:

- Las tareas se expanden automáticamente usando el recuento de subtareas recomendado y los prompts
- Al expandir todas las tareas, se procesan en orden de complejidad (primero las más altas)
- La generación respaldada por investigación se preserva del análisis de complejidad
- Todavía puedes anular recomendaciones con opciones explícitas de línea de comandos

Ejemplo de flujo de trabajo:

```bash
# Generar el informe de análisis de complejidad con capacidades de investigación
task-master analyze-complexity --research

# Revisar el informe en un formato legible
task-master complexity-report

# Expandir tareas usando las recomendaciones optimizadas
task-master expand --id=8
# o expandir todas las tareas
task-master expand --all
```

### Encontrando la Siguiente Tarea

El comando `next`:

- Identifica tareas que están pendientes/en progreso y tienen todas las dependencias satisfechas
- Prioriza tareas por nivel de prioridad, recuento de dependencias y ID de tarea
- Muestra información completa sobre la tarea seleccionada:
  - Detalles básicos de la tarea (ID, título, prioridad, dependencias)
  - Detalles de implementación
  - Subtareas (si existen)
- Proporciona acciones sugeridas contextuales:
  - Comando para marcar la tarea como en progreso
  - Comando para marcar la tarea como completada
  - Comandos para trabajar con subtareas

### Visualizando Detalles de Tarea Específicos

El comando `show`:

- Muestra detalles completos sobre una tarea o subtarea específica
- Muestra estado de la tarea, prioridad, dependencias y notas detalladas de implementación
- Para tareas principales, muestra todas las subtareas y su estado
- Para subtareas, muestra la relación con la tarea principal
- Proporciona sugerencias de acción contextuales basadas en el estado de la tarea
- Funciona tanto con tareas regulares como subtareas (usando el formato tareaId.subtareaId)

## Mejores Prácticas para Desarrollo Impulsado por IA

1. **Comienza con un PRD detallado**: Cuanto más detallado sea tu PRD, mejores serán las tareas generadas.

2. **Revisa las tareas generadas**: Después de analizar el PRD, revisa las tareas para asegurarte de que tienen sentido y tienen dependencias apropiadas.

3. **Analiza la complejidad de las tareas**: Usa la característica de análisis de complejidad para identificar qué tareas deben desglosarse más.

4. **Sigue la cadena de dependencias**: Siempre respeta las dependencias de tareas - el agente de Cursor te ayudará con esto.

5. **Actualiza sobre la marcha**: Si tu implementación se desvía del plan, usa el comando update para mantener las tareas futuras alineadas con tu enfoque actual.

6. **Desglosa tareas complejas**: Usa el comando expand para desglosar tareas complejas en subtareas manejables.

7. **Regenera archivos de tareas**: Después de cualquier actualización a tasks.json, regenera los archivos de tareas para mantenerlos sincronizados.

8. **Comunica contexto al agente**: Cuando pidas al agente de Cursor que te ayude con una tarea, proporciona contexto sobre lo que estás tratando de lograr.

9. **Valida dependencias**: Periódicamente ejecuta el comando validate-dependencies para comprobar dependencias inválidas o circulares.