#
# ~/.bash_profile
#

# Default programs
export EDITOR="vim"
export SHELL="/bin/bash"
export TERMINAL="urxvt"
export BROWSER="chromium"
export HISTFILE="$HOME/.config/bash/bash_history"
export XRESOURCES="$HOME/.config/Xresources"
export XAUTHORITY="$HOME/.config/Xauthority"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Adds `~/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Load bashrc
[[ -f "$HOME/.config/bash/bashrc" ]] && . "$HOME/.config/bash/bashrc"

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg > /dev/null && exec startx
