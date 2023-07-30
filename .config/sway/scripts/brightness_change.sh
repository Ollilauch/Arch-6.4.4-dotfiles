#!/usr/bin/zsh

argc=$#

cd /sys/class/backlight/intel_backlight/

read max < max_brightness
read cur < brightness

op=$argv[1]

new_cur=$[$cur$op$max/35]

if [[ $argc -lt 1 ]] then
    printf "usage: + or -\n"
else
    if [[ $new_cur -ge $max ]] || [[ $new_cur -le 0 ]] then
        echo $((($max * ($new_cur >= $max)) + ($new_cur * ($new_cur <= 0)))) > brightness 2>/dev/null
    else
        echo $new_cur > brightness 2>/dev/null
    fi
fi
