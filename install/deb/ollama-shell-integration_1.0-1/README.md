# Ollama Shell Integration

AI-powered command suggestions for your terminal. Converts natural language to Linux commands.

## Features

- Natural language to command conversion ("list files" → `ls`)
- Automatic handling of common command mistakes
- Visual command suggestions before execution
- Self-contained Python virtual environment
- Ubuntu/Debian compatible

## Installation

### Requirements
- Ubuntu/Debian Linux
- Python 3.6+
- System-wide Ollama ([Install Guide](https://ollama.com))
- llama3 ([llama3](https://ollama.com/library/llama3:8b))

### Install .deb Package
```bash
sudo apt install ./ollama-shell-integration_1.0-1.deb
