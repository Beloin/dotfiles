# I3 Configure files worth using

 - i3 config file is in: `~/.config/i3/config`
 - i3blocks config is in: `~/.config/i3blocks/config`
 - i3status config is in: `~/.config/i3status/config`

## Dependencies

1. i3
1. i3lock | i3lock-fancy-multimonitor
1. i3status-manjaro | i3status | [i3bocks](https://github.com/vivien/i3blocks)
1. gnome-keyring-daemon, or kwallet5 (In case using KDE's stuff)
2. `lxpolkit` to start security agent
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

1. Set $SCRIPT_DIR on .profile | .bashrc | .zshrc to where all the scripts will be installed... (Usually `export $SCRIPT_DIR=$HOME/.config/i3blocks/scripts`).
2. Set `for_window [class="Yad"] floating enable`
3. Set `set $refresh_i3status pkill -RTMIN+1 i3blocks` to replace: `set $refresh_i3status killall -SIGUSR1 i3status`
4. Set `status_command i3blocks`


### Dependencies
1. sysstat
2. perl
3. yad
4. pactl

## Bluetooth

1. `sudo apt install blueman bluez`

## For better interface:

Instruction from [here](https://www.reddit.com/r/i3wm/comments/7cicm0/what_do_i_need_to_do_exactly_to_make_i3_look_good/).

1. `lxappearance` and `arc-theme`
2. `i3-themes` to fast help this

## When using [i3-themes](https://github.com/Kthulu120/i3wm-themes)

### Deps:

1. [Polybar](https://github.com/polybar/polybar)

## Applications

1. Thunar
    1. tumbler -> Package to create thumbnails
    2. gvfs -> External devices and Trash

### gnome-keyring-daemon
This is used to work as a keywords store and secure to browsers (such as google chrome `google-chrome-stable --password-store=gnome` or `google-chrome-stable --password-store=kwallet5`) and to add ssh keys.

### Or Lxpookit

- Download `sudo apt install lxpokit`
- Add it to i3config `exec --no-startup-id lxpolkit`

## TODO

1. Seguir esse [tutorial](https://github.com/addy-dclxvi/i3-starterpack/tree/master).
2. [Salvar Layout](https://i3wm.org/docs/layout-saving.html)
3. Add I3Gaps
4. ~Add polybar instead of i3blocks~ (i3 blocks is better
