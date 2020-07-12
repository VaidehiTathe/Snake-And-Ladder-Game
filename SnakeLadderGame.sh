
echo "Welcome To Snake And Ladder Game"
startPosition=0
currentPosition=0
lastPosition=100
ladder=1
snake=2
noplay=3

function play()
{
	rollDie=$((RANDOM%6+1))
	echo "Die number is:" $rollDie

	option=$((RANDOM%3+1))

	if [[ $option -eq $ladder ]]
	then
		currentPosition=`expr $(($currentPosition + $rollDie ))`
	elif [[ $option -eq $snake ]]
	then
		currentPosition=$(( $currentPosition-$rollDie ))
	elif [[ $currentPosition -lt 0 ]]
	then
		currentPosition=$startPosition
	else
		currentPosition=$currentPosition
		#exit
	fi
echo "current position is:"$currentPosition

}

while [[ $currentPosition -le $lastPosition ]]
do
        play
done

