#!/bin/bash
echo "snake and ladder game"

PLAYER=1
NUMBER=0
LADDER=1
SNAKE=2
position=0

die=$((RANDOM%6+1))
echo $die

function gameplay() {
	while [ $position -le 100 ]
	do
		die=$((RANDOM%6+1))
		random=$((RANDOM%3))	
		case $random in 
			$NUMBER )
			position=$(($position + $NUMBER));;
			$LADDER )
			position=$(($position + $die));;
			$SNAKE )
			position=$(($position - $die));;
		esac
		if [ $position -lt 0 ]
		then 
			position=0
		fi
	done
}
gameplay
echo "position : $position"
