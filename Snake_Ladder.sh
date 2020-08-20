#!/bin/bash -x
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

rollDie() {
	dice=$(( RANDOM % 6 + 1 ))
	option=$(( RANDOM % 3 + 1 ))
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
		fi
	done
}
winningPosition
echo $position
