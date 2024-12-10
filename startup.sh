#!/bin/bash
# Execute all .sh scripts in the patches directory
if [ -d /patches ]; then
    echo "Scanning for scripts in patches directory..."
    for script in /patches/patch*.sh; do
        if [ -f "$script" ]; then
            echo "Found script: $script"
            echo "Making script executable..."
            chmod +x "$script"
            echo "Executing script: $script"
            /bin/bash "$script" || echo "Failed to execute $script"
        fi
    done
else
    echo "Patches directory not found"
fi
