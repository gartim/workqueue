#!/bin/bash


wqdel gq
wqadd gq

file=/my/home/gartim/wq/plink_example/example.ped
COUNT=0
LIMIT=5
FILECOUNT=1
filescount=`ls pex* | awk 'END { print NR }'`  
if [ $filescount -gt 0 ]; then  
	\rm /my/home/gartim/wq/plink_example/pex*
fi
while IFS= read -r line
do
	((COUNT++))
	echo $line >>   pex$FILECOUNT.ped
	cp example.map  pex$FILECOUNT.map
	if [ "$((COUNT%$LIMIT))" -eq "0" ]; then
		wqpush gq pex$FILECOUNT "--hardy"
		((FILECOUNT++))
	fi
done < "$file"
wqpush gq end
wqlist gq
