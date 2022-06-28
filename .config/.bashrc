#!/bin/bash

# Custom aliases
command -v ag &> /dev/null && alias ack="ag"
alias anki="ANKI_NOHIGHDPI=1 anki"
alias bat='bat --theme Nord --number'
alias c='clear'
alias cdtest="mkdir -p /tmp/test && cd /tmp/test"
alias d='tmux detach-client'
alias dd="dd status=progress"
alias diff='colordiff'
alias emacs='emacsclient -a "" -t'
alias emasc='emacsclient -a "" -t'
alias gitfetch='onefetch'
alias less='less --mouse --wheel-lines=3'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alh'
alias o='xdg-open'
alias pacman='pacman --color=always'
alias r='ranger'
#alias sudoemacs='sudo emacs -nw -q -l "/${HOME}/.emacs.d/init.el"'
alias tbash='tmux set-option -g default-command /usr/bin/bash'
alias tzsh='tmux set-option -g default-command /usr/bin/zsh'
alias x='exit'
alias yay='yay --color=always'

# Environmental variables
export COLORTERM="truecolor"
export EDITOR="$VISUAL"
export HISTSIZE=10000
export HISTFILESIZE=10000
export MANPAGER="sh -c 'col -bx | bat --theme Nord -l man -p'"
export VISUAL="emacs"
## Extra environmental variables
export _JAVA_AWT_WM_NONREPARENTING=1

# Set up directory colors
eval $(dircolors ~/.config/.dir_colors)

# Set up prompt
PS1='\[\033[34m\]\w\n\[\033[37m\]-> '

# Set up path for executing scripts
export PATH=$PATH:/opt/anaconda/bin/
export PATH=$PATH:/home/harrison/.local/bin
export PATH=$PATH:/home/harrison/dev/one-offs/mivs
export PATH=$PATH:/home/harrison/config/scripts
export PATH=$PATH:/home/harrison/config/scripts/cli-utils/src
