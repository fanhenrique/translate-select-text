#!/bin/bash

set -euo pipefail

CONFIG_FILE="$HOME/.config/translate-select-text/config"

if [[ ! -f "$CONFIG_FILE" ]]; then 
    printf 'Error: configuration file not found: %s\n' "$CONFIG_FILE" >&2 
    exit 1 
fi

# Load configuration 
source "$CONFIG_FILE"

TMP_FILE=$(mktemp) 

cleanup() { 
    rm -f "$TMP_FILE" 
} 

trap cleanup EXIT

# Get selected text
text="$(xsel -o 2>/dev/null || true)"

if [[ -z "$text" ]]; then 
    zenity --error \
        --title="Translation" \
        --text="No text selected." 
    exit 1
fi

# Translate selected text
translate="$(
    curl --silent --show-error --fail --get \
        --data-urlencode "q=$text" \
        --data-urlencode "langpair=${SOURCE_LANG}|${TARGET_LANG}" \
        "$API_URL" |
    jq -r '.responseData.translatedText'
)"

if [[ -z "$translate" || "$translate" == "null" ]]; then 
    zenity --error \ 
        --title="Translation" \ 
        --text="Translation failed." 
    exit 1 
fi

printf '%s\n' "$translate" > "$TMP_FILE"

# Show translation
zenity --text-info \
    --title="$TITLE" \
    --filename="$TMP_FILE" \
    --width="$WINDOW_WIDTH" \
    --height="$WINDOW_HEIGHT" \
    --font="$FONT_FAMILY $FONT_SIZE" \
    --editable