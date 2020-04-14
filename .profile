#
# ~/.profile
#
# User environment paths, variables, and configurations

# Add `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export BROWSER="/usr/bin/xdg-open"
export EDITOR="vim"
export TERMINAL="alacritty -e /bin/zsh"
export READER="zathura"
export SHELL="/bin/bash"

# Common Xorg files
export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/.config}/xterm/Xauthority"
export XRESOURCES="${XDG_CONFIG_HOME:-$HOME/.config}/xterm/Xresources"

# Other settigns
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Load bashrc
#[[ -f "$HOME/.config/bash/bashrc" ]] && . $HOME/.config/bash/bashrc

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
