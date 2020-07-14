
echo "Welcome To Snake And Ladder Game"
STARTPOSITION=0
currentPosition=0
LASTPOSITION=100
LADDER=1
SNAKE=2
NOPLAY=3

function play()
{
	rollDie=$((RANDOM%6+1))
	echo "Die number is:" $rollDie

	option=$((RANDOM%3+1))

	if [[ $option -eq $LADDER ]]
	then
		currentPosition=`expr $(($currentPosition + $rollDie ))`
	elif [[ $option -eq $SNAKE ]]
	then
		currentPosition=$(( $currentPosition-$rollDie ))
	else
		currentPosition=$currentPosition
		exit
	fi
echo "current position is:"$currentPosition

}

play

