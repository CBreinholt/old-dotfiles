#
# ~/.profile
#
# User environment paths, variables, and configurations

# Add `~/.local/bin` to $PATH if it's not already there
[ -z $(echo $PATH | grep $HOME/.local/bin) ] && \
    export PATH="${PATH}:$HOME/.local/bin/"

# Default programs
export BROWSER="chromium"
export EDITOR="vim"
export TERMINAL="alacritty"
export READER="zathura"

# Common Xorg files
export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/.config}/xorg/xauthority"
export XRESOURCES="${XDG_CONFIG_HOME:-$HOME/.config}/xorg/xresources"

# Other settigns
export BASHDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Load the shell configs
case "$SHELL" in
    *bash) [[ -f "$BASHDIR/bashrc" ]] && . "$BASHDIR/bashrc" ;;
    *zsh) [[ -f "$ZDOTDIR/zshrc" ]] && . "$ZDOTDIR/zshrc" ;;
esac

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
