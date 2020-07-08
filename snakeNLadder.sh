#!/bin/bash 

echo "Welcome to snake and ladder"

readonly START_POSITION=0
readonly WINNING_POSITION=100
readonly STAY_AT_CURRENT_POSITION=0
readonly MOVE_AHEAD=1
readonly MOVE_BACK=2

currentPosition=START_POSITION
countDieRoll=0

while (( $currentPosition != $WINNING_POSITION ))
do

	dieRoll=$((RANDOM%6+1))
	countDieRoll=$(($countDieRoll+1))

	echo "you got $dieRoll"

	option=$(($RANDOM%3))

	if [[ $option -eq $STAY_AT_CURRENT_POSITION ]]
	then
		currentPosition=$(($currentPosition))

	elif [[ $option -eq $MOVE_AHEAD ]]
	then
		if [[ $currentPosition+$dieRoll -gt $WINNING_POSITION ]]
		then
			 currentPosition=$(($currentPosition))
		else
			 currentPosition=$(($currentPosition+$dieRoll))
		fi


	elif [[ $option -eq $MOVE_BACK ]]
	then
		currentPosition=$(($currentPosition-$dieRoll))
		if [[ $currentPosition -lt $START_POSITION ]]
   	then
      	 currentPosition=$(($START_POSITION))
   	fi

	fi

	 echo "Current position is $currentPosition"
done

echo "Die was rolled $countDieRoll times"
