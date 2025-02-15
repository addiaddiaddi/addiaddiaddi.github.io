#!/bin/bash

# Ensure a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

# Convert all .HEIC files in the directory to .jpg
for file in "$DIRECTORY"/*.HEIC "$DIRECTORY"/*.heic; do
    if [ -f "$file" ]; then
        jpg_file="${file%.*}.jpg"
        heif-convert "$file" "$jpg_file"
        if [ $? -eq 0 ]; then
            rm "$file"
            echo "Converted and deleted: $file"
        else
            echo "Failed to convert: $file"
        fi
    fi
done

echo "Conversion complete."

