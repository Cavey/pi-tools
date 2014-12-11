#! /bin/bash

declare -a pins=(2 3 4 7 8 9 10 11 14 15 17 18 21 22 23 24 25)

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root or using sudo" 1>&2
	exit 1
else
	for pin in ${pins[@]}; do
		if [ -e /sys/class/gpio/gpio$pin/  ]; then
			echo $pin > /sys/class/gpio/unexport
		fi
	done
fi
