#!/bin/bash

FILE="$SCALR_HOOK_DIR/data.txt"

# Append a line to the file
echo "Modified by script 1" >> "$FILE"
echo "modify_1.sh: Appended a line to $FILE."
