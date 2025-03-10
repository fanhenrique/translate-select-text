# Translate select text

Translate any selected text on your operating system. 

Use only isolated words or simple sentences.

> [!WARNING] 
> In texts containing commas, line breaks and periods, the translation may not work very well.

![image](https://user-images.githubusercontent.com/43625943/201484966-27ea9920-b362-4b38-9878-d3b5086e97fe.png) 

![image](https://user-images.githubusercontent.com/43625943/201485007-5e50e42b-d363-4ec9-b9cf-b37b334c1bc9.png)

## Requirements

`sudo apt install xsel curl sed zenity`

## Install 

### Gnome Desktop Environment

`chmod +x install.sh`

`./install.sh <keybord_shortcut>`

Example:

`./install.sh '<Alt>t'`

### i3WM

Makes the script "translate.sh" a command

`sudo cp translate.sh /usr/local/bin/translate`

`sudo chmod +x /usr/local/bin/translate`

Add this line to your configuration file (`.config/i3/config`):

`bindsym $mod+z exec --no-startup-id translate`
