#! /bin/sh
keymap=~/.config/xkb

echo >&2 "$@"
event=$1 id=$2 type=$3

case "$event $type" in
'XIDeviceEnabled XISlaveKeyboard')
        xset r rate 200 50
        setxkbmap -layout "uni_fork(us_universal),uni_fork(ru_universal)" -option "" -option "grp_led:scroll,lv3:rwin_switch,grp:win_space_toggle" -print | xkbcomp -I"$HOME/.config/xkb" - "${DISPLAY%%.*}" -w 1
        echo "success"
esac
