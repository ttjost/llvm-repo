#!/bin/bash

	for (( j=$2; j<=$3; j++ )); do
		/home/jost/Dropbox/Universidade/Mestrado/vex-3.43/bin/cc $1_${j}.s -o $1_${j}
		echo "***********************"
		echo "    Executing LLC: $1_${j}"
		./$1_${j} > llc.txt
		echo "***********************"
	done	
