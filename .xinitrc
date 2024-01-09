#!/bin/sh

# set local executables 
# and scripts for use in dwmblocks
export PATH=$PATH:$HOME/.local/bin:$HOME/scripts

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# turn screen saver off
xset s off

# setup wallpaper
exec feh --no-fehbg --bg-fill ~/wallpapers/2014465.webp &

# start compositor (for transparency)
picom &

# terminal emulator
st &

# status bar
dwmblocks &

# automatic usb mount
udiskie -s &

# notifications
dunst &

# WM
exec dwm
