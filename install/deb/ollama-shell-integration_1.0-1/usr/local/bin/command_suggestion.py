#!/usr/bin/env /usr/local/share/ollama-shell/venv/bin/python3
import ollama, re, platform, sys
from pathlib import Path

def main():
    try:
        OS_INFO = f"{platform.system()} {platform.release()}"
        CURRENT_DIR = Path.cwd()
        user_input = ' '.join(sys.argv[1:])

        # Special cases for common commands
        if user_input.lower() in ['list files', 'ls', 'la']:
            print("ls")
            return
        elif user_input.lower().startswith('new folder'):
            folder_name = user_input[10:].strip()
            print(f"mkdir '{folder_name}'")
            return
        elif user_input.lower().startswith(('remove ', 'rm ', 'delete ')):
            target = user_input.split(' ', 1)[1].strip()
            print(f"rm -rf '{target}'")
            return

        response = ollama.generate(
            model="llama3",
            prompt=f"""User is on {OS_INFO} in {CURRENT_DIR}. Convert to exact Linux command:
                    "{user_input}"
                    - Output ONLY the command between backticks
                    - No explanations
                    - Example: "list files" → `ls`
                    - Example: "new folder test" → `mkdir test`
                    - Example: "remove folder" → `rm -rf folder`
                    Command:`"""
        )['response']

        match = re.search(r'`([^`]+)`', response)
        if match:
            print(match.group(1))
        else:
            print("")
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
