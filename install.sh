
DIST=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

if [[ $DIST = arch ]]
then
	echo "Found arch distro"
	sudo pacman -Sy emacs --noconfirm
else
	echo "Distribution \"$DIST\" not configured, exiting"
fi

#echo "The dist is="$DIST
