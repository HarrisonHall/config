# Generic setup script
# Harrison Hall

# General
sudo apt install tmux  # Terminal multiplexer
sudo apt install emacs  # Duh...
sudo apt install htop  # Top
sudo apt install gotop-cjbassi  # Nice top
sudo apt install fonts-hack-otf  # Hack font
sudo apt install fonts-hack-ttf  # Hack font

# .bashrc
if grep -q "source ~/Documents/.tmuxrc/.bashrc" ~/.bashrc
then
    echo "source ~/Documents/.tmuxrc/.bashrc" >> ~/.bashrc
fi

# Icons
#sudo add-apt-repository ppa:papirus/papirus
#sudo apt-get update
#sudo apt update
#sudo apt-get install papirus-icon-theme

# Ubuntu
#sudo apt install unity-tweak-tool

# Suckless
mkdir ~/Documents/programs
sudo apt-get install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev libwebkit2gtk-4.0-dev
if [ ! -f ~/Documents/programs/dwm ]
then
    ln -s dwm/ ~/Documents/programs/dwm/
fi
if [ ! -f ~/Documents/programs/st/ ]
then
    ln -s st/ ~/Documents/programs/st/
fi
cd dwm
make
cd ..; cd st;
make
cd ..;
sudo apt install libgcr-3-dev

# Setup config
cp -r .emacs.d ~/.
cp .tmux.conf ~/.

# Manually setup/sudo apt install:
# arc dark
# Papirus icons
# Upgrade python (3.8+)

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ ! -f ~/.tmux.conf ]; then
    ln -s .tmux.conf ~/.tmux.conf
fi


## Scripts
if [ ! -f ~/config ]
then
    ln -s ~/Documents/.tmuxrc ~/config
fi
if [ ! -f /usr/bin/screenshot ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/screenshot.sh /usr/bin/screenshot
fi
if [ ! -f /usr/bin/network ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/network.sh /usr/bin/network
fi
if [ ! -f /usr/bin/files ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/files.sh /usr/bin/files
fi
if [ ! -f /usr/bin/brightness ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/brightness.sh /usr/bin/brightness
fi
if [ ! -f /usr/bin/volume ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/volume.sh /usr/bin/volume
fi
if [ ! -f /usr/bin/sleep ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/sleep.sh /usr/bin/sleep
fi
if [ ! -f /usr/bin/suspend ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/suspend.sh /usr/bin/suspend
fi
if [ ! -f /usr/bin/colorgrab ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/colorgrab.sh /usr/bin/colorgrab
fi


if [ ! -f /usr/bin/st ]
then
    sudo ln -s ~/Documents/.tmuxrc/st/st /usr/bin/st
fi
if [ ! -f /usr/bin/dmenu ]
then
    sudo ln -s ~/Documents/.tmuxrc/dmenu/dmenu /usr/bin/dmenu
fi
if [ ! -f /usr/bin/surf ]
then
    sudo ln -s ~/Documents/.tmuxrc/surf/surf /usr/bin/surf
fi


## Other packages
sudo apt install adpi  # battery
sudo apt install scrot  # screenshots
sudo apt install ranger  # File manager
sudo apt install mdp  # markdown presentation tool
sudo apt install cmus  # terminal music player
sudo apt install pulsemixer  # audio control
sudo apt install feh  # image viewer
sudo apt install grabc  # grab a color
