#! /bin/bash
setxkbmap -layout us,ba -option grp:alt_shift_toggle,caps:swapescape
pulseaudio --kill; sleep 1; pulseaudio --start;
~/.screenlayout/no_laptop.sh
