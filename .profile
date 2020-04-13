#
# ~/.bash_profile
#

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export EDITOR="vim"
export BROWSER="chromium"
export TERMINAL="alacritty"
export SHELL="/bin/bash"
export HISTFILE="$HOME/.config/bash/bash_history"
export XAUTHORITY="${XDG_RUNTIME_DIR:-"$HOME/.config"}/Xauthority"
export XMODMAP="$HOME/.config/xterm/Xmodmap"
export XRESOURCES="$HOME/.config/xterm/Xresources"

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Clean-up
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"

# Other program settings
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# Load bashrc
[[ -f "$HOME/.config/bash/bashrc" ]] && . "$HOME/.config/bash/bashrc"
