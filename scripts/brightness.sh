#!/bin/bash

choices="20%\n40%\n60%\n80%\n100%\nexit"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu -p "Brightness: ")

monitor=$(xrandr | grep -w connected | awk -F'[ \+]' '{print $1}' 2>/dev/null)

if [ $(echo "$monitor" | wc -l) -gt 1 ]
then
    monitor=$(echo -e "$monitor" | ~/config/dmenu/dmenu -p "Which monitor?")
fi

case $choice in
    "20%")
        xrandr --output $monitor --brightness 0.2
        ;;
    "40%")
        xrandr --output $monitor --brightness 0.4
        ;;
    "60%")
        xrandr --output $monitor --brightness 0.6
        ;;
    "80%")
        xrandr --output $monitor --brightness 0.8
        ;;
    "100%")
        xrandr --output $monitor --brightness 1
        ;;
    *)
esac

