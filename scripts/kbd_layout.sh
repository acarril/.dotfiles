#!/bin/bash
# Simple script to toggle between US standard and US international, with notifications
# Switch keyboard layout:
(setxkbmap -query | grep -q "variant:\s\+intl") && setxkbmap -layout us || setxkbmap -layout us -variant intl
# Notify current layout:
# setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}' | while read OUTPUT; do notify-send "Keyboard Layout: $OUTPUT"; done
