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

# Status Bar
#set-option -g status-interval 1
#set-option -g status-style bg=black
#set-option -g status-style fg=white
#set -g status-left '#[fg=blue]  #H #[default]'
#set -g status-right '%a%l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d'
#set-option -g pane-active-border-style fg=yellow
#set-option -g pane-border-style fg=cyan

# Vim-like mov
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Mouse
setw -g mouse on
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
