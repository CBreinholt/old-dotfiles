#!/bin/sh

# xinitrc runs automatically when you run startx/xinit

# The commands to run before starting i3
xrdb "$XRESOURCES"

# Start wm
exec i3
