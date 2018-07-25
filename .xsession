#!/bin/sh

export LANG=en_US.UTF-8
xrandr --dpi 160
xrdb < ~/.Xdefaults

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `/usr/bin/ssh-agent`
fi

for m in `ls /usr/local/share/fonts/`; do
	if [ -d "/usr/local/share/fonts/$m" ]; then
		xset fp+ "/usr/local/share/fonts/$m"
	fi
done

xset -b
~/code/lock &
~/code/sctd &

conky &

feh --bg-scale ~/themes/OpenBSD-Carbon-Fiber.png &

cwm
