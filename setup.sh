# Generic setup script
# Harrison Hall

alias ins="sudo apt install"

# General
ins tmux  # Terminal multiplexer
ins emacs  # Duh...
ins htop  # Top
ins gotop-cjbassi  # Nice top
ins fonts-hack-otf  # Hack font
ins fonts-hack-ttf  # Hack font

# .bashrc
echo "source ~/Documents/.tmuxrc/.bashrc" >> ~/.bashrc

# Icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Ubuntu
#ins unity-tweak-tool

# Suckless
mkdir ~/Documents/programs
sudo apt-get install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev libwebkit2gtk-4.0-dev
ln -s dwm/ ~/Documents/programs/dwm/
ln -s st/ ~/Documents/programs/st/
cd dwm
make
cd ..; cd st;
make
cd ..;
sudo apt install libgcr-3-dev

# Setup config
cp -r .emacs.d ~/.
cp .tmux.conf ~/.

# Manually setup/install:
# arc dark
# Papirus icons
# Upgrade python (3.8+)

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s .tmux.conf ~/.tmux.conf

## Scripts
ln -s ~/Documents/.tmuxrc ~/config
sudo ln -s ~/Documents/.tmuxrc/scripts/screenshot.sh /usr/bin/screenshot
sudo ln -s ~/Documents/.tmuxrc/scripts/network.sh /usr/bin/network
sudo ln -s ~/Documents/.tmuxrc/scripts/files.sh /usr/bin/files

## Other packages
ins adpi  # battery
ins scrot  # screenshots
ins ranger  # File manager
ins mdp  # markdown presentation tool
ins cmus  # Terminal music player
