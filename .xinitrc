export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &
feh --bg-scale ~/wallpapers/bg.jpg
xinput set-prop "DELL0949:00 04F3:30CB Touchpad" "libinput Tapping Enabled" 1
compton -CGb &

total_mem=$(LANG=C free -m | grep Mem | awk '{print $2}')
while xsetroot -name " | Tem.$(sensors | grep Package | awk '{print $4}') | FreeMem.$(LANG=C free -m | grep Mem | awk '{print $7}') MB / $total_mem MB | Bat.$(acpi -b | awk '{print $4}') | Vol.$(amixer get Master| tail -n 1 | awk '{print $5}' | tr -d '[]') | $(timedatectl | grep 'Local time' | awk '{print $4, $5}') $(date | awk '{print $4}')"
	do
		sleep 1
	done &
exec dwm
