# Task Master [![Estrellas en GitHub](https://img.shields.io/github/stars/eyaltoledano/claude-task-master?style=social)](https://github.com/eyaltoledano/claude-task-master/stargazers)

[![CI](https://github.com/eyaltoledano/claude-task-master/actions/workflows/ci.yml/badge.svg)](https://github.com/eyaltoledano/claude-task-master/actions/workflows/ci.yml) [![versión npm](https://badge.fury.io/js/task-master-ai.svg)](https://badge.fury.io/js/task-master-ai) ![Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/2ms58QJjqp?style=flat) [![Licencia: MIT con Cláusula Commons](https://img.shields.io/badge/license-MIT%20with%20Commons%20Clause-blue.svg)](LICENSE)

### Por [@eyaltoledano](https://x.com/eyaltoledano) y [@RalphEcom](https://x.com/RalphEcom)

[![Seguir en Twitter](https://img.shields.io/twitter/follow/eyaltoledano?style=flat)](https://x.com/eyaltoledano)
[![Seguir en Twitter](https://img.shields.io/twitter/follow/RalphEcom?style=flat)](https://x.com/RalphEcom)

Un sistema de gestión de tareas para desarrollo impulsado por IA con Claude, diseñado para funcionar perfectamente con Cursor AI.

## Requisitos

- Clave API de Anthropic (API de Claude)
- SDK de OpenAI (para integración con API de Perplexity, opcional)

## Inicio Rápido

### Opción 1 | MCP (Recomendada):

MCP (Protocolo de Control de Modelos) proporciona la forma más sencilla de comenzar con Task Master directamente en tu editor.

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

2. **Habilita el MCP** en tu editor

3. **Solicita a la IA** inicializar Task Master:

```
¿Puedes inicializar taskmaster-ai en mi proyecto?
```

4. **Usa comandos comunes** directamente a través de tu asistente de IA:

```txt
¿Puedes analizar mi PRD en scripts/prd.txt?
¿Cuál es la siguiente tarea en la que debería trabajar?
¿Puedes ayudarme a implementar la tarea 3?
¿Puedes ayudarme a expandir la tarea 4?
```

### Opción 2: Usando la Línea de Comandos

#### Instalación

```bash
# Instalar globalmente
npm install -g task-master-ai

# O instalar localmente dentro de tu proyecto
npm install task-master-ai
```

#### Inicializar un nuevo proyecto

```bash
# Si está instalado globalmente
task-master init

# Si está instalado localmente
npx task-master-init
```

Esto te pedirá detalles del proyecto y configurará un nuevo proyecto con los archivos y la estructura necesarios.

#### Comandos Comunes

```bash
# Inicializar un nuevo proyecto
task-master init

# Analizar un PRD y generar tareas
task-master parse-prd tu-prd.txt

# Listar todas las tareas
task-master list

# Mostrar la siguiente tarea en la que trabajar
task-master next

# Generar archivos de tareas
task-master generate
```

## Documentación

Para información más detallada, consulta la documentación en el directorio `docs`:

- [Guía de Configuración](docs/configuration.md) - Configura variables de entorno y personaliza Task Master
- [Tutorial](docs/tutorial.md) - Guía paso a paso para comenzar con Task Master
- [Referencia de Comandos](docs/command-reference.md) - Lista completa de todos los comandos disponibles
- [Estructura de Tareas](docs/task-structure.md) - Entendiendo el formato y características de las tareas
- [Ejemplos de Interacciones](docs/examples.md) - Ejemplos comunes de interacción con Cursor AI

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

## Colaboradores

<a href="https://github.com/eyaltoledano/claude-task-master/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=eyaltoledano/claude-task-master" alt="Colaboradores del proyecto Task Master" />
</a>

## Historial de Estrellas

[![Gráfico de Historial de Estrellas](https://api.star-history.com/svg?repos=eyaltoledano/claude-task-master&type=Timeline)](https://www.star-history.com/#eyaltoledano/claude-task-master&Timeline)

## Licencia

Task Master está licenciado bajo la Licencia MIT con Cláusula Commons. Esto significa que puedes:

✅ **Permitido**:

- Usar Task Master para cualquier propósito (personal, comercial, académico)
- Modificar el código
- Distribuir copias
- Crear y vender productos construidos usando Task Master

❌ **No Permitido**:

- Vender Task Master en sí mismo
- Ofrecer Task Master como un servicio alojado
- Crear productos competidores basados en Task Master

Consulta el archivo [LICENSE](LICENSE) para el texto completo de la licencia y [detalles de licencia](docs/licensing.md) para más información.