#!/bin/bash

# function to check if a file is UTF-8 encoded
is_utf8_encoded() {
  if iconv -f utf8 "$1" -t utf8 -o /dev/null 2>/dev/null; then
    return 0
  else
    return 1
  fi
}

# function to check if a file has Unix line endings (LF)
has_unix_line_endings() {
  if [[ $(file "$1") == *CR* ]]; then
    return 1
  else
    return 0
  fi
}

# file extensions to search for
extensions=("yml" "bib" "janno" "ssf" "txt" "md" "fam" "ind")

# initialize exit code
exit_code=0

# recursive search for files and check encoding and line endings
for ext in "${extensions[@]}"; do
  while IFS= read -r -d '' file; do
    if ! is_utf8_encoded "$file" || ! has_unix_line_endings "$file"; then
      echo "FAIL: $file"
      exit_code=1
    fi
  done < <(find . -type f -name "*.$ext" -not -path "./.git*" -print0)
done

exit $exit_code
