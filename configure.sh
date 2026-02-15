#!/bin/bash

EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Hello World program"
  "Human To Dog Age|BUILD_DOG_AGE_CONVERT|Convert human years to dog years"
)

echo "Select programs"
echo "TAB = toggle one | CTRL-A = toggle all | ENTER = confirm"
echo

# Build display list
DISPLAY_LIST=()

for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    DISPLAY_LIST+=("$name :: $description")
done

# fzf with multi-select and Ctrl-A toggle all
SELECTIONS=$(printf "%s\n" "${DISPLAY_LIST[@]}" | \
    fzf --multi \
        --bind "ctrl-a:toggle-all" \
        --prompt="Executables > ")

echo
echo "Generating config.cmake..."

# Clear config file
> config.cmake

# First set all OFF
for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    echo "set($option OFF CACHE BOOL \"\" FORCE)" >> config.cmake
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
echo "Config file succsesfully generated."

