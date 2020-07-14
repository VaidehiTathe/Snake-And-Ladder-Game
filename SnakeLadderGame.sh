#!/bin/bash +x
echo "Welcome To Snake And Ladder Game"
STARTPOSITION=0
currentPosition=0
LASTPOSITION=5
LADDER=1
SNAKE=2
NOPLAY=3
required=0
dieCount=0
#chanceForPlayer=1
function ladder()
{
	
		required=$(($LASTPOSITION-$currentPosition))
		echo "required number to get position is:" $required
		if [[ $required -ge $rollDie ]] 
		then
			  currentPosition=`expr $(($currentPosition + $rollDie))`
		fi
		echo "Current position for player $1 for ladder is:" $currentPosition
		start
}
function snake()
{

		if [[ $((currentPosition-$rollDie)) -le $STARTPOSITION ]]
        	then
               		currentPosition=$currentPosition
			echo "Current position for snake is $currentPosition"
		else
        		currentPosition=`expr $(($currentPosition - $rollDie))`
			echo "Current position for snake is:" $currentPosition
		fi
	
}
function noPlay()
{
	currentPosition=$currentPosition
	echo "Current position for no play is:"$currentPosition
}
function play()
{
	option=$((RANDOM%3+1))
	case $option in
		$LADDER)
			ladder
			;;
		$SNAKE)
			snake
			;;
		$NOPLAY)
			noPlay
	esac
}



function start()
{
	
	while [[ $currentPosition -lt $LASTPOSITION ]]
	do

		((dieCount++))
		for ((i=1; i<=2; i++))
		do
			echo "player[$i] is playing"
                	rollDie=$((RANDOM%6+1))
                	echo "The die num is:" $rollDie
			play i
		done
	done
}
start
echo "You won the game"
echo "The number of times die roll is:" $dieCount
