# Referencia de Comandos de Task Master

Aquí hay una referencia completa de todos los comandos disponibles:

## Analizar PRD

```bash
# Analizar un archivo PRD y generar tareas
task-master parse-prd <archivo-prd.txt>

# Limitar el número de tareas generadas
task-master parse-prd <archivo-prd.txt> --num-tasks=10
```

## Listar Tareas

```bash
# Listar todas las tareas
task-master list

# Listar tareas con un estado específico
task-master list --status=<estado>

# Listar tareas con subtareas
task-master list --with-subtasks

# Listar tareas con un estado específico e incluir subtareas
task-master list --status=<estado> --with-subtasks
```

## Mostrar Siguiente Tarea

```bash
# Mostrar la siguiente tarea en la que trabajar basada en dependencias y estado
task-master next
```

## Mostrar Tarea Específica

```bash
# Mostrar detalles de una tarea específica
task-master show <id>
# o
task-master show --id=<id>

# Ver una subtarea específica (p.ej., subtarea 2 de la tarea 1)
task-master show 1.2
```

## Actualizar Tareas

```bash
# Actualizar tareas desde un ID específico y proporcionar contexto
task-master update --from=<id> --prompt="<prompt>"
```

## Actualizar una Tarea Específica

```bash
# Actualizar una sola tarea por ID con nueva información
task-master update-task --id=<id> --prompt="<prompt>"

# Usar actualizaciones respaldadas por investigación con Perplexity AI
task-master update-task --id=<id> --prompt="<prompt>" --research
```

## Actualizar una Subtarea

```bash
# Añadir información adicional a una subtarea específica
task-master update-subtask --id=<parentId.subtaskId> --prompt="<prompt>"

# Ejemplo: Añadir detalles sobre limitación de tasa de API a la subtarea 2 de la tarea 5
task-master update-subtask --id=5.2 --prompt="Añadir limitación de tasa de 100 solicitudes por minuto"

# Usar actualizaciones respaldadas por investigación con Perplexity AI
task-master update-subtask --id=<parentId.subtaskId> --prompt="<prompt>" --research
```

A diferencia del comando `update-task` que reemplaza la información de la tarea, el comando `update-subtask` _añade_ nueva información a los detalles de la subtarea existente, marcándola con una marca de tiempo. Esto es útil para mejorar iterativamente las subtareas mientras se preserva el contenido original.

## Generar Archivos de Tareas

```bash
# Generar archivos de tareas individuales desde tasks.json
task-master generate
```

## Establecer Estado de Tarea

```bash
# Establecer estado de una sola tarea
task-master set-status --id=<id> --status=<estado>

# Establecer estado para múltiples tareas
task-master set-status --id=1,2,3 --status=<estado>

# Establecer estado para subtareas
task-master set-status --id=1.1,1.2 --status=<estado>
```

Cuando se marca una tarea como "done" (completada), todas sus subtareas también se marcarán automáticamente como "done".

## Expandir Tareas

```bash
# Expandir una tarea específica con subtareas
task-master expand --id=<id> --num=<número>

# Expandir con contexto adicional
task-master expand --id=<id> --prompt="<contexto>"

# Expandir todas las tareas pendientes
task-master expand --all

# Forzar regeneración de subtareas para tareas que ya las tienen
task-master expand --all --force

# Generación de subtareas respaldada por investigación para una tarea específica
task-master expand --id=<id> --research

# Generación respaldada por investigación para todas las tareas
task-master expand --all --research
```

## Borrar Subtareas

```bash
# Borrar subtareas de una tarea específica
task-master clear-subtasks --id=<id>

# Borrar subtareas de múltiples tareas
task-master clear-subtasks --id=1,2,3

# Borrar subtareas de todas las tareas
task-master clear-subtasks --all
```

## Analizar Complejidad de Tareas

```bash
# Analizar complejidad de todas las tareas
task-master analyze-complexity

# Guardar informe en una ubicación personalizada
task-master analyze-complexity --output=mi-informe.json

# Usar un modelo LLM específico
task-master analyze-complexity --model=claude-3-opus-20240229

# Establecer un umbral de complejidad personalizado (1-10)
task-master analyze-complexity --threshold=6

# Usar un archivo de tareas alternativo
task-master analyze-complexity --file=tareas-personalizadas.json

# Usar Perplexity AI para análisis de complejidad respaldado por investigación
task-master analyze-complexity --research
```

## Ver Informe de Complejidad

```bash
# Mostrar el informe de análisis de complejidad de tareas
task-master complexity-report

# Ver un informe en una ubicación personalizada
task-master complexity-report --file=mi-informe.json
```

## Gestionar Dependencias de Tareas

```bash
# Añadir una dependencia a una tarea
task-master add-dependency --id=<id> --depends-on=<id>

# Eliminar una dependencia de una tarea
task-master remove-dependency --id=<id> --depends-on=<id>

# Validar dependencias sin arreglarlas
task-master validate-dependencies

# Encontrar y arreglar dependencias inválidas automáticamente
task-master fix-dependencies
```

## Añadir una Nueva Tarea

```bash
# Añadir una nueva tarea usando IA
task-master add-task --prompt="Descripción de la nueva tarea"

# Añadir una tarea con dependencias
task-master add-task --prompt="Descripción" --dependencies=1,2,3

# Añadir una tarea con prioridad
task-master add-task --prompt="Descripción" --priority=high
```

## Inicializar un Proyecto

```bash
# Inicializar un nuevo proyecto con estructura de Task Master
task-master init
```