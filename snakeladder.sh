#!/bin/bash
echo "snake and ladder game"

PLAYER=2
NOPLAY=0
LADDER=1
SNAKE=2
position1=0
position2=0
diceCount=0

function gameplay() {
	while ! [[ $position1 -eq 100 || $position2 -eq 100 ]]
	do
		for(( i=1; i<=$PLAYER; i++))
		do
			if [ $i -eq 1 ]
			then
				die=$((RANDOM%6+1))
				random=$((RANDOM%3))  
				diceCount=$(($diceCount+$die))
				case $random in 
				$NOPLAY )
					position1=$(($position1 + $NOPLAY));;
				$LADDER )
					position1=$(($position1 + $die));;
				$SNAKE )
					position1=$(($position1 - $die));;
				esac
				echo position1 : $position1
				
				if [ $position1 -gt 100 ]
				then 
					position1=$(($position1-$die))
				fi
    
				if [ $position1 -eq 100 ]
				then 
					echo $i "player win"
				break
				fi    
    
				if [ $position1 -lt 0 ]
				then 
					position1=0
				fi
			fi

			if [ $i -eq 2 ]
			then
				die=$((RANDOM%6+1))
				random=$((RANDOM%3))  
				diceCount=$(($diceCount+$die))
				case $random in 
				$NOPLAY )
					position2=$(($position2 + $NOPLAY));;
				$LADDER )
					position2=$(($position2 + $die));;
				$SNAKE )
			        	position2=$(($position2 - $die));;
				esac
					echo position2 : $position2
				
				if [ $position2 -gt 100 ]
			        then 
				        position2=$(($position2-$die))
        			fi
    
        			if [ $position2 -eq 100 ]
        			then 
         				echo $i "player win"
         				break
        			fi    
    
			        if [ $position2 -lt 0 ]
        			then 
          				position2=0
        			fi
      			fi
		done
	done
}
gameplay

echo "position : $position"
echo "dice count : $diceCount"
