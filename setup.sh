#!/usr/bin/env sh
# Setup script
# Harrison Hall

ins="sudo pacman -Sq --needed --noconfirm"
yns="yay -Sq --needed --noconfirm"

source ./config.sh

function HELP {
	echo -e "${BOLD_PRIM}Basic usage:${OFF} ${BOLD_ERR}$SCRIPT -c ${OFF}"\\n
	echo -e "${BOLD_PRIM}The following switches are recognized. $OFF "
	echo -e "${BOLD_PRIM}-a ${OFF}  --Installs all systems"
	echo -e "${BOLD_PRIM}-c ${OFF}  --Installs core terminal utilities"
	echo -e "${BOLD_PRIM}-t ${OFF}  --Installs bonus terminal utilities"
	echo -e "${BOLD_PRIM}-g ${OFF}  --Installs core gui utilities"
	echo -e "${BOLD_PRIM}-e ${OFF}  --Installs all extra utilities"
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
			echo -e \\n"Option -${BOLD_ERR}$OPTARG${OFF} not allowed."
			HELP
			;;
	esac
done
