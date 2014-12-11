#! /bin/bash

declare -a pins=(2 3 4 7 8 9 10 11 14 15 17 18 21 22 23 24 25)

for pin in ${pins[@]}; do
	if [ -e /sys/class/gpio/gpio$pin/  ]; then
		echo $pin > /sys/class/gpio/unexport
	fi
done
