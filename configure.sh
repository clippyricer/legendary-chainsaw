#!/bin/bash

# --- 1. Configuration & Paths ---
TARGET_DIR="./config"
CMAKE_FILE="$TARGET_DIR/config.cmake"
MESON_FILE="$TARGET_DIR/meson.options"

# Format: "Display Name | Internal Variable | Description"
# The script automatically converts these to lowercase for Meson.
EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Hello World program"
  "Human To Dog Age|BUILD_DOG_AGE|Convert human years to dog years"
  "Addition|BUILD_ADD|Simple addition calculator"
  "Variable|BUILD_VAR|Print A uninitlized variable"
)

# --- 2. Initialization ---
# Create the config directory if it doesn't exist
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

# Run fzf (Multi-select enabled)
SELECTIONS=$(printf "%s\n" "${DISPLAY_LIST[@]}" | \
    fzf --multi \
        --bind "ctrl-a:toggle-all" \
        --prompt="Executables > ")

# Exit if the user cancels fzf
[[ -z "$SELECTIONS" ]] && echo "No selections made. Exiting." && exit 0

echo "Generating configuration files..."

# --- 3. Generate Files ---
# Clear existing files before writing
> "$CMAKE_FILE"
> "$MESON_FILE"

for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r name option description <<< "$entry"
    
    # Create the lowercase version for Meson
    option_lc="${option,,}"
    
    # Check if this item was selected in fzf
    if echo "$SELECTIONS" | grep -q "^$name ::"; then
        # ENABLED
        echo "set($option ON CACHE BOOL \"\" FORCE)" >> "$CMAKE_FILE"
        echo "option('$option_lc', type : 'boolean', value : true, description : '$description')" >> "$MESON_FILE"
    else
        # DISABLED
        echo "set($option OFF CACHE BOOL \"\" FORCE)" >> "$CMAKE_FILE"
        echo "option('$option_lc', type : 'boolean', value : false, description : '$description')" >> "$MESON_FILE"
    fi
done

# --- 4. Finalizing ---
# Meson requires the options file in the root. This symlinks the generated file.
ln -sf "$MESON_FILE" ./meson.options

clear
echo "------------------------------------------------"
echo " Files successfully generated in $TARGET_DIR"
echo "------------------------------------------------"
echo " CMake (UPPER): config.cmake"
echo " Meson (lower): meson.options"
echo " Root Symlink : ./meson.options -> $MESON_FILE"
echo "------------------------------------------------"
