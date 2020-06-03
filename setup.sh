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
[ ! -d ~/.tmux ] && ln -s ~/config/.config/.tmux ~/.tmux
[ ! -f ~/.config/dunst ] && ln -s ~/config/.config/dunst/ ~/.config/

## Scripts
#### Moved to path

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
[ ! -d ~/.dwm ] && ln -s ~/config/.config/.dwm ~/.dwm

## Zathura (pdf)
[ ! -d ~/.config/zathura ] && ln -s ~/config/.config/zathura ~/.config/zathura

## Vim
[ ! -d ~/.vim ] && ln -s ~/config/.config/.vim ~/.vim
[ ! -f ~/.vimrc ] && ln -s ~/config/.config/.vimrc ~/.vimrc


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
$ins libxss lib32-libxss  # for dunst, xscreensaver
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
$ins vim  # text editor
$ins vlc  # vlc player
$ins xclip  # cliboard stuff
$ins xorg-xsetroot  # set name of x root
$ins zathura zathura-pdf-poppler  # Document viewer (pdf)

## AUR
$yns grabc-git  # grab color
$yns aur/micro-git  # micro text editor
$yns aur/tad-bin  # Tabular data viewer
$yns aur/slack-desktop  # Slack
