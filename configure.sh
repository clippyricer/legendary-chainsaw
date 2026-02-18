#!/bin/bash

# --- 1. Define Paths ---
# This points to the "config" folder relative to where the script is run
TARGET_DIR="./config"
TARGET_FILE="$TARGET_DIR/config.cmake"

EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Hello World program"
  "Human To Dog Age|BUILD_DOG_AGE_CONVERT|Convert human years to dog years"
  "Addition|BUILD_ADD|Simple addition calculator"
  "Variable|BUILD_VAR|Print 0 without the number 0"
)

# --- 2. Ensure the directory exists ---
mkdir -p "$TARGET_DIR"

echo "Select programs"
echo "TAB = toggle one | CTRL-A = toggle all | ENTER = confirm"
echo

DISPLAY_LIST=()
for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    DISPLAY_LIST+=("$name :: $description")
done

SELECTIONS=$(printf "%s\n" "${DISPLAY_LIST[@]}" | \
    fzf --multi \
        --bind "ctrl-a:toggle-all" \
        --prompt="Executables > ")

echo
echo "Generating $TARGET_FILE..."

# --- 3. Write to the specific path ---
# Clear/Initialize the file in the config directory
> "$TARGET_FILE"

# First set all OFF
for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    echo "set($option OFF CACHE BOOL \"\" FORCE)" >> "$TARGET_FILE"
done

# Enable selected ones
while IFS= read -r selected; do
    [[ -z "$selected" ]] && continue
    selected_name="${selected%% ::*}"

    for entry in "${EXECUTABLES[@]}"; do
        IFS="|" read -r name option description <<< "$entry"
        if [[ "$selected_name" == "$name" ]]; then
            echo "set($option ON CACHE BOOL \"\" FORCE)" >> "$TARGET_FILE"
        fi
    done
done <<< "$SELECTIONS"

clear
echo "Config file successfully generated at: $TARGET_FILE"
