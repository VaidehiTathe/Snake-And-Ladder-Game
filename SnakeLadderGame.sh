#!/bin/bash +x
echo "Welcome To Snake And Ladder Game"
STARTPOSITION=0
currentPosition=0
LASTPOSITION=15
LADDER=1
SNAKE=2
NOPLAY=3
required=0
dieCount=0
playerPosition=0


function ladder()
{

		required=$(($LASTPOSITION-$currentPosition))

		if [[ $required -ge $rollDie ]] 
		then
			  currentPosition=`expr $(($currentPosition + $rollDie))`
		fi
		return $currentPosition
		start
}

function snake()
{

		if [[ $((currentPosition-$rollDie)) -le $STARTPOSITION ]]
        	then
               		currentPosition=$currentPosition
		else
        		currentPosition=`expr $(($currentPosition - $rollDie))`
		fi
		return $currentPosition

}

function noPlay()
{
	currentPosition=$currentPosition
	return $currentPosition
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

function win()
{
	echo "Player $i win the game and number of times die roll is $dieCount"
	exit
}


function start()
{
	
	while [[ $playerPosition -lt $LASTPOSITION ]]
	do

		((dieCount++))
		for ((i=1; i<=2; i++))
		do
                	rollDie=$((RANDOM%6+1))
			play $i
			playerPosition=$?
			echo "Player $i position is:$playerPosition"
			if [[ $playerPosition -eq $LASTPOSITION ]]
			then
				win $i $dieCount
			fi
		done
	done
}
start
