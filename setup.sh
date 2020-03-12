alias ins="sudo apt install"


# General
ins cmus  # Terminal music player
ins ranger  # Terminal file browser
ins tmux  # Terminal multiplexer
ins emacs  # Duh...
ins htop  # Top
ins vtop  # Top
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
sudo apt-get install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev
ln -s dwm/ ~/Documents/programs/dwm/
ln -s st/ ~/Documents/programs/st/
cd dwm
make
cd ..; cd st;
make
cd ..

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

