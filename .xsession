#!/bin/sh -x

cleanup() {
	pkill -9 sctd
	pkill -9 xidle
	pkill -9 lock
	rm -rf ~/TorBrowser-Data
	rm -f ~/.Xauthority
	rm -rf ~/.local/share/Trash
	chmod 700 ~
}

. $HOME/.profile

xrdb -merge $HOME/.Xresources

## DBus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

## fonts
xset -b &
xset +fp ~/.fonts
for font in /usr/local/share/fonts/*; do
	xset +fp "${font}"
	done
xset fp rehash

## Fix resolution
xrandr --dpi 96

## External Monitor
~/bin/monitores &

trap cleanup INT TERM QUIT

#xcompmgr -c &

## Keyboard
if [ X`hostname` = X"tomato" ]; then
	setxkbmap jp
else
	setxkbmap de
fi

## GPG Agent
#~/bin/gpg-agent

## LANG
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

## Browser shitz
export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
## WASM for Chromium
export ENABLE_WASM=1

## jp
## ctrl+space
## F6 & F7 hiragana <-> katakana
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx-autostart

## no bell & no blank
xset b 0 0 0
xset -dpms
xset s off
xset s noblank

## ~/bin/lock does some protections and runs slock
#xidle -timeout 90000 -ne -program ~/bin/lock &

## screen control
~/bin/sctd &

# Termbar
exec xterm -fs 12 -bg "black" -fg "grey" -name termbar -class termbar -T termbar -e ~/bin/termbar &

# Wallpaper
feh --bg-center ~/themes/blade-runner--wallpaper.jpg &

exec cwm
