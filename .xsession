#!/bin/sh

feh --no-fehbg --bg-fill ~/wallpapers/2014465.webp &
xset s off -dpms &
exec picom &
exec i3 
