#!/bin/bash

findStatusFile=$(mktemp -t tmp.XXXXXXXXXX)

for dir in */ ; do
  if [[ "$dir" == "website_generator/" ]] || [[ "$dir" =~ ^\..* ]]; then
    break
  fi
  echo Checking: "$dir"
  find "$dir" -type f -not -name "POSEIDON.yml" -exec bash -c '
      searchFile=$(basename "$1")
      if ! grep -Fq $searchFile "$2POSEIDON.yml"; then
         echo Not properly referenced in POSEIDON.yml file: "$1" \(searched in "$2POSEIDON.yml"\) >> "$3"
      fi
    ' -- {} "$dir" "$findStatusFile" \;
done

echo ""
if [ -s "$findStatusFile" ]; then
  echo One or multiple issues detected:
  cat "$findStatusFile"
  exit 1  
else
  echo Everything looks alright.
  exit 0
fi
rm -f "$findStatusFile"


