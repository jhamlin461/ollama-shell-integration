#!/bin/bash

# Configuration
INSTALL_DIR="$HOME/.ollama_shell"
VENV_DIR="$INSTALL_DIR/venv"

# Check requirements
REQUIREMENTS=("python3" "ollama")
for cmd in "${REQUIREMENTS[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is required but not installed"
        exit 1
    fi
done

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Verify source files exist
REQUIRED_FILES=("command_suggestion.py" "shell_integration.sh")
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "./$file" ]; then
        echo "Error: Missing required file $file"
        echo "Please run this script from the directory containing your files"
        exit 1
    fi
done

# Copy files to installation directory
cp command_suggestion.py shell_integration.sh "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/command_suggestion.py"

# Set up virtual environment
echo "Creating Python virtual environment..."
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"
pip install --upgrade pip >/dev/null
pip install ollama >/dev/null

# Add to .bashrc
if ! grep -q "shell_integration.sh" ~/.bashrc; then
    echo -e "\n# Ollama Command Suggestion Integration" >> ~/.bashrc
    echo "source \"$INSTALL_DIR/shell_integration.sh\"" >> ~/.bashrc

    # Source .bashrc for current shell
    if [ -n "$BASH_VERSION" ]; then
        echo "Loading new configuration in current shell..."
        source ~/.bashrc
    fi
fi

echo "Installation complete! Relaunch your terminal to begin using AI command suggestions."
