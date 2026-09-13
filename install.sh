#!/bin/bash

set -euo pipefail

INSTALL_DIR="/usr/local/bin"
TRANSLATE_FILE="$INSTALL_DIR/translate"
CONFIG_DIR="$HOME/.config/translate-selected-text"
CONFIG_FILE="$CONFIG_DIR/config"

# Check required commands
for cmd in xsel curl jq zenity; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        printf 'Error: %s is not installed.\n' "$cmd" >&2
        exit 1
    fi
done

INSTALL_DIR="/usr/local/bin"

# Install translation script
sudo cp translate.sh "$TRANSLATE_FILE"
sudo chmod +x "$TRANSLATE_FILE"

# Install configuration
mkdir -p "$CONFIG_DIR"
cp config "$CONFIG_FILE"

printf 'Translation tool installed successfully.\n'