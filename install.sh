#!/bin/bash

set -euo pipefail

INSTALL_DIR="/usr/local/bin"
TRANSLATE_FILE="$INSTALL_DIR/translate"
CONFIG_DIR="$HOME/.config/translate-selected-text"
CONFIG_FILE="$CONFIG_DIR/config"

DEPENDENCIES=(
    xsel
    curl
    jq
    zenity
)

MISSING_DEPENDENCIES=()

# Check required commands
for cmd in "${DEPENDENCIES[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        MISSING_DEPENDENCIES+=("$cmd")
    fi
done

# Instsall dependencies
if [[ ${#MISSING_DEPENDENCIES[@]} -gt 0 ]]; then
    printf 'Installing missing dependencies: %s\n' \
        "${MISSING_DEPENDENCIES[*]}"

    sudo apt update
    sudo apt install -y "${MISSING_DEPENDENCIES[@]}"
fi

# Install translation script
sudo cp translate.sh "$TRANSLATE_FILE"
sudo chmod +x "$TRANSLATE_FILE"

# Install configuration
mkdir -p "$CONFIG_DIR"
cp config "$CONFIG_FILE"

printf '\033[32mTranslation tool installed successfully.\033[0m\n'