#!/bin/bash

# Ensure a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

# Counter for renaming
count=1

# List all jpg images sorted naturally and rename them
for file in $(ls "$DIRECTORY"/*.jpg | sort -V); do
    new_name="$DIRECTORY/$count.jpg"
    mv "$file" "$new_name"
    echo "Renamed: $file → $new_name"
    count=$((count + 1))
done

echo "Renaming complete."

