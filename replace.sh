#!/usr/bin/env bash

# Ensure we have correct number of parameters
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 'from_line' 'to_line' file"
    exit 1
fi

from_line="$1"
to_line="$2"
file="$3"

if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Create a backup of the original file
cp "$file" "$file.bak"
# Clear the original file
> "$file"

changed_count=0

echo "Debug: from_line is '$from_line'"
echo "Debug: to_line is '$to_line'"

while IFS= read -r line; do
    # Trim whitespace from the current line
   # trimmed_line="$(echo "$line" | xargs)"
    trimmed_line="$(echo "$line" | awk '{$1=$1;print}')"

    # Compare trimmed line with from_line
    if [ "$trimmed_line" = "$from_line" ]; then
        echo "$to_line" >> "$file"
        changed_count=$((changed_count + 1))
    else
        echo "$line" >> "$file"
    fi
done < "$file.bak"


echo "Number of lines changed: $changed_count"

