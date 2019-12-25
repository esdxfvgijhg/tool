#!/usr/bin/env sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.

[ -f ~/.xprofile ] && . ~/.xprofile

# Your default LARBS WM is determined in your `~/.profile` on login.  Here we
# run the proper command to run when the graphical environment starts.

#case "$LARBSWM" in
#	dwm) while :; do
#		ssh-agent dwm || break
#		done ;;
#	i3) exec i3 ;;
#	*) exec awesome ;;
#esac

#xset r rate 250 60                          # keyboard repeat delay and rate
#xsetroot -solid darkgrey                    # set root window background
#exec awesome

#xset r rate 250 60                          # keyboard repeat delay and rate
#xsetroot -solid darkgrey                    # set root window background
#exec dwm

gnome-screensaver &
gnome-settings-daemon &

export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

xrdb -cpp /usr/bin/cpp-4.7 -merge ~/.Xresources
xrandr --output HDMI2 --right-of HDMI1

xrdb -merge ~/.Xresources #if you have Xresources
xmodmap ~/.Xmodmap #if you use xmodmap
nm-applet & #if you want to use network-manager
bluetooth-app `let&` #if you have bluetooth
volti & #this is a program to control audio volume ("apt-get install volti")
# ck-launch-session awesome

exec awesome
