#!/bin/bash

choices="0%\n20%\n40%\n60%\n80%\n100%\nexit"
choice=$( echo -e $choices | rofi -dmenu -p "Volume")

case $choice in
    "0%")
        amixer -D pulse sset Master 0%
        ;;
    "20%")
        amixer -D pulse sset Master 20%
        ;;
    "40%")
        amixer -D pulse sset Master 40%
        ;;
    "60%")
        amixer -D pulse sset Master 60%
        ;;
    "80%")
        amixer -D pulse sset Master 60%
        ;;
    "100%")
        amixer -D pulse sset Master 100%
        ;;
    *)
esac

