# Terminal settings

1. tmux
2. nnn

------------
# Tmux

- Using [Tmux sensible](https://github.com/tmux-plugins/tmux-sensible)

## Default settings

In ~/.config/tmux/tmux.conf:

```sh
set -s escape-time 0
```

Then run:
```sh
tmux source-file ~/.config/tmux/tmux.conf
```

# NNN

- Plugins in /nnn/*

## Preview plugin
```sh
export NNN_FIFO=/tmp/nnn.fifo;
export NNN_PLUG='P:preview-tui';
```

Copy preview-tui to `~/.config/nnn/plugins/`
