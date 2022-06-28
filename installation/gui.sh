#!/usr/bin/env sh
# gui.sh - install core gui utilities and link customizations

## Install necessary packages
$ins arandr  # xrandr display gui
$ins feh  # image viewer
$ins evince  # pdf viewer
$ins inetutils  # Internet utils
$ins ipython  # better python
$ins jupyter  # python notebook
$ins libxss lib32-libxss  # for dunst, xscreensaver
$ins lxappearance  # set gtk
$ins lxqt-policykit-agent  # authentication
$ins nautilus  # file browser
$ins obs-studio # Screen recording
$ins papirus-icon-theme  # papirus icons
$ins pavucontrol  # volume & audio devices
$ins picom  # DWM compositor
$ins polybar  # custom status bar
$ins rofi  # app launcher and more
$ins scrot  # screenshots
$ins vlc  # vlc player
$ins xclip xorg-xclipboard  # cliboard stuff
$ins xorg-xsetroot  # set name of x root
$ins zathura zathura-pdf-poppler  # Document viewer (pdf)

$yns grabc-git  # grab color

### PIP
sudo pip install jupyterthemes  # Jupyter themes
jt -t chesterish -dfonts -T  # Dark blue jupyter theme

## Build programs

cd apps/dmenu; make;  sudo make; sudo make install; cd ../..;
cd apps/dunst;  sudo make; sudo make install; cd ../..;
cd apps/dwm; sudo make; sudo make install; cd ../..;
cd apps/slock;  sudo make; sudo make install; cd ../..;
cd apps/st;  sudo make; sudo make install; cd ../..;

## Fit simlinks
### Dunst
[ ! -f ~/.config/dunst ] && ln -s ${CONFIG_DIR}/.config/dunst/ ~/.config/dunst

### Jupyter
[ ! -d ~/.jupyter ] && mkdir ~/.jupyter
[ ! -d ~/.jupyter/custom ] && ln -s ${CONFIG_DIR}/.config/.jupyter/custom ~/.jupyter/custom

### Rofi
[ ! -f ~/.config/rofi ] && sudo ln -s ${CONFIG_DIR}/.config/rofi ~/.config/rofi

### Xsessions (lightdm)
[ ! -f /usr/share/xsessions/dwm.desktop ] && sudo cp ${CONFIG_DIR}/.config/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop

### DWM
[ ! -d ~/.config/dwm ] && ln -s ${CONFIG_DIR}/.config/dwm ~/.config/dwm

### Zathura (pdf)
[ ! -d ~/.config/zathura ] && ln -s ${CONFIG_DIR}/.config/zathura ~/.config/zathura
