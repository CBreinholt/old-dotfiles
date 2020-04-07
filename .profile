#
# ~/.bash_profile
#

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export EDITOR="vim"
export SHELL="/bin/bash"
export TERMINAL="urxvt"
export BROWSER="chromium"
export HISTFILE="$HOME/.config/bash/bash_history"
export XRESOURCES="$HOME/.config/Xresources"
export XAUTHORITY="$HOME/.config/Xauthority"

# XDG variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/$UID"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
if [ -e "$XDG_CONFIG_HOME/user-dirs.dirs" ]; then
    source "$XDG_CONFIG_HOME/user-dirs.dirs"
    for f in ${!XDG_*}; do
        if [[ $f =~ ^XDG_[_[:alnum:]]+_DIR$ ]]; then
            export "$f"
        fi
    done
fi

# Load bashrc
[[ -f "$HOME/.config/bash/bashrc" ]] && . "$HOME/.config/bash/bashrc"

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg > /dev/null && exec startx
