#!/bin/sh

export LANG=en_US.UTF-8
export GDK_DPI_SCALE=1.5
export MOZ_ACCELERATED=1

xrandr --dpi 96
xrdb < ~/.Xdefaults

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

for m in `ls /usr/local/share/fonts/`; do
	if [ -d "/usr/local/share/fonts/$m" ]; then
		xset fp+ "/usr/local/share/fonts/$m"
	fi
done

eval `ssh-agent -s`

xset -b

$HOME/code/lock &
$HOME/code/sctd &

conky &

feh --bg-scale $HOME/themes/wallpaper-1615904.jpg &

cwm
