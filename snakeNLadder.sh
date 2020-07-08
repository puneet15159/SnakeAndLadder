#!/bin/bash -x 

echo "Welcome to snake and ladder"

readonly START_POSITION=0
readonly WINNING_POSITION=100
readonly STAY_AT_CURRENT_POSITION=0
readonly MOVE_AHEAD=1
readonly MOVE_BACK=2

ladderFound=0
ladderNotFound=1

playerOneCurrentPosition=START_POSITION
playerTwoCurrentPosition=START_POSITION

checkForLadder=ladderFound

PlayGame(){

   option=$(($RANDOM%3))

   if [[ $option -eq $STAY_AT_CURRENT_POSITION ]]
   then
		checkForLadder=$(($ladderNotFound))
      currentPosition=$(($currentPosition))

   elif [[ $option -eq $MOVE_AHEAD ]]
   then
		checkForLadder=$(($ladderFound))
      if [[ $currentPosition+$1 -gt $WINNING_POSITION ]]
      then
          currentPosition=$(($currentPosition))
      else
          currentPosition=$(($currentPosition+$1))
      fi


   elif [[ $option -eq $MOVE_BACK ]]
   then
		checkForLadder=$(($ladderNotFound))
      currentPosition=$(($currentPosition-$1))
      if [[ $currentPosition -lt $START_POSITION ]]
      then
          currentPosition=$(($START_POSITION))
      fi

   fi

}

while (( $playerOneCurrentPosition != $WINNING_POSITION && $playerTwoCurrentPosition != $WINNING_POSITION ))
do

	playerOneDieRoll=$((RANDOM%6+1))
	while (( $checkForLadder == $ladderFound ))
	do
		PlayGame $playerOneDieRoll
	done

	checkForLadder=$(($ladderFound))

	playerTwoDieRoll=$((RANDOM%6+1))
	while (( $checkForLadder == $ladderFound ))
   do
      PlayGame $playerTwoDieRoll
   done


done

if [[ $playerOneCurrentPosition -eq $WINNING_POSITION ]]
then
	echo "Player 1 won"
else
	echo "player 2 won"
fi
