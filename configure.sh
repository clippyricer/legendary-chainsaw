#!/bin/bash

# --- 1. Configuration & Paths ---
TARGET_DIR="./config"
CMAKE_FILE="$TARGET_DIR/config.cmake"
MESON_FILE="$TARGET_DIR/meson.options"

# Format: "Display Name | Internal Variable | Description"
EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Hello World program"
  "Human To Dog Age|BUILD_DOG_AGE|Convert human years to dog years"
  "Addition|BUILD_ADD|Simple addition calculator"
  "Variable|BUILD_VAR|Print 0 without the number 0"
)

# --- 2. Initialization ---
mkdir -p "$TARGET_DIR"

echo "Select programs to include in the build"
echo "TAB = toggle one | CTRL-A = toggle all | ENTER = confirm"
echo

# Prepare the list for fzf
DISPLAY_LIST=()
for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    DISPLAY_LIST+=("$name :: $description")
done

# Run fzf
SELECTIONS=$(printf "%s\n" "${DISPLAY_LIST[@]}" | \
    fzf --multi \
        --bind "ctrl-a:toggle-all" \
        --prompt="Executables > ")

# Exit if nothing was selected (or ESC was pressed)
[[ -z "$SELECTIONS" ]] && echo "No selections made. Exiting." && exit 0

echo "Generating configuration files..."

# --- 3. Generate Files ---
# Clear existing files
> "$CMAKE_FILE"
> "$MESON_FILE"

for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    
    # Check if this item was selected in fzf
    if echo "$SELECTIONS" | grep -q "^$name ::"; then
        # ENABLED
        echo "set($option ON CACHE BOOL \"\" FORCE)" >> "$CMAKE_FILE"
        echo "option('$option', type : 'boolean', value : true, description : '$description')" >> "$MESON_FILE"
    else
        # DISABLED
        echo "set($option OFF CACHE BOOL \"\" FORCE)" >> "$CMAKE_FILE"
        echo "option('$option', type : 'boolean', value : false, description : '$description')" >> "$MESON_FILE"
    fi
done

ln -sf "$MESON_FILE" ./meson.options

clear
echo "----------------------------------------"
echo "Files successfully generated in $TARGET_DIR"
echo "1. CMake: $(basename "$CMAKE_FILE")"
echo "2. Meson: $(basename "$MESON_FILE")"
echo "----------------------------------------"
