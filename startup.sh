#!/bin/bash
PATCHES_DIR=/patches
# Execute all .sh scripts in the patches directory
if [ -d $PATCHES_DIR ]; then
    echo "Scanning for scripts in patches directory..."
    for script in /patches/patch*.sh; do
        if [ -f "$script" ]; then
            echo "Found script: $script"
            echo "Making script executable..."
            chmod +x "$script"
            echo "Executing script: $script"
            cd $PATCHES_DIR
            /bin/bash "$script" || echo "Failed to execute $script"
        fi
    done
else
    echo "Patches directory $PATCHES_DIR not found"
fi
