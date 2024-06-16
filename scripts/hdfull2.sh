#!/bin/sh

echo hdfull test, be lucky space eater!

if [[ $1 ]] && [[ $1 -gt 0 ]] &&  [[ $1 -le 1024 ]]
then
	N=$1
else
	N=8
fi

echo creating $N files each 1M size.. 

for i in $(seq 0 $N) 
do
#	echo data$i
	
	dd if=/dev/urandom of="rnd_$i.bin" bs=64K count=16 > /dev/null 2>&1

done

echo ..done



