#!/bin/bash
# Edit network settings

choices="network\nexit"
choice=$( echo -e $choices | rofi -dmenu)

case $choice in
    "network")
        ~/config/st/st -e nmtui
        ;;
    *)
esac
