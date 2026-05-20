#!/bin/bash

echo "  chapters:"
echo "    - index.qmd"
echo "    - syllabus.qmd"
echo "    - overview.qmd"
echo "    - links.qmd"

# Loop through each of your course material folders
for section in lectures activities homeworks assignments vignettes; do
    if [ -d "$section" ]; then
        # Capitalize the first letter for the book's "Part" title
        part_title=$(echo "$section" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')
        echo "    - part: \"$part_title\""
        echo "      chapters:"
        
        # Find all .qmd files, ignore section landing indexes, and sort them naturally
        find "$section" -name "*.qmd" | grep -v "index.qmd" | sort -V | while read -r file; do
            echo "        - $file"
        done
    fi
done
