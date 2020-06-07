alias emacs='emacs -nw'
alias emasc='emacs -nw'
alias x='exit'
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

export PATH=$PATH:~/config/scripts

PS1='\[\033[34m\]\w\n\[\033[37m\]-> '
