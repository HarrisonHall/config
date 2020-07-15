#!/bin/bash
#alias emacs='emacs -nw'
alias emacs='emacsclient -a "" -t'
alias emasc='emacsclient -a "" -t'
alias x='exit'
alias c='clear'
alias d='tmux detach-client'
alias ll='ls -alh'
alias cdh='cd; cd'
alias r='ranger'
alias rofi='rofi'
alias diff='colordiff'
alias less='less --mouse --wheel-lines=3'
alias bat='bat --theme Nord'

scrollable_man () {
	man $@ | less --mouse --wheel-lines=3
}
alias man='scrollable_man'

export VISUAL="micro"
export EDITOR="$VISUAL"

export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1

eval $(dircolors ~/.dir_colors)

PS1='\[\033[34m\]\w\n\[\033[37m\]-> '
