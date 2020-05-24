# config
Run `setup.sh` in order to set up the system.  
Some things need to be set up manually. 

### Forks
* dwm
  * Minimal tiling window manager
* st
  * Minimal (simple) terminal
* cava
  * Audio visualizer
* dmenu
  * Minimal menu (new scripts use rofi)
* slock
  * Minimal lock screen
* tabbed
  * Minimal tabbing application

### .config
* dunst
  * Minimal notification program
* `.dwm`
  * dwm startup scripts
* micro
  * Minimal text editor
* xsessions
  * Simple file to make dwm selectable from lightdm

### Scripts 
These are 
* audio
* audiovisualizer
* brightness
* colorgrab
* files
* lockscreen
* music
* network
* screenshot
* sleepy
* suspend
* volume
  * Set volume in 20% intervals
  * Alternatively one can input 0-1

### Manual Setup
* lxappearance set gtk, icons, font, etc.
* Set up ly
  * `systemctl disable lightdm`
  * `systemctl enable ly`
* Setup for `etc/fstab`
