#!/bin/bash
# A file for running the executables in the docker container
clear

BIN_DIR="./bin"

if [ ! -d "$BIN_DIR" ]; then
    echo "Bin directory not found?"
    exit 1
fi

BINARIES=($(ls "$BIN_DIR"))

if [ ${#BINARIES[@]} -eq 0 ]; then
    echo "No binaries found in bin/?"
    exit 1
fi

echo "Select binary to run:"
echo

SELECTED=$(printf "%s\n" "${BINARIES[@]}" | \
    fzf --prompt="Run > " --height=40%)

if [ -z "$SELECTED" ]; then
    echo "No selection."
    exit 0
fi

echo
echo "Running $SELECTED..."
echo
sleep 1
clear

exec "$BIN_DIR/$SELECTED"

