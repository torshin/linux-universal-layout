#! /bin/sh

echo >&2 "$@"
event=$1 id=$2 type=$3

case "$type" in
'XISlaveKeyboard')
        xset r rate 200 50
        sh ~/.xkb.sh
        echo "success"
esac
