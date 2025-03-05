#!/bin/bash

# Define file path
FILE="data.txt"

# Ensure the scripts directory exists
SCRIPTS_DIR="$SCALR_HOOK_DIR/scripts"

# Create the data file
echo "Initial content of the file" > "$FILE"
echo "Created $FILE with initial content."

# Make scripts executable
chmod +x "$SCRIPTS_DIR"/*.sh

# Execute all scripts inside scripts/ directory
for script in "$SCRIPTS_DIR"/*.sh; do
    echo "Running $script..."
    bash "$script"
done

echo "Final content of $FILE:"
cat "$FILE"
