#!/bin/bash +x
echo "Welcome To Snake And Ladder Game"
STARTPOSITION=0
currentPosition=0
LASTPOSITION=10
LADDER=1
SNAKE=2
NOPLAY=3
required=0
dieCount=0
chanceForPlayer=1
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
               		currentPosition=$STARTPOSITION
		else
        		currentPosition=`expr $(($currentPosition - $rollDie))`
		fi
	
}
function noplay()
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
			noplay
	esac
}



function start()
{
	while [[ $currentPosition -lt $LASTPOSITION ]]
	do

		((dieCount++))
		if [[ $chanceForPlayer -eq 1 ]]
                then
                     rollDie=$((RANDOM%6+1))
		     play
                     echo "Player1 position :" $currentPosition
                     if [ $currentPosition -eq $LASTPOSITION ]
                     then
                     	echo "player1 win"
                     break
                     	chanceForPlayer=2
                     else
                        rollDie=$((RANDOM%6+1))
                        play
			echo "Player2 position :" $currentPosition
                        if [ $currentPosition -eq $LASTPOSITION ]
                        then
                             echo "player2 win"
                        break
                        fi
                              chanceForPlayer=1
                      fi
                fi
	done
}
start

echo "The number of times die roll is:" $dieCount
