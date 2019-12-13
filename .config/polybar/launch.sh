#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload mybar &
#done

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload mybar -c ~/.config/polybar/config.ini &
#  done
#else
#  polybar --reload mybar -c ~/.config/polybar/config.ini &
#fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mybar  -c ~/.config/polybar/config.ini &
done

# Launch bar(s)
#polybar mybar -c ~/.config/polybar/config.ini &
