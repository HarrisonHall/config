#!/usr/bin/env sh
# core.sh - install core terminal utilities and link customizations
# does not assume X11 is on the system, lightweight term only
# Note: this does not include emacs

## Fit simlinks

### Bashrc
#### Add .bashrc to .bashrc
if ! grep -q "source ~/config/.bashrc" ~/.bashrc
then
    echo "source ~/config/.bashrc" >> ~/.bashrc
fi

#### Add path to .profile
if ! grep -q "export PATH=$PATH:~/config/scripts" ~/.profile
then
	echo "export PATH=$PATH:~/config/scripts" >> ~/.profile
fi

### Dir Colors
[ ! -f ~/.dir_colors ] && ln -s ~/config/.config/.dir_colors ~/.dir_colors

### Tmux
[ ! -f ~/.tmux.conf ] && ln -s ~/config/.tmux.conf ~/.tmux.conf
[ ! -d ~/.tmux ] && ln -s ~/config/.config/.tmux ~/.tmux

### Ranger
[ ! -d ~/.config/ranger ] && ln -s ~/config/.config/ranger ~/.config/ranger

### Vim
[ ! -d ~/.vim ] && ln -s ~/config/.config/.vim ~/.vim
[ ! -f ~/.vimrc ] && ln -s ~/config/.config/.vimrc ~/.vimrc


## Other packages
$ins ack the_silver_searcher  # grep for code
$ins bat  # a cooler cat
$ins colordiff  # color diff viewer
$ins doas  # better sudo
$ins htop  # Top
$ins python-pip  # install python libraries
$ins ranger  # File manager
$ins tldr  # easy man pages
$ins tmux  # Terminal multiplexer
$ins tree  # Terminal file heirarchy viewer
$ins vim  # text editor
