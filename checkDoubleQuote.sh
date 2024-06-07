#!/bin/bash

# function to check if a file starts with a double-quote
starts_with_quote() {
  if grep -q '^"' "$1"; then
    return 0
  else
    return 1
  fi
}

# file extensions to search for
extensions=("janno" "ssf")

# initialize exit code
exit_code=0

# recursive search for files and check them
for ext in "${extensions[@]}"; do
  while IFS= read -r -d '' file; do
    if starts_with_quote "$file"; then
      echo "FAIL: $file"
      exit_code=1
    fi
  done < <(find . -type f -name "*.$ext" -not -path "./.git*" -print0)
done

exit $exit_code
