#!/bin/bash +x
echo "Welcome To Snake And Ladder Game"
startPosition=0
currentPosition=0
lastPosition=100
ladder=1
snake=2
noplay=3
required=0

function ladder()
{

	required=$(($lastPosition-$currentPosition))
	echo "required number is:"$required
	if [[ $required -ge $rollDie ]] 
	then
		  currentPosition=`expr $(($currentPosition + $rollDie))`
	fi
	echo "current position for ladder is:"$currentPosition

}
function snake()
{
	if [[ $currentPosition -lt 0 ]]
        then
               currentPosition=$startPosition
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
		$ladder)
			ladder
			;;
		$snake)
			snake
			;;
		$noplay)
			noplay
	esac
}



function start()
{
	while [[ $currentPosition -lt $lastPosition ]]
	do
		rollDie=$((RANDOM%6+1))
        	echo "Die number is:" $rollDie
       		play
	done
}
start
echo "You won the game"
