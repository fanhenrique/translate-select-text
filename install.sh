#!/bin/bash

set -euo pipefail

# Check required commands
for cmd in xsel curl jq zenity; do 
    if ! command -v "$cmd" >/dev/null 2>&1; then 
        printf 'Error: %s is not installed.\n' "$cmd" >&2 
        exit 1 
    fi 
done

INSTALL_DIR="/usr/local/bin"

sudo cp translate.sh "$INSTALL_DIR/translate"
sudo chmod +x "$INSTALL_DIR/translate"

mkdir -p "$HOME/.config/translate-select-text"
cp config "$HOME/.config/translate-select-text/config"
