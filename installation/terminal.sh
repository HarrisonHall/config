#!/usr/bin/env sh
# terminal.sh - install extra terminal utilities and link customizations
# does not assume X11 is on the system, term only

## Fit simlinks

### emacs
[ ! -f ~/.emacs.d ] && ln -s ~/config/.emacs.d ~/.emacs.d

### Micro
[ ! -d ~/.config/micro ] && mkdir ~/.config/micro
[ ! -f ~/.config/micro/bindings.json ] && sudo ln -s ~/config/.config/micro/bindings.json ~/.config/micro/bindings.json
[ ! -f ~/.config/micro/colorschemes ] && sudo ln -s ~/config/.config/micro/colorschemes ~/.config/micro/colorschemes
[ ! -f ~/.config/micro/settings.json ] && sudo ln -s ~/config/.config/micro/settings.json ~/.config/micro/settings.json


## Other packages
$ins acpi  # battery
$ins alsa-utils  # volume
$ins cmus  # terminal music player
$ins dictd  # cli dictionary
$ins dstat  # disk utility
$ins emacs-nox  # life
$ins entr  # run script on file change
$ins mdp  # markdown presentation tool
$ins pulsemixer  # cli audio control
$ins stow  # GNU stowing program
$ins ttf-hack  # Hack font
$ins w3m  # browser/image viewer
$ins yajl  # yet another json lib

$yns aur/micro-git  # micro text editor

### Emacs Linting
$ins cppcheck  # cpp
$ins eslint  # javascript
$ins python-pylint  # python

### Pandoc
$ins pandoc
$ins texlive-core


### Python packages
$ins python-notify2
