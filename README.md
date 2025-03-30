# ollama-shell-integration

AI-powered command suggestions for bash. Executes intelligent command suggestions when entered commands aren't found.

## Features

- Converts natural language to Linux commands (`"list files"` → `ls`)
- Handles common command mistakes automatically
- Self-contained Python virtual environment
- Supports Ubuntu/Debian systems

## Installation

### Prerequisites
- Ubuntu/Debian Linux
- Python 3.6+
- Ollama installed system-wide ([Install Guide](https://ollama.com))
- llama3 model installed ([llama3](https://ollama.com/library/llama3:8b))

### Method 1: Install from .deb
```bash
# Download the package
wget https://github.com/jhamlin461/ollama-shell-integration/blob/main/ollama-shell-integration_1.0-1.deb

# Install
sudo apt install ./ollama-shell-integration_1.0-1.deb
