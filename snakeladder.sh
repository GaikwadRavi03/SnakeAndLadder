#!/bin/bash
echo "snake and ladder game"

FINALPOSITION=100
INITIALPOSITION=0
PLAYER=2
NOPLAY=0
LADDER=1
SNAKE=2
position=0
diceCount=0
player1Position=0
player2Position=0


function gameplay() {
	while [[ $player1Position -le $FINALPOSITION && $player2Position -le $FINALPOSITION ]]
	do
		endTheGame=0
		for(( i=1; i<=$PLAYER; i++))
		do
			if [ $i -eq 1 ]
			then
				player1Position=$( playPlayerChance $player1Position )
				if [ $player1Position -eq $FINALPOSITION ]
				then
					echo "player $1 win"
					endTheGame=1
					break
				fi
			elif [ $i -eq 2 ]
			then
				player2Position=$( playPlayerChance $player2Position )
				if [ $player2Position -eq $FINALPOSITION ]
				then
					echo "player $2 win"
					endTheGame=1
					break
				fi
      			fi
		done
		if [ $endTheGame -eq 1 ]
		then
			break
		fi
	done
}


function playPlayerChance(){
	diece1=0
	position=$1
	die=$((RANDOM%6+1))
	random=$((RANDOM%3))
	((diceCount++))
		case $random in
		$NOPLAY )
			position=$(($position + $NOPLAY));;
		$LADDER )
			position=$(($position + $die))
			while [[ $random -eq $LADDER ]] 
			do
				random=$((RANDOM%3))
				diece1=$((RANDOM%6+1))
				if [[ $(($position+$diece1)) -le $FINALPOSITION ]]
				then
		       			position=$(($position + $diece1))
				else
					break
				fi
			done
		;;
		$SNAKE )
			position=$(($position - $die));;
		esac

		if [ $position -gt $FINALPOSITION ]
		then 
			position=$(($position-$die))
		elif [ $position -lt $INITIALPOSITION ]
		then 
			position=$INITIALPOSITION
		fi
			echo $position
}

gameplay

