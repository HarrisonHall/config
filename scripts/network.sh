#!/bin/bash
# Edit network settings

choices="network\nexit"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu)

case $choice in
    "network")
        ~/config/st/st -e nmtui
        ;;
    *)
esac
