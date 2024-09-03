#!/bin/bash

# Check if a file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_commands>"
    exit 1
fi

# Read the file and execute each command
while IFS= read -r line
do
    echo "Executing: $line"
    eval "$line"
    if [ $? -ne 0 ]; then
        echo "Error executing command: $line"
    fi
done < "$1"

echo "All commands executed."
