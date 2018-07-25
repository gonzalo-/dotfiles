PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

. /etc/ksh.kshrc

: ${HOME='/root'}
export HOME
umask 022

EDITOR='vim'
PS1="\h \u : \w> "

export BROWSER="firefox"

## Alias ##
alias ls='colorls -Galrth'
alias l='colorls -Galrth'
alias d='du -sh'
alias su='su -'
alias tmux='tmux -2'
alias updatedb='/usr/libexec/locate.updatedb'
alias pastebin="curl -F 'f:1=<-' -F 'read:1=2' ix.io"
alias ip='curl https://x61.sh/ip/ && printf "\n"'
alias chrome='chrome --proxy-server="socks://127.0.0.1:9050"'

export PATH HOME TERM EDITOR PS1 PKG_PATH
