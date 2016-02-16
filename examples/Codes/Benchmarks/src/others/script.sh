#!/bin/bash


for (( i=1; i<=$2; i++ )); do
	j=3
	for (( j=0; j<4; j++ )); do
		/Users/ttjost/build/Debug/bin/clang --target=i386-unknown-gnu-linux -c -m32 -O${j} -emit-llvm -S $1_v${i}.c -o $1_v${i}_${j}.ll
		llc -march=vex -filetype=asm $1_v${i}_${j}.ll -o $1_v${i}_${j}.s
		sed -i -e 's/\.rodata.*/\.data/g' $1_v${i}_${j}.s
		sed -i -e 's/\.bss.*/\.bss \.section \.data/g' $1_v${i}_${j}.s
		sed -i -e 's/\.comm/\.section \.data  \.comm /g' $1_v${i}_${j}.s
		echo '.import printf' >> $1_v${i}_${j}.s
		echo '.type printf, @function' >> $1_v${i}_${j}.s
		echo '.import puts' >> $1_v${i}_${j}.s
		echo '.type puts, @function' >> $1_v${i}_${j}.s
	done	
done
