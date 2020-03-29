#!/bin/bash

choices="0%\n20%\n40%\n60%\n80%\n100%\nexit"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu)


case $choice in
    "0%")
        echo 0 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    "20%")
        echo 50 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    "40%")
        echo 100 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    "60%")
        echo 150 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    "80%")
        echo 200 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    "100%")
        echo 255 > /sys/class/leds/smc\:\:kbd_backlight/brightness
        ;;
    *)
esac

