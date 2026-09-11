#!/bin/bash

W=600
H=600

text="$(xsel -o)"

translate="$(
    curl -sG 'https://api.mymemory.translated.net/get' \
        --data-urlencode "q=$text" \
        --data-urlencode 'langpair=en|pt' |
    jq -r '.responseData.translatedText'
)"

printf '%s\n' "$translate" > /tmp/notitrans

zenity --text-info \
    --title="Translation" \
    --filename=/tmp/notitrans \
    --width="$W" \
    --height="$H" \
    --font="DejaVu 14" \
    --editable