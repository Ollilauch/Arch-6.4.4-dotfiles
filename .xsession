#!/bin/sh

feh --no-fehbg --bg-fill ~/wallpapers/2014465.webp &
xset s off -dpms &
exec picom &
conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm 
