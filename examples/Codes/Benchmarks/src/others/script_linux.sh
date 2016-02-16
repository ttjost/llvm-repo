#!/bin/bash

for (( i=1; i<=$2; i++ )); do
	j=3
	for (( j=0; j<4; j++ )); do
		/home/jost/Dropbox/Universidade/Mestrado/vex-3.43/bin/cc $1_v${i}_${j}.s -o $1_v${i}_${j}
		gcc $1_v${i}.c
		echo "***********************"
		echo "    Executing LLC: $1_v${i}_${j}"
		./$1_v${i}_${j} > llc.txt
		echo "    Executing Linux: $1_v${i}_${j}"
		./a.out > gcc.txt
		echo "Different?"
		diff gcc.txt llc.txt
		echo "***********************"
	done	
done
