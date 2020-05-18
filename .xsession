#!/bin/sh

## set keyboard map
setxkbmap jp

## utf-8 love
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

## bits for JP websites
export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"

## load the colours
xrdb < ~/.Xdefaults

## ~/bin/lock does run xlock
xidle -timeout 300 -ne -program ~/code/lock &

## lets get red
~/code/sctd &

## just-in-case
rm -rf ~/TorBrowser-Data

## turn on ssh-agent
eval `ssh-agent -s`

## DBus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

## Termbar
xterm -geometry 320x1+0+0 -fa "mono:size=14" -bg "black" \
	-fg grey -fs 11 -name termbar -class termbar \
	-T termbar -e ~/code/termbar &

## Wallpaper
feh --bg-tile ~/themes/tiling-nice3.png &

exec cwm
