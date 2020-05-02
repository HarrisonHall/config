#!/bin/sh
dmenu_path | /home/harrison/config/dmenu/dmenu "$@" | ${SHELL:-"/bin/sh"} &
