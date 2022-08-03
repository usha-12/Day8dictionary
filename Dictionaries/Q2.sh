declare -a dates  
declare -A monthcount  # Dictionary that stores the number of birthdays occurring
d=0; m=0; y=0;

months=(January February March April May June July August September October November December)

for (( i = 0; i < 12; i++ )); do
	monthcount[i]=0
done


for ((i=0;i<50;i=$((i+1)))) #Generating 50 dates of birth
do

	year_flag=$((RANDOM%2))
	if [[ ${year_flag} -eq 0 ]]; then
	    y=1992
	elif [[ ${year_flag} -eq 1 ]]; then
	    y=1993
	fi


	m=$(($((RANDOM%12))+1))


	if [[ $m -eq 1 || $m -eq 3 || $m -eq 5 || $m -eq 7 || $m -eq 8 || $m -eq 10 || $m -eq 12 ]]; then
	    d=$(($((RANDOM%31))+1)) # Months with 31 days

	elif [[ $m -eq 4 || $m -eq 6 || $m -eq 9 || $m -eq 11 ]]; then
	    d=$(($((RANDOM%30))+1)) # Months with 30 days

	else
	    d=$(($((RANDOM%28))+1)) # Months with 28 days

	fi


	datevalue="$d"/"$m"/"$y"

	dates[i]=$datevalue

	monthcount[$m-1]=$((${monthcount[$m-1]}+1))

done

echo "List of dates generated : "
echo ""
for key in "${!dates[@]}"; do
    echo "$((key+1))   ${dates[$key]}"
done
echo ""


for key in "${!monthcount[@]}"; do
    echo "Number of Birthdays in ${months[$key]} : ${monthcount[$key]}"
done
