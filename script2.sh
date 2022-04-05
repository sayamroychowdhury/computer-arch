#!/bin/bash  

num=$1  
day_num=$2
year_num=$3

arr=("Su" "Mo" "Tu" "We" "Th" "Fr" "Sa")

for i in $(seq 1 12)
do 
	d=$(ncal ${i} ${year_num} |\
	    grep ${arr[$((day_num - 1))]} |\
	    tr -s ' ' |\
	    cut -d ' ' -f $((num + 1)))	
	date --date="${year_num}-${i}-${d}" +"%A %d/%m/%Y"
done
