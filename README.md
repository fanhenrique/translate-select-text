# Translate select text

Translate any selected text on your operating system.

## Requirements

`sudo apt install xsel curl jq zenity`

## Install 

### Gnome Desktop Environment

Make the installation script executable:

`chmod +x install.sh`

Run the installation script with the desired keyboard shortcut:

`./install.sh <keybord_shortcut>`

Example:

`./install.sh '<Alt>t'`

### i3WM

Make  [`translate.sh`](./translate.sh) available as the `translate` command:

`sudo cp translate.sh /usr/local/bin/translate`

`sudo chmod +x /usr/local/bin/translate`

Add the following line to your i3 configuration file (`$HOME/.config/i3/config`):

`bindsym $mod+z exec --no-startup-id translate`
