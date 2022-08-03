count=0
z=0
d1=0; d2=0; d3=0; d4=0; d5=0; d6=0;

declare -a rolls
decalre -A diceface
diceface=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0)


while [[ $count<1 ]]; do
	roll=$(($((RANDOM%7))+1))

	case $roll in
		1)
			diceface[1]=$((${diceface[1]}+1)) ;;
		2) 		
			diceface[2]=$((${diceface[2]}+1)) ;;
		3)
			diceface[3]=$((${diceface[3]}+1)) ;;
		4)
			diceface[4]=$((${diceface[4]}+1)) ;;
		5)
			diceface[5]=$((${diceface[5]}+1)) ;;
		6)
			diceface[6]=$((${diceface[6]}+1)) ;;
	esac

	rolls[z]=$roll
	z=$((z+1))

	if [[ ${diceface[1]} -eq 10 || ${diceface[2]} -eq 10 || ${diceface[3]} -eq 10 || ${diceface[4]} -eq 10 || ${diceface[5]} -eq 10 || ${diceface[6]} -eq 10 ]]; then
		count=1
 	fi
done

max=10; min=100;
for i in "${!diceface[@]}"; do
	if [[ $min > ${diceface[$i]} ]]; then
		min=${diceface[$i]}
	fi
done


echo ""
echo "Generating dice rolls : "
echo ${rolls[@]}



echo ""
for key in "${!diceface[@]}"; do
    echo "Occurrence of face $key - ${diceface[$key]} times"
done

echo ""

for key in "${!diceface[@]}"; do
	if [[ ${diceface[$key]} -eq $max ]]; then
		minface=$key
	elif [[ ${diceface[$key]} -eq $min ]]; then
		maxface=$key
	fi
done

echo "Dice Face $maxface occurred maximum ie. 10 times."
echo "Dice Face $minface occurred minimum ie. $min times. "
echo ""
