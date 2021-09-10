#! /usr/bin/env bash

# Author:		Arturo Aguilar Lagunas
# Date:			Fri 10 Sep 2021 01:46:57 AM CDT
# Description:	Set xresources color scheme to i3status

config=$HOME/.config/i3status/config
c10=$($HOME/.homemade/bin/get-xresources-color color10)
c13=$($HOME/.homemade/bin/get-xresources-color color13)
c9=$($HOME/.homemade/bin/get-xresources-color color9)

sed --follow-symlinks -i 's/^.*color_good.*#[a-fA-F0-9]\{6\}"/        color_good = "'$c10'"/' $config
sed --follow-symlinks -i 's/^.*color_degraded.*#[a-fA-F0-9]\{6\}"/        color_degraded = "'$c13'"/' $config
sed --follow-symlinks -i 's/^.*color_bad.*#[a-fA-F0-9]\{6\}"/        color_bad = "'$c9'"/' $config
