#!/bin/sh

## SETUP for Matebook

setxkbmap de

export LANG=en_US.UTF-8
export MOZ_USE_XINPUT2=1
export HIDPI=1
export GDK_SCALE=1.8
export QT_SCALE_FACTOR=1.8

#xrandr --dpi 120
xrdb < ~/.Xdefaults

eval `dbus-launch --sh-syntax`

xset b 0 0 0
xset r rate 350 35
xset m 3/1 4

# ~/bin/lock does some protections and runs slock
xidle -timeout 300 -ne -program ~/code/lock &

~/code/sctd &

eval `ssh-agent -s`

conky &

feh --bg-tile ~/themes/tiling-nice3.png &
#feh --bg-scale ~/themes/OpenBSD-Carbon-Fiber.png &

exec cwm
