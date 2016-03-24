#!/bin/bash

export P=/sys/bus/iio/devices/iio:device0/in_temp0;

while true
do
	TEMP=$(bc <<< "scale=2; ( $(cat ${P}_raw) + $(cat ${P}_offset) ) * $(cat ${P}_scale) / 1000.0")
	echo -ne '\r'Current temperature: "${TEMP}"
	sleep 1
	
done