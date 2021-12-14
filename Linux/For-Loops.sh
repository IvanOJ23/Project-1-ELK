#!/bin/bash

#Favorite States
states=(
	'Texas'
	'Florida'
	'California'
	'Hawaii'
	'New_York'
)
for n in ${states[@]}
do
	if [ $n = 'Hawaii' ] 
	then 
		echo "Hawaii is the best!"
	else
		echo "I'm not fond of $n"
	fi
done

#List of Numbers
numbers=(
	'0'
	'1'
	'2'
	'3'
	'4'
	'5'
	'6'
	'7'
	'8'
	'9'
)
for numbers in ${numbers[@]}
do 	
	if [ $numbers = 3 ] || [ $numbers = 5 ] || [ $numbers = 7 ]
	then
	echo $numbers
	fi
done

ls_list=$(ls)

for item in ${ls_list[@]}
do 	
	echo $item
done

