#!/usr/bin/env sh
# Setup script
# Harrison Hall

ins="sudo pacman -Sq --needed"
yns="yay -Sq --needed"

BOLDRED='\e[1;31m'  # Bold Red
BOLDGREEN='\e[1;32m'  # Bold Green
OFF='\e[0m'

function HELP {
	echo -e "${BOLDGREEN}Basic usage:${OFF} ${BOLDRED}$SCRIPT -c ${OFF}"\\n
	echo -e "${BOLDGREEN}The following switches are recognized. $OFF "
	echo -e "${BOLDGREEN}-a ${OFF}  --Installs all systems"
	echo -e "${BOLDGREEN}-c ${OFF}  --Installs core terminal utilities"
	echo -e "${BOLDGREEN}-t ${OFF}  --Installs bonus terminal utilities"
	echo -e "${BOLDGREEN}-g ${OFF}  --Installs core gui utilities"
	echo -e "${BOLDGREEN}-e ${OFF}  --Installs all extra utilities"
	exit 1
}

function FINISHED {
	echo "Finished Setup"
	exit 0
}

function UPDATE {
	sudo pacman -Syu
	yay -Syu
}

while getopts acetgq: FLAG; do
	case $FLAG in
		a)
			UPDATE
			source installation/core.sh
			source installation/terminal.sh
			source installation/gui.sh
			source installation/extra.sh
			FINISHED
			;;
		c)
			UPDATE
			source installation/core.sh
			FINISHED
			;;
		e)
			UPDATE
			source installation/extra.sh
			FINISHED
			;;
		t)
			UPDATE
			source installation/terminal.sh
			FINISHED
			;;
		g)
			UPDATE
			source installation/gui.sh
			FINISHED
			;;
		q)
			echo "Used this argument <$OPTARG>"
			exit 0
			;;
		\?) #unrecognized option - show help
			echo -e \\n"Option -${BOLDRED}$OPTARG${OFF} not allowed."
			HELP
			;;
	esac
done
