#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
# xinitrc runs automatically when you run startx/xinit

# The commands to run before starting i3
setxkbmap -option caps:swapescape
xrdb $XRESOURCES
#cache-sync &

# Start wm
exec i3
