#!/bin/bash

set -euo pipefail

W=600
H=600

TMP_FILE=$(mktemp) 

cleanup() { 
    rm -f "$TMP_FILE" 
} 

trap cleanup EXIT

# Check required commands
for cmd in xsel curl jq zenity; do 
    if ! command -v "$cmd" >/dev/null 2>&1; then 
        printf 'Error: %s is not installed.\n' "$cmd" >&2 
        exit 1 
    fi 
done

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
        --data-urlencode 'langpair=en|pt' \
        'https://api.mymemory.translated.net/get' |
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
    --title="Translation" \
    --filename="$TMP_FILE" \
    --width="$W" \
    --height="$H" \
    --font="DejaVu 14" \
    --editable