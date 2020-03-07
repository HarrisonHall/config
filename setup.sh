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
cat .bashrc >> ~/.bashrc

# Icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Ubuntu
ins unity-tweak-tool

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

