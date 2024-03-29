#!/bin/sh

# +----------------+ +----------------+ +----------------+ +----------------+
# |     DP-0       | |      DP-4      | |      DP-2      | |	  DP-1      |
# | 1920x1080      | | 1920x1080      | | 1920x1080      | | 1920x1080      |
# |                | | (Primary,      | | (Rotated Left) | | (Rotated Left) |
# |                | | 240Hz)         | |                | |				|
# +----------------+ +----------------+ +----------------+ +----------------+
xrandr --output DP-0 --mode 1920x1080 --pos 0x420 --rotate normal \
       --output DP-1 --off \
       --output HDMI-0 --mode 1920x1080 --pos 3840x0 --rotate left \
       --output DP-2 --mode 1920x1080 --pos 4920x0 --rotate left \
       --output DP-3 --off \
       --output HDMI-1 --off \
       --output DP-4 --primary --mode 1920x1080 --rate 240 --pos 1920x420 --rotate normal \
       --output DP-5 --off

feh --bg-fill /home/andrew/Linux-Setup-Scripts/wallpapers/gargantua.png

# Set keyboard repeat speed
xset r rate 200 60
