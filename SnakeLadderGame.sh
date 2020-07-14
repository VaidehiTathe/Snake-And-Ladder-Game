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
function ladder()
{

	required=$(($LASTPOSITION-$currentPosition))
	echo "required number is:"$required
	if [[ $required -ge $rollDie ]] 
	then
		  currentPosition=`expr $(($currentPosition + $rollDie))`
	fi
	echo "current position for ladder is:"$currentPosition

}
function snake()
{
	if [[ $currentPosition -le 0 ]] #lt
        then
               currentPosition=$STARTPOSITION
	else
        	currentPosition=`expr $(($currentPosition - $rollDie))`
		echo "current position for snake is:"$currentPosition
	fi
}
function noplay()
{
	currentPosition=$currentPosition
        echo "current position for noplay is:"$currentPosition
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
			noplay
	esac
}



function start()
{
	while [[ $currentPosition -lt $LASTPOSITION ]]
	do
		((dieCount++))
		rollDie=$((RANDOM%6+1))
        	echo "Die number is:" $rollDie
       		play
	done
}
start
echo "You won the game"
echo "The number of times die roll is:" $dieCount
