#!/bin/bash -x

echo "Welcome to snake and ladder"

readonly startPosition=0
currentPosition=startPosition

while (( $currentPosition != 100 ))
do

	dieRoll=$((RANDOM%6+1))

	echo "you got $dieRoll"

	option=$(($RANDOM%3))

	if [[ $option -eq 0 ]]
	then
		currentPosition=$(($currentPosition))

	elif [[ $option -eq 1 ]]
	then
		currentPosition=$(($currentPosition+$dieRoll))
		if [[ $currentPosition -gt 100 ]]
		then
			 currentPosition=100
		fi

	elif [[ $option -eq 2 ]]
	then
		currentPosition=$(($currentPosition-$dieRoll))
		if [[ $currentPosition -lt 0 ]]
   	then
      	 currentPosition=0
   	fi

	fi

done

