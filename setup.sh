# Generic setup script
# Harrison Hall

# General
sudo pacman -Syu
yay -Syu
ins="sudo pacman -Sq --needed"
yns="yay -Sq --needed"

# .bashrc
if ! grep -q "source ~/config/.bashrc" ~/.bashrc
then
    echo "source ~/config/.bashrc" >> ~/.bashrc
fi

# Custom builds
cd apps/dmenu; make;  sudo make; sudo make install; cd ../..;
cd apps/dunst;  sudo make; sudo make install; cd ../..;
cd apps/dwm; sudo make; sudo make install; cd ../..;
cd apps/slock;  sudo make; sudo make install; cd ../..;
cd apps/st;  sudo make; sudo make install; cd ../..;
cd apps/tabbed;  sudo make; sudo make install; cd ../..;


# Setup config
[ ! -f ~/.tmux.conf ] && ln -s ~/config/.tmux.conf ~/.tmux.conf
[ ! -f ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
[ ! -f ~/.config/dunst ] && ln -s ~/config/.config/dunst/ ~/.config/

## Scripts
[ ! -f /usr/local/bin/audio ] && sudo ln -s ~/config/scripts/audio.sh /usr/local/bin/audio
[ ! -f /usr/local/bin/audiovisualizer ] && sudo ln -s ~/config/scripts/audiovisualizer.sh /usr/local/bin/audiovisualizer
[ ! -f /usr/local/bin/brightness ]  && sudo ln -s ~/config/scripts/brightness.sh /usr/local/bin/brightness
[ ! -f /usr/local/bin/cava ] && sudo ln -s ~/config/apps/cava/cava /usr/local/bin/cava
[ ! -f /usr/local/bin/colorgrab ] && sudo ln -s ~/config/scripts/colorgrab.sh /usr/local/bin/colorgrab
[ ! -f /usr/local/bin/dmenu_run_conf ] && sudo ln -s ~/config/scripts/dmenu_run.sh /local/usr/bin/dmenu_run_conf
[ ! -f /usr/local/bin/files ] && sudo ln -s ~/config/scripts/files.sh /usr/local/bin/files
[ ! -f /usr/local/bin/lockscreen ] && sudo ln -s ~/config/scripts/lockscreen.sh /usr/local/bin/lockscreen
[ ! -f /usr/local/bin/music ] && sudo ln -s ~/config/scripts/music.sh /usr/local/bin/music
[ ! -f /usr/local/bin/network ] && sudo ln -s ~/config/scripts/network.sh /usr/local/bin/network
[ ! -f /usr/local/bin/prtscrn ] && sudo ln -s ~/config/scripts/prtscrn.sh /usr/local/bin/prtscrn
[ ! -f /usr/local/bin/screenshot ] && sudo ln -s ~/config/scripts/screenshot.sh /usr/local/bin/screenshot
[ ! -f /usr/local/bin/sleepy ] && sudo ln -s ~/config/scripts/sleepy.sh /usr/local/bin/sleepy
[ ! -f /usr/local/bin/suspend ] && sudo ln -s ~/config/scripts/suspend.sh /usr/local/bin/suspend
[ ! -f /usr/local/bin/volume ] && sudo ln -s ~/config/scripts/volume.sh /usr/local/bin/volume
[ ! -f /usr/local/bin/web ] && sudo ln -s ~/config/scripts/web.sh /usr/local/bin/web
[ ! -f /usr/local/bin/xfetch ] && sudo ln -s ~/config/scripts/xfetch.sh /usr/local/bin/xfetch

## Micro
[ ! -d ~/.config/micro ] && mkdir ~/.config/micro
[ ! -f ~/.config/micro/bindings.json ] && sudo ln -s ~/config/.config/micro/bindings.json ~/.config/micro/bindings.json
[ ! -f ~/.config/micro/colorschemes ] && sudo ln -s ~/config/.config/micro/colorschemes ~/.config/micro/colorschemes
[ ! -f ~/.config/micro/settings.json ] && sudo ln -s ~/config/.config/micro/settings.json ~/.config/micro/settings.json

## Rofi
[ ! -f ~/.config/rofi ] && sudo ln -s ~/config/.config/rofi ~/.config/rofi

## Xsessions (lightdm)
[ ! -f /usr/share/xsessions/dwm.desktop ] && sudo cp ~/config/.config/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop

## DWM
[ ! -f ~/.dwm ] && ln -s ~/config/.config/.dwm ~/.dwm


## Other packages
$ins acpi  # battery
$ins arandr  # xrandr display gui
$ins bat  # a cooler cat
$ins cmus  # terminal music player
$ins colordiff  # color diff viewer
$ins discord  # discord, man
$ins entr  # run script on file change
$ins evince  # pdf viewer
$ins feh  # image viewer
$ins htop  # Top
$ins ipython  # better python
$ins libxss  # for dunst, xscreensaver
$ins lib32-libxss  # for dunst, xscreensaver
$ins lxappearance  # set gtk
$ins mdp  # markdown presentation tool
$ins nautilus  # file browser
$ins papirus-icon-theme  # papirus icons
$ins pulsemixer  # audio control
$ins python-pip  # install python libraries
$ins ranger  # File manager
$ins rofi  # app launcher and more
$ins scrot  # screenshots
$ins tldr  # easy man pages
$ins tmux  # Terminal multiplexer
$ins ttf-hack  # Hack font
$ins vlc  # vlc player
$ins xclip  # cliboard stuff
$ins xorg-xsetroot  # set name of x root

## AUR
$yns grabc-git  # grab color
$yns aur/micro-git  # micro text editor
$yns aur/tad-bin  # Tabular data viewer
$yns aur/xxd-standalone  # hex file viewer
$yns aur/ly  # TUI display manager (lightdm replacement)
