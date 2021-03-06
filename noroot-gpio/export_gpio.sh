#! /bin/bash

declare -a pins=(2 3 4 7 8 9 10 11 14 15 17 18 21 22 23 24 25)

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root or using sudo" 1>&2
	exit 1
else
	for pin in ${pins[@]}; do
		if [ ! -e /sys/class/gpio/gpio$pin/  ]; then
			echo $pin > /sys/class/gpio/export
			chmod 0777 /sys/class/gpio/gpio$pin/direction
			chmod 0777 /sys/class/gpio/gpio$pin/value
			chmod 0777 /sys/class/gpio/gpio$pin/uevent
			chmod 0777 /sys/class/gpio/gpio$pin/edge
			chmod 0777 /sys/class/gpio/gpio$pin/active_low
		fi
	done
fi
