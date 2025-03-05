#!/bin/bash

FILE="../data.txt"

# Append a line to the file
echo "Modified by script 1" >> "$FILE"
echo "modify_1.sh: Appended a line to $FILE."
