#!/bin/bash

command_not_found_handle() {
    # First try normal command not found behavior
    command_not_found_original "$1" 2>/dev/null && return 127

    # Get command suggestion
    local suggested_cmd
    suggested_cmd=$(source "$HOME/.ollama_shell/venv/bin/activate" && \
                   python3 "$HOME/.ollama_shell/command_suggestion.py" "$@")

    # Execute or show error
    if [ -n "$suggested_cmd" ]; then
        echo -e "\033[1;35m→ $suggested_cmd\033[0m"  # Purple suggestion
        eval "$suggested_cmd"
    else
        echo -e "\033[1;31mNo suggestion available\033[0m"  # Red error
        return 127
    fi
}

# Preserve original handler
command_not_found_original() {
    if [ -x /usr/lib/command-not-found ]; then
        /usr/lib/command-not-found -- "$1"
        return $?
    elif [ -x /usr/share/command-not-found/command-not-found ]; then
        /usr/share/command-not-found/command-not-found -- "$1"
        return $?
    else
        printf "%s: command not found\n" "$1" >&2
        return 127
    fi
}
