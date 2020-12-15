#!/bin/sh

xrdb "$HOME"/.Xresources

setxkbmap -option caps:escape
setxkbmap -option compose:rctrl

# xsetroot -cursor_name left_ptr
sxhkd -c "$HOME/.config/berry/sxhkdrc" &
~/.fehbg &
picom &

urxvtd -q -o &

# xidle -program "/home/lpy/bin/lock" -timeout 9000
exec berry
