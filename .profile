#
# ~/.profile
#
# User environment paths, variables, and configurations
#umask 0022;

# Add `~/.local/bin` to $PATH if it's not already there
[ -z $(echo $PATH | grep $HOME/.local/bin) ] && export PATH="${PATH}:$HOME/.local/bin/"

# Folder location
export BASHDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
#export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"

# Password store
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# Common Xorg files
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export XRESOURCES="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xresources"
export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xauthority"

# Default programs
export BROWSER="brave"
export EDITOR="nvim"
export TERMINAL="alacritty"
#export READER="zathura"

# ALSA settings
export ALSA_CARD=Hea

# Load the shell configs
case "$SHELL" in
    *bash) [[ -f "$BASHDIR/bashrc" ]] && . "$BASHDIR/bashrc" ;;
    *zsh) [[ -f "$ZDOTDIR/zshrc" ]] && . "$ZDOTDIR/zshrc" ;;
esac

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
