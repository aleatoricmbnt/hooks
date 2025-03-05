#!/bin/bash

FILE="../data.txt"

# Replace a word in the file
sed -i 's/Initial/Updated/g' "$FILE"
echo "modify_2.sh: Replaced 'Initial' with 'Updated' in $FILE."
