#!/bin/bash

# Configuration
INSTALL_DIR="$HOME/.ollama_shell"

# Remove shell integration from .bashrc
sed -i '/# Ollama Command Suggestion Integration/,/source.*shell_integration.sh/d' ~/.bashrc

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    echo "Removing installation directory..."
    rm -rf "$INSTALL_DIR"
else
    echo "Installation directory not found at $INSTALL_DIR"
fi

# Check if current shell is affected
if [ -n "$BASH_VERSION" ]; then
    echo -e "\nUninstallation complete!"
    echo "Note: You may need to restart your terminal for all changes to take effect."
    echo "To immediately clean your current session, run:"
    echo "  unset command_not_found_handle"
else
    echo -e "\nUninstallation complete!"
    echo "Please restart your terminal to complete the cleanup."
fi
