# ollama-shell-integration

AI-powered command suggestions for bash. Executes intelligent command suggestions when entered commands aren't found.

## Features

- Converts natural language to Linux commands (`"list files"` → `ls`)
- Handles common command mistakes automatically
- Purple-highlighted suggestions before execution
- Self-contained Python virtual environment
- Supports Ubuntu/Debian systems

## Installation

### Prerequisites
- Ubuntu/Debian Linux
- Python 3.6+
- Ollama installed system-wide ([Install Guide](https://ollama.com))

### Method 1: Install from .deb
```bash
# Download the package
wget https://github.com/jhamlin461/ollama-shell-integration/blob/main/ollama-shell-integration_1.0-1.deb

# Install with dependencies
sudo apt install ./ollama-shell-integration_1.0-1.deb
