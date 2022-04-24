#!/usr/bin/env sh
# core.sh - install core terminal utilities and link customizations
# does not assume X11 is on the system, lightweight term only
# Note: this does not include emacs

## Fit simlinks

### Bashrc
#### Add .bashrc to .bashrc
if ! grep -q "source ${CONFIG_DIR}/.config/.bashrc" ~/.bashrc
then
    echo "source ${CONFIG_DIR}/.config/.bashrc" >> ~/.bashrc
fi

#### Add path to .profile
if ! grep -q "export PATH=$PATH:${CONFIG_DIR}/scripts" ~/.profile
then
	echo "export PATH=$PATH:${CONFIG_DIR}/scripts" >> ~/.profile
fi

### Dir Colors
[ ! -f ~/.config/.dir_colors ] && ln -s ${CONFIG_DIR}/.config/.dir_colors ~/.config/.dir_colors

### Tmux
[ ! -f ~/.tmux.conf ] && ln -s ${CONFIG_DIR}/.config/.tmux.conf ~/.tmux.conf
[ ! -d ~/.tmux ] && ln -s ${CONFIG_DIR}/.config/.tmux ~/.tmux

### Ranger
[ ! -d ~/.config/ranger ] && ln -s ${CONFIG_DIR}/.config/ranger ~/.config/ranger

### Vim
[ ! -d ~/.vim ] && ln -s ${CONFIG_DIR}/.config/.vim ~/.vim
[ ! -f ~/.vimrc ] && ln -s ${CONFIG_DIR}/.config/.vimrc ~/.vimrc


## Other packages
$ins ack the_silver_searcher  # grep for code
$ins bat  # a cooler cat
$ins colordiff  # color diff viewer
$ins cronie  # cronjobs
$ins doas  # better sudo
$ins htop  # Top
$ins python-pip  # install python libraries
$ins ranger  # File manager
$ins tldr  # easy man pages
$ins tmux  # Terminal multiplexer
$ins tree  # Terminal file heirarchy viewer
$ins vim  # text editor


# enable cron jobs
sudo systemctl enable cronie
