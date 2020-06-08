#!/bin/sh

## set keyboard map
setxkbmap jp

## I need äüöß
# right alt + a + " == ä
# cuadradito 3 lineas + a + shift + 2 = ä
setxkbmap -option compose:ralt

## Load Colours
xrdb -merge $HOME/.Xresources

## UTF-8 love
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
export HIDPI=1
export GDK_SCALE=1.5
export QT_SCALE_FACTOR=1.5

## Bits for JP sites
export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"

## No bell
xset b 0 0 0

## ~/bin/lock does run xlock
xidle -timeout 300 -ne -program ~/code/lock &

## Lets get red
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
exec xterm -geometry 1920x1+0+0 -fa "mono:size=14" -fs 12 \
	-bg "black" -fg "grey" -name termbar -class termbar \
	-T termbar -e ~/code/termbar &

## Wallpaper
feh --bg-tile ~/themes/tiling-nice3.png &

exec cwm
