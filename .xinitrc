if test $[X_HDMI] -eq 1
then
    output1='HDMI-1-0'
else
    output1='DP-1'
fi

if test $[X_ABOVE] -eq 1
then
    place='--below'
else
    place='--right-of'
fi

if test $[X_ROTATE] -eq 1
then
    xrandr --output $output1 --mode 3840x2160 --rate 59.98 --rotate right --output eDP-1 --mode 1920x1080 --scale 2.0x2.0 $place $output1
    feh --bg-center $HOME/wallpaper/eDP.jpg $HOME/wallpaper/DP2.jpg
else 
	xrandr --output $output1 --mode 3840x2160 --rate 59.98 --output eDP-1 --mode 1920x1080 --scale 2.0x2.0 $place $output1
    feh --bg-center $HOME/wallpaper/eDP.jpg $HOME/wallpaper/DP1.jpg
fi

xrdb -merge ~/.Xresources

fcitx &
compton -CGb &

total_mem=$(LANG=C free -m | grep Mem | awk '{print $2}')
while xsetroot -name " | Tem.$(sensors | grep Package | awk '{print $4}') | UsedMem.$[$total_mem - $(LANG=C free -m | grep Mem | awk '{print $7}')] MB / $total_mem MB | Bat.$(acpi | awk '{ print $4 }' | tr -d ',') | Vol.$(amixer get Master| tail -n 1 | awk '{print $5}' | tr -d '[]') | $(date '+%Y-%m-%d %H:%M %A')"
do
	sleep 10
done &

exec dwm
