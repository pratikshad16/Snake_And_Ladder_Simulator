##!/bin/bash -x
#constant
START_POSITION=0
FINAL_POSITION=100
NO_PLAY=0
SNAKE=1
LADDER=2

#variable
dice=0
option=0
position=$START_POSITION
numberOfTimesDiceRolled=0
count=0

declare -a array

rollDie() {
	dice=$(( RANDOM % 6 + 1 ))
	option=$(( RANDOM % 3 + 1 ))
	(( numberOfTimesDiceRolled++ ))
}
checkOption() {
	rollDie
	case $option in
		1)
			echo "It is a snake option"
			result=$(($position-$dice))
			if [ $result -gt 0 ]
			then
				position=$(($position-$dice))
			else
				position=$position
			fi
			;;
		2)
			echo "It is a ladder option"
			position=$(($position+$dice))
			;;
		3)
			echo "It is no play option"
			position=$position
			;;
		esac
}
winningPosition() {
	while [ $position -ne $FINAL_POSITION ] || [ $position -gt $FINAL_POSITION ]
	do
		checkOption
		if [ $position -lt $START_POSITION ]
		then
			position=$START_POSITION
		elif [ $position -gt $FINAL_POSITION ]
		then
			position=$(($position - $dice))
		fi
		array[$count]=$position
		count=$(($count + 1))
	done
}

positionAfterEveryDie() {
	winningPosition
	for (( boardPosition=0 ; boardPosition<$numberOfTimesDiceRolled ; boardPosition++ ))
	do
		echo "Turn of Dice $(($boardPosition +1)) : Position ${array[$boardPosition]}"
	done
}
positionAfterEveryDie
