# I3 Configure files worth using

 - i3 config file is in: `~/.config/i3/config`
 - i3blocks config is in: `~/.config/i3blocks/config`
 - i3status config is in: `~/.config/i3status/config`

## Dependencies

1. i3
1. i3lock
1. i3status-manjaro | i3status | [i3bocks](https://github.com/vivien/i3blocks)
1. gnome-keyring-daemon, or kwallet5 (In case using KDE's stuff)
1. playerctl, pulseaudio and pactl (pacmd)
2. `nitrogen` wallpaper manager
3. `maim` as PrintScreen
1. [Dex](https://github.com/jceb/dex)
1. Picom, for better XComposite
  1. GLX, `Picom` uses glx as backend
1. dmenu, menu that uses .desktop files
1. rofi, a window swicher and drun menu
2. `xdotool` automation tool for mouse operations

## For i3blocks (As sub to i3status)

Set $SCRIPT_DIR on .profile | .bashrc | .zshrc to where all the scripts will be installed... (Usually `export $SCRIPT_DIR=$HOME/.config/i3blocks/scripts`).

1. sysstat
2. perl

## Applications

1. Thunar
    1. tumbler -> Package to create thumbnails
    2. gvfs -> External devices and Trash

### gnome-keyring-daemon
This is used to work as a keywords store and secure to browsers (such as google chrome `google-chrome-stable --password-store=gnome` or `google-chrome-stable --password-store=kwallet5`) and to add ssh keys.

## TODO

1. Seguir esse [tutorial](https://github.com/addy-dclxvi/i3-starterpack/tree/master).
2. [Salvar Layout](https://i3wm.org/docs/layout-saving.html)
