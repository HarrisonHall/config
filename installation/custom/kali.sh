#!/bin/bash

# Install minimal setup on kali linux

sudo apt install emacs-nox

wget https://dl.discordapp.net/apps/linux/0.0.14/discord-0.0.14.deb
sudo dpkg -i discord*


## Link configs
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

## emacs
[ ! -f ~/.emacs.d ] && ln -s ~/config/.emacs.d ~/.emacs.d

