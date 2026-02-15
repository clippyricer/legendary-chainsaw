#/bin/bash

EXECUTABLES=(
  "Hello World|BUILD_HELLO_WORLD|Build Hello World executable"
)


DIALOG_ARGS=()


for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r id option description <<< "$entry"
    DIALOG_ARGS+=("$id" "$description" "off")
done


dialog --title "Select Executables to Build" \
       --checklist "Choose executables:" 20 60 10 \
       "${DIALOG_ARGS[@]}" 2> choices.txt


SELECTIONS=$(cat choices.txt)
rm choices.txt


echo "Generating config.cmake"


cat <<EOL > config.cmake
EOL


for entry in "${EXECUTABLES[@]}"; do
    IFS="|" read -r id option description <<< "$entry"
    echo "set($option OFF CACHE BOOL \"\" FORCE)" >> config.cmake
done


for selected in $SELECTIONS; do
    for entry in "${EXECUTABLES[@]}"; do
        IFS="|" read -r id option description <<< "$entry"
        if [ "$selected" == "\"$id\"" ] || [ "$selected" == "$id" ]; then
            echo "set($option ON CACHE BOOL \"\" FORCE)" >> config.cmake
        fi
    done
done


clear

echo "Config file generated."
