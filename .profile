PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

: ${HOME='/root'}
export HOME
umask 022

export SSH_AUTH_SOCK=/tmp/ssh-agent.$LOGNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
	ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

export ENV=$HOME/.kshrc
export PATH HOME TERM EDITOR PS1 PKG_PATH

