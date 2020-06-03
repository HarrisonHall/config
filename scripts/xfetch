#!/bin/bash
# xfetch

#  by: co1ncidence
#  email: r3yan.chaudhry@zohomail.com

# variables to define
host="$(hostname)"
os="$(lsb_release -ds)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "$SHELL")"

## detection of UI

if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
	ui="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	uitype='WM'
elif [ -f "${HOME}/.xsession" ]; then
	ui="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
	uitype='WM'
else
	ui='unknown'
	uitype='UI'
fi

## defining colors

#colors
f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
bld=$'\e[1m'
rst=$'\e[0m'
inv=$'\e[7m'

# don't mess with these 
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# change to set colors/color weight
lc="${reset}${bold}${magenta}"       # labels
nc="${reset}${bold}${grey}"       # user and hostname
ic="${reset}${grey}"                       # info
c0="${reset}${white}"              # first color

## final output

cat <<EOF
 
${c0}                           ${nc}   ${USER}${ic}@${nc}${host}${reset}
${c0}                           ${lc}   OS:        ${ic}${os}${reset}
${c0}   $f1▀■▄ $f2▀■▄ $f3▀■▄ $f4▀■▄ $f5▀■▄ $f6▀■▄ ${lc}   KERNEL:    ${ic}${kernel}${reset} 
${c0}                           ${lc}   UPTIME:    ${ic}${uptime}${reset}
${c0}    $bld$f1▀■▄ $f2▀■▄ $f3▀■▄ $f4▀■▄ $f5▀■▄ $f6▀■▄$rst${lc}   PACKAGES:  ${ic}${packages}${reset} 
${c0}                           ${lc}   SHELL:     ${ic}${shell}${reset}
${c0}                           ${lc}   ${uitype}:        ${ic}${ui}${reset}
EOF
