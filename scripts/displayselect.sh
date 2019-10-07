#!/bin/sh

choices="Laptop\nTV\n4k\nManual"

chosen=$(echo -e "$choices" | dmenu -fn 'Roboto-11' -i -p "Display:")

case "$chosen" in
    Laptop) xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off && nitrogen --restore && pactl set-card-profile 0 output:analog-stereo && $HOME/.config/polybar/launch.sh ;;
    TV) xrandr --output eDP1 --off --output DP1 --off --output DP2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off && pactl set-card-profile 0 output:hdmi-stereo && $HOME/.config/polybar/launch.sh ;;
    4k) xrandr --output eDP1 --off --output DP1 --primary --mode 3840x2160 --scale .8x.8 --pos 0x0 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off && nitrogen --restore && $HOME/.config/polybar/launch.sh ;;
    Manual) arandr ;;
esac
