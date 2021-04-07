#!/bin/bash
alias emacs='emacsclient -a "" -t'
alias emasc='emacsclient -a "" -t'
alias x='exit'
alias c='clear'
alias d='tmux detach-client'
alias ll='ls -alh'
alias cdh='cd; cd'
alias r='ranger'
alias diff='colordiff'
alias less='less --mouse --wheel-lines=3'
alias bat='bat --theme Nord'
alias o='xdg-open'
#alias discord='discord --no-sandbox'
alias testalias='echo success'

scrollable_man () {
	man $@ | less --mouse --wheel-lines=3
}
#alias man='scrollable_man'

export VISUAL="emacs"
export EDITOR="$VISUAL"

export MANPAGER="sh -c 'col -bx | bat --theme Nord -l man -p'"

export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1

eval $(dircolors ~/.dir_colors)

PS1='\[\033[34m\]\w\n\[\033[37m\]-> '

export PATH=$PATH:/opt/anaconda/bin/
export PATH=$PATH:/home/harrison/.local/bin
export PATH=$PATH:/home/harrison/dev/mivs
