#!/usr/bin/env bash

# Vytvoření nového souboru new.md
> new.md

while IFS= read -r line; do
  if [[ $line == "- ["* ]] && [[ $line == *") "* ]]; then
    # Extrakce názvu repozitáře
    REPO=$(echo "${line}" | grep -oP '\[\K[^]]+')
    # Extrakce textu za "- "
    LINE=$(echo "${line}" | cut -d' ' -f2-)
    # Přidání badge pro počet hvězdiček
    echo "- ![Stars](https://img.shields.io/github/stars/${REPO}?label=%E2%AD%90&style=for-the-badge) ${LINE}" >> new.md
  else
    # Přidání řádku beze změny
    echo "${line}" >> new.md
  fi
done < README.md

# Přesun nového souboru zpět na README.md
mv new.md README.md
