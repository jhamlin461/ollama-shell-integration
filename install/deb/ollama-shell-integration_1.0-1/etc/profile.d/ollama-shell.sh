#!/bin/bash

# Only proceed if in interactive bash shell
if [ -n "$BASH_VERSION" ] && [[ $- == *i* ]]; then
    command_not_found_handle() {
        # First try normal command not found behavior
        command_not_found_original "$1" 2>/dev/null && return 127

        # Get command suggestion
        local suggested_cmd
        suggested_cmd=$(/usr/local/share/ollama-shell/venv/bin/python3 /usr/local/bin/command_suggestion.py "$@")

        # Execute or show error
        if [ -n "$suggested_cmd" ]; then
            echo -e "\033[1;35m→ $suggested_cmd\033[0m"
            eval "$suggested_cmd"
        else
            echo -e "\033[1;31mNo suggestion available\033[0m"
            return 127
        fi
    }

    # Preserve original handler
    if ! type command_not_found_original >/dev/null 2>&1; then
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
    fi
fi
