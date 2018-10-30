PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

. /etc/ksh.kshrc

: ${HOME='/root'}
export HOME
umask 022

PS1="\[\e[37;1m\][\u@\[\e[0;35;1m\]\h][\w]\[\e[0m\] "
case `id -u` in
	0) PS1="${PS1}\e[1;37;1m#\[\e[0m\] ";;
	*) PS1="${PS1}\e[1;37;1m$\[\e[0m\] ";;
esac

export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
	ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

export BROWSER="firefox"
export LANG="en_US.UTF-8"

## Alias ##
alias ls='colorls -Galrth'
alias l='colorls -Galrth'
alias d='du -sh'
alias su='su -'
alias tmux='tmux -2'
alias updatedb='/usr/libexec/locate.updatedb'
alias pastebin="curl -F 'pastebitch=<-' http://pastebitch.com"
alias ip='curl https://ip.x61.sh && printf "\n"'
alias tiempo='curl http://wttr.in/Berlin && printf "\n"'

export PATH HOME TERM EDITOR PS1 PKG_PATH
