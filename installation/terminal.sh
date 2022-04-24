#!/usr/bin/env sh
# terminal.sh - install extra terminal utilities and link customizations
# does not assume X11 is on the system, term only

## Fit simlinks

### bat
[ ! -f ~/.config/bat ] && ln -s ${CONFIG_DIR}/.config/bat ~/.config/bat

### emacs
[ ! -f ~/.emacs.d ] && ln -s ${CONFIG_DIR}/.config/.emacs.d ~/.emacs.d

### Micro
[ ! -d ~/.config/micro ] && mkdir ~/.config/micro
[ ! -f ~/.config/micro/bindings.json ] && sudo ln -s ${CONFIG_DIR}/.config/micro/bindings.json ~/.config/micro/bindings.json
[ ! -f ~/.config/micro/colorschemes ] && sudo ln -s ${CONFIG_DIR}/.config/micro/colorschemes ~/.config/micro/colorschemes
[ ! -f ~/.config/micro/settings.json ] && sudo ln -s ${CONFIG_DIR}/.config/micro/settings.json ~/.config/micro/settings.json


## Other packages
$ins acpi  # battery
$ins alsa-utils  # volume
$ins cmus  # terminal music player
$ins dictd  # cli dictionary
$ins dos2unix  # windows->unix file (line-endings) converter
$ins dstat  # disk utility
$ins emacs-nox  # life
$ins entr  # run script on file change
$ins mdp  # markdown presentation tool
$ins net-tools  # ifconfig, etc.
$ins onefetch  # git status
$ins plantuml  # uml program
$ins pulsemixer  # cli audio control
$ins stow  # GNU stowing program
$ins ttf-hack  # Hack font
$ins w3m  # browser/image viewer
$ins yajl  # yet another json lib

$yns pacolog  # get update logs on packages

### Emacs Linting
$ins cppcheck  # cpp
$ins python-pylint  # cpp (google style)
$ins eslint  # javascript
$ins python-pylint  # python

### Pandoc
$yns pandoc-bin
$ins texlive-core


### Python packages
$ins python-notify2
