#!/bin/bash

EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Build Hello World executable"
)

echo "Select executables (TAB to mark, ENTER to confirm)"
echo

# Build display list
DISPLAY_LIST=()

for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    DISPLAY_LIST+=("$name :: $description")
done

# Run fzf multi-select
SELECTIONS=$(printf "%s\n" "${DISPLAY_LIST[@]}" | fzf --multi --prompt="Executables > ")

echo
echo "Generating config.cmake..."

# Clear config file
> config.cmake

# First set all OFF
for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    echo "set($option ON CACHE BOOL \"\" FORCE)" >> config.cmake
done

# Enable selected ones
while IFS= read -r selected; do
    selected_name="${selected%% ::*}"

    for entry in "${EXECUTABLES[@]}"; do
        IFS="|" read -r name option description <<< "$entry"
        if [[ "$selected_name" == "$name" ]]; then
            echo "set($option ON CACHE BOOL \"\" FORCE)" >> config.cmake
        fi
    done
done <<< "$SELECTIONS"

clear
echo "Config file generated."

