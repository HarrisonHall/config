alias ins='sudo apt install'
alias emacs='emacs -nw'
alias emasc='emacs -nw'
alias st='~/Documents/programs/st/st'
alias x='exit'
alias d='tmux detach-client'
alias screenshot='scrot -s /tmp/tmp.png; xclip -selection clipboard -t image/png -i /tmp/tmp.png'

#if [ "$color_prompt" = yes ]; then
##    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

PS1='\w\n-> '
