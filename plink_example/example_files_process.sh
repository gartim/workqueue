#!/bin/bash
while [ 1 ]
do
	a=(`wqpop gq`) 
	if [[ ! ${a[0]} ]]; then 
		sleep 3
	elif [[ "${a[0]}" == "end" ]]; then
		exit
	else
		echo ${a[*]}
		plink --file ${a[0]} --out ${a[0]} ${a[1]}
	fi
done
