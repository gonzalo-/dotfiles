# use vim if it's installed, vi otherwise
case "$(command -v vim)" in
	*/vim)  VIM=vim ;;
	*)      VIM=vi  ;;
esac

export EDITOR=$VIM
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1

# emacs mode gives you the familiar Ctrl-A, Ctrl-E, etc
set -o emacs

# use colorls if it's installed, plain old ls otherwise
if command -v colorls > /dev/null ; then
	LS='colorls'
else
	LS='ls'
fi

alias ls="$LS -FHh"
alias ll='ls -l'
alias la='ls -lA'
alias ..='cd ..'
alias ...='cd ...'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -ch'
alias su='su -'
alias tmux='tmux -2'
alias updatedb='/usr/libexec/locate.updatedb'
alias pastebin="curl -F 'pastebitch=<-' http://pastebitch.com"
alias ip='curl https://ip.x61.sh && printf "\n"'
alias tiempo='curl http://wttr.in/Buenos_Aires && printf "\n"'
