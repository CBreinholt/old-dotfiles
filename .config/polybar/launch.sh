#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch main status bar
polybar -r -c ~/.config/polybar/config-onedark.ini main &
#polybar -r -c ~/.config/polybar/config.ini main &
#polybar -r -c ~/.config/polybar/config.ini dual &
