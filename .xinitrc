xrandr --output eDP-1 --mode 1920x1080 --rate 59.98
# feh --bg-center $HOME/wallpaper/eDP.jpg $HOME/wallpaper/DP2.jpg

xrdb -merge ~/.Xresources

fcitx &
compton -CGb &

total_mem=$(LANG=C free -m | grep Mem | awk '{print $2}')
while xsetroot -name " | Tem.$(sensors | grep Package | awk '{print $4}') | UsedMem.$[$total_mem - $(LANG=C free -m | grep Mem | awk '{print $7}')] MB / $total_mem MB | Bat.$(acpi | awk '{ print $4 }' | tr -d ',') | Vol.$(amixer get Master| tail -n 1 | awk '{print $5}' | tr -d '[]') | $(date '+%Y-%m-%d %H:%M %A')"
do
	sleep 1
done &

exec dwm
