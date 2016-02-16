#!/bin/bash


for (( j=$2; j<=$3; j++ )); do
		/Users/ttjost/build/Debug/bin/clang --target=i386-unknown-gnu-linux -c -m32 -O${j} -emit-llvm -S $1.c -o $1_${j}.ll
		llc -march=vex -mcpu=$4 -filetype=asm $1_${j}.ll -o $1_${j}.s
		sed -i -e 's/\.rodata.*/\.data/g' $1_${j}.s
		sed -i -e 's/\.bss.*/\.bss \.section \.data/g' $1_${j}.s
		sed -i -e 's/\.comm/\.section \.data  \.comm /g' $1_${j}.s
		echo '.import printf' >> $1_${j}.s
		echo '.type printf, @function' >> $1_${j}.s
		echo '.import puts' >> $1_${j}.s
		echo '.type puts, @function' >> $1_${j}.s
done
