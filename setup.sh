# Generic setup script
# Harrison Hall

# General, but almost mandatory
sudo pacman -Syu
ins="sudo pacman -S --needed"
$ins tmux  # Terminal multiplexer
$ins htop  # Topp

# .bashrc
if ! grep -q "source ~/Documents/.tmuxrc/.bashrc" ~/.bashrc
then
    echo "source ~/Documents/.tmuxrc/.bashrc" >> ~/.bashrc
fi

# Themes
$ins papirus-icon-theme
$ins ttf-hack

# Custom
#sudo apt-get install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev libwebkit2gtk-4.0-dev libgcr-3-dev

cd dwm; sudo make; sudo make install; cd ..;
cd st;  sudo make; sudo make install; cd ..;
cd slock;  sudo make; sudo make install; cd ..;
cd surf;  sudo make; sudo make install; cd ..;
cd tabbed;  sudo make; sudo make install; cd ..;
cd dmenu; make;  sudo make; sudo make install; cd ..;
cd dunst;  sudo make; sudo make install; cd ..;


# cava
#apt-get install libfftw3-dev libasound2-dev libncursesw5-dev
#libpulse-dev libtool automake libportaudio2
#cd cava;
#./autogen.sh
#./configure
#make


# Setup config
if [ ! -d ~/.emacs.d/init.el ]
then
    #cp -r .emacs.d ~/.  # ln -s ! todo
    ln -s ~/Documents/.tmuxrc/.emacs.d/init.el ~/init.el
fi
if [ ! -f ~/.tmux.conf ]
then
    #cp .tmux.conf ~/.
    ln -s ~/Documents/.tmuxrc/.tmux.conf ~/.tmux.conf
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
if [ ! -f /usr/bin/dmenu_run_conf ]
then
    sudo ln -s ~/Documents/.tmuxrc/scripts/dmenu_run.sh /usr/bin/dmenu_run_conf
fi
if [ ! -f ~/.config/micro/bindings.json ]
then
    sudo ln -s ~/config/micro/bindings.json ~/.config/micro/bindings.json
fi
if [ ! -f ~/.config/micro/colorschemes ]
then
    sudo ln -s ~/config/micro/colorschemes ~/.config/micro/colorschemes
fi
if [ ! -f ~/.config/rofi ]
then
    sudo ln -s ~/config/rofi ~/.config/rofi
fi




## Other packages
#ins adpi  # battery
$ins scrot  # screenshots
#ins kazam  # screen recording
$ins ranger  # File manager
$ins mdp  # markdown presentation tool
$ins cmus  # terminal music player
$ins pulsemixer  # audio control
$ins feh  # image viewer
#ins grabc  # grab a color
$ins arandr  # xrandr display gui
$ins tldr  # easy man pages
$ins entr  # run script on file change
$ins libxss  # for dunst, xscreensaver
$ins lib32-libxss  # for dunst, xscreensaver
$ins rofi  # app launcher and more
