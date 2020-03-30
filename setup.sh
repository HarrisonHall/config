# Generic setup script
# Harrison Hall

# General, but almost mandatory
sudo apt install tmux  # Terminal multiplexer
sudo apt install emacs  # Duh...
sudo apt install htop  # Topp
sudo apt install gotop-cjbassi  # Nice top
sudo apt install fonts-hack-otf  # Hack font
sudo apt install fonts-hack-ttf  # Hack font

# .bashrc
if ! grep -q "source ~/Documents/.tmuxrc/.bashrc" ~/.bashrc
then
    echo "source ~/Documents/.tmuxrc/.bashrc" >> ~/.bashrc
fi

# Icons
#sudo add-apt-repository ppa:papirus/papirus
#sudo apt-get update
#sudo apt update
#sudo apt-get install papirus-icon-theme


# Custom
mkdir ~/Documents/programs
sudo apt-get install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev libwebkit2gtk-4.0-dev libgcr-3-dev
if [ ! -f ~/Documents/programs/dwm ]
then
    ln -s dwm/ ~/Documents/programs/dwm/
fi
if [ ! -f ~/Documents/programs/st/ ]
then
    ln -s st/ ~/Documents/programs/st/
fi
cd dwm; make; cd ..;
cd st; make; cd ..;
cd slock; make; cd ..;
cd surf; make; cd ..;
cd tabbed; make; cd ..;
cd dmenu; make; cd ..;
cd dunst; make; cd ..;


# cava
#apt-get install libfftw3-dev libasound2-dev libncursesw5-dev
#libpulse-dev libtool automake libportaudio2
#cd cava;
#./autogen.sh
#./configure
#make


# Setup config
if [ ! -d ~/.emacs.d ]
then
    cp -r .emacs.d ~/.
fi
if [ ! -f ~/.tmux.conf ]
then
    cp .tmux.conf ~/.
fi


# Tmux
if [ ! -f ~/.tmux/plugins/tpm ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


## Scripts
if [ ! -d ~/config ]
then
    ln -s ~/Documents/.tmuxrc ~/config
    echo "here?"
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
if [ ! -f /usr/bin/sleepy ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/sleepy.sh /usr/bin/sleepy
fi
if [ ! -f /usr/bin/suspend ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/suspend.sh /usr/bin/suspend
fi
if [ ! -f /usr/bin/colorgrab ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/colorgrab.sh /usr/bin/colorgrab
fi
if [ ! -f /usr/bin/cava ]
then
    sudo ln -s ~/Documents/.tmuxrc/cava/cava /usr/bin/cava
fi
if [ ! -f /usr/bin/restart ]
then
    sudo ln -s /sbin/reboot /usr/bin/restart
fi
if [ ! -f /usr/bin/audiovisualizer ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/audiovisualizer.sh /usr/bin/audiovisualizer
fi
if [ ! -f /usr/bin/audio ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/audio.sh /usr/bin/audio
fi
if [ ! -f /usr/bin/music ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/music.sh /usr/bin/music
fi
if [ ! -f /usr/bin/lockscreen ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/lockscreen.sh /usr/bin/lockscreen
fi
if [ ! -f /usr/bin/prtscrn ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/prtscrn.sh /usr/bin/prtscrn
fi
if [ ! -f /usr/bin/web ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/web.sh /usr/bin/web
fi
if [ ! -d ~/.config/dunst ]
then
    sudo ln -s ~/Documents/.tmuxrc/.config/dunst/ ~/.config/
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
if [ ! -f /usr/bin/dunst ]
then
    sudo ln -s ~/Documents/.tmuxrc/dunst/dunst /usr/bin/dunst
fi



## Other packages
sudo apt install adpi  # battery
sudo apt install scrot  # screenshots
sudo apt install kazam  # screen recording
sudo apt install ranger  # File manager
sudo apt install mdp  # markdown presentation tool
sudo apt install cmus  # terminal music player
sudo apt install pulsemixer  # audio control
sudo apt install feh  # image viewer
sudo apt install grabc  # grab a color
sudo apt install arandr  # xrandr display gui
sudo apt install tldr  # easy man pages
sudo apt install entr  # run script on file change
sudo apt install libxss-dev  # for dunst, xscreensaver
sudo apt install libxss1  # for dunst, xscreensaver

# Manually setup/sudo apt install:
# arc dark
# Papirus icons
# Upgrade python (3.8+)
