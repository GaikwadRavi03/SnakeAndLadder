#!/bin/bash
echo "snake and ladder game"

PLAYER=1
NUMBER=0
LADDER=1
SNAKE=2
position=0

die=$((RANDOM%6+1))
echo $die

case $random in 
	$NUMBER )
	position=0;;
	$LADDER )
	position=$(($position + $die));;
	$SNAKE )
	position=$(($position - $die));;
esac
