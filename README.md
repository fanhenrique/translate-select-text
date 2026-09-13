# Translate selected text

Translate any selected text on your operating system.

## Requirements

```bash
sudo apt install xsel curl jq zenity
```

## Install 

Make  [`translate.sh`](./translate.sh) available as the `translate` command:

```bash
chmod +x ./install.sh
./install.sh
```
### i3wn

Add the following line to your i3 configuration file (`$HOME/.config/i3/config`):

```bash
bindsym $mod+z exec --no-startup-id translate
```
