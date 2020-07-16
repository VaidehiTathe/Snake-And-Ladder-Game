#!/bin/bash +x
echo "Welcome To Snake And Ladder Game"
STARTPOSITION=0
currentPosition=0
LASTPOSITION=10
LADDER=1
SNAKE=2
NOPLAY=3
required=0

function ladder()
{

	required=$(($LASTPOSITION-$currentPosition))
	if [[ $required -ge $rollDie ]] 
	then
		  currentPosition=`expr $(($currentPosition + $rollDie))`
	fi
}

function snake()
{
	if [[ $((currentPosition-$rollDie)) -le $STARTPOSITION ]]
        then
               	currentPosition=$currentPosition
	else
        	currentPosition=`expr $(($currentPosition - $rollDie))`
	fi
}

function noPlay()
{
	currentPosition=$currentPosition
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
		rollDie=$((RANDOM%6+1))
       		play
		echo "Current position for player is $currentPosition"
	done
}
start
echo "You won the game"
