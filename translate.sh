#!/usr/bin/bash
W=400
H=400

text="$(xsel -o)"
translate="$(curl -d "q=$(xsel -o | sed "s/[\"'<>]//g")" https://translate.googleapis.com/translate_a/single\?client\=gtx\&sl\=en\&tl\=pt\&dt\=t | sed "s/\[\{3\}\"\([^,]*\)\".*[\n]*/\1/g" | awk -F '"' 'NR==1{print $1}')"

# printf "$text\n"
# printf "$translate\n"

# echo -e "Original text:" "$text"'\n' > /tmp/notitrans
echo "$translate" > /tmp/notitrans

zenity --text-info --title="Translation of selection" --filename=/tmp/notitrans --width=$W --height=$H --editable
