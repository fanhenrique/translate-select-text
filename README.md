# Translate select text

Use only isolated words or simple sentences.

> [!WARNING] 
> In texts containing commas, line breaks and periods, the translation may not work very well.

![image](https://user-images.githubusercontent.com/43625943/201484966-27ea9920-b362-4b38-9878-d3b5086e97fe.png) 

![image](https://user-images.githubusercontent.com/43625943/201485007-5e50e42b-d363-4ec9-b9cf-b37b334c1bc9.png)

## Requirements

`sudo apt install xsel curl sed mawk zenity`

## Install 

### Gnome Desktop Environment

`bash install.sh <keybord_shortcut>`

Example:

`bash install.sh '<Alt>t'`

### i3 Window Manager

Paste this line into your configuration file (`.config/i3/config`):

`bindsym --release $mod+t exec <path-to-this-repository>/translate.sh`
