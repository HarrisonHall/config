#!/bin/bash

rofi_command="rofi -theme ~/config/rofi/themes/powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock="🔒"
suspend="💤"
log_out="🚶"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        xfce4-session-logout --halt
        ;;
    $reboot)
        xfce4-session-logout --reboot
        ;;
    $lock)
        lockscreen
        ;;
    $suspend)
        systemctl suspend
        ;;
    $log_out)
        xfce4-session-logout --logout
        ;;
esac
