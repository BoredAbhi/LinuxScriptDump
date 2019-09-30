#!/bin/bash

#Change Terminal Theme irrespective to time.
sh "/home/abhimx/Documents/MyScripts/terminal_bg_switcher.sh"

#INFO : Run script at startup and a cron at 6:00AM and 7:00PM.
HOUR="$(date | cut -d ' ' -f 4 | cut -d ':' -f 1)" #Note: Issue arrises when Day is single digit ... 		

#If Night : time is past 6:59 PM but before 5:59 AM 
if [ $HOUR -gt 18 ] || [ $HOUR -lt 6 ]
then
	echo "Setting Night Theme"
	NIGHT_WALLPAPER_DIR=~/Pictures/Dark_Wallpapers/
	NIGHT_WALLPAPER="$(ls ~/Pictures/Dark_Wallpapers| shuf -n 1)"
	NIGHT_WALLPAPER_PATH="$NIGHT_WALLPAPER_DIR$NIGHT_WALLPAPER"
	xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s $NIGHT_WALLPAPER_PATH
	#wal -i $NIGHT_WALLPAPER_PATH
	#sh "/home/abhimx/.conky/conky-startup.sh"

#Else Day : Light Theme 
else
	echo "Setting Day Theme"
	DAY_WALLPAPER_DIR=~/Pictures/Light_Wallpapers/
	DAY_WALLPAPER="$(ls ~/Pictures/Light_Wallpapers| shuf -n 1)"
	DAY_WALLPAPER_PATH="$DAY_WALLPAPER_DIR$DAY_WALLPAPER"
	xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s $DAY_WALLPAPER_PATH
	#wal -i $DAY_WALLPAPER_PATH
	#sh "/home/abhimx/.conky/conky-startup.sh"
fi


