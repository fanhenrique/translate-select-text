# Translate select text

Translate any selected text on your operating system.

## Requirements

```bash
sudo apt install xsel curl jq zenity
```

## Install 

### Gnome Desktop Environment

Make the installation script executable:

```bash
chmod +x install_gnome.sh
```

Run the installation script with the desired keyboard shortcut:

```bash
./install_gnome.sh <keybord_shortcut>
```

Example:

```bash
./install_gnome.sh '<Alt>t'
```

### i3WM

Make  [`translate.sh`](./translate.sh) available as the `translate` command:

```bash
./install.sh`
```

Add the following line to your i3 configuration file (`$HOME/.config/i3/config`):

```bash
bindsym $mod+z exec --no-startup-id translate
```
