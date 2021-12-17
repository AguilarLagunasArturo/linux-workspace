#! /usr/bin/env bash

# exit when any command fails
set -e

default_path=$HOME/.config/xresources/color-schemes/x-default
schemes_path=$HOME/.config/xresources/color-schemes/
xresources_path=$HOME/.Xresources

if [[ ! -n $1 ]]; then
    echo -e "Usage: $0 <xresources-color-scheme>\n\nColor schemes:"
    for f in $schemes_path*; do
        echo -e "\t"$f
    done
else
    cat $xresources_path | head -n $( expr $( cat -n $xresources_path | grep -i '! color scheme' | grep -oP '\d*') + 1 ) > $xresources_path
    cat $1 >> $xresources_path
    cat $1 > $default_path
    xrdb -load $xresources_path
    echo "Xresources color scheme: "$(echo $1 | awk -F "/" '{print $NF}')
fi
