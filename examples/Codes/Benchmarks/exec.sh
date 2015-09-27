#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: $0 <Benchmark1> <Benchmark2> ... "; exit 1; }

BENCHMARKS=($@)

echo "****************************************"
echo "  Benchmarks:"
for arg in "${BENCHMARKS[@]}"; do
   echo -e "\t$arg"
done
echo "****************************************"

TYPES=(32 64)
TARGETS=(mips-unknown-linux-gnu mips64-unknown-linux-gnu)
OPT=(O0 O3)
LLVM_BIN_PATH=~/llvm_build/build/bin
VEX_BIN_PATH=~/vex-3.43/bin

FOLDER=./tmp

export PATH=${PATH}:${LLVM_BIN_PATH}
rm tmp.txt

for i in ${BENCHMARKS[@]}; do
	for (( j=0; j<${#TYPES[@]}; j++ )); do
		for k in ${OPT[@]}; do
			# Generate Front-end file with CLANG
			if [ ! -a ${FOLDER}/${i}_${TYPES[$j]}_$k.ll ]
			then
				echo "CLANG: Creating file ${i}_${TYPES[$j]}_$k.ll "
				clang -target ${TARGETS[$j]} -c $i.c -$k -emit-llvm -S -o ${FOLDER}/${i}_${TYPES[$j]}_$k.ll &> tmp.txt

				if [ -s tmp.txt ]
				then
        			echo "CLANG Error: Failed to create ${i}_${TYPES[$j]}_$k.ll. Check tmp.txt file"
					cat tmp.txt
					exit
				else
				    echo "CLANG: OK"
				    # do something as file is empty
				fi
			fi
	
			# Generate Assembly with LLC
			if [ ! -a ${FOLDER}/${i}_${TYPES[$j]}_$k.s ]; then
				echo "LLC: Creating file ${i}_${TYPES[$j]}_$k.s"
				llc -enable-vliw-scheduling -march=vex -filetype=asm ${FOLDER}/${i}_${TYPES[$j]}_$k.ll -o ${FOLDER}/${i}_${TYPES[$j]}_$k.s &> tmp.txt
				
				line=$(head -n 1 tmp.txt)
				if [[ -s tmp.txt &&  ! ${line} == "WARNING: No File Specified." ]] ; then
					echo "LLC Error: Failed to ${i}_${TYPES[$j]}_$k.s. Check tmp.txt file"
					exit
				else
					echo "LLC: OK"
					sed -i -e 's/\.rodata\..*/\.data/g' ${FOLDER}/${i}_${TYPES[$j]}_$k.s
					echo '.import printf' >> ${FOLDER}/${i}_${TYPES[$j]}_$k.s
					echo '.type printf, @function' >> ${FOLDER}/${i}_${TYPES[$j]}_$k.s
					echo '.import puts' >> ${FOLDER}/${i}_${TYPES[$j]}_$k.s
					echo '.type puts, @function' >> ${FOLDER}/${i}_${TYPES[$j]}_$k.s
				fi
			fi
		
			# Simulate Executable
			if [ ! -a ${FOLDER}/${i}_${TYPES[$j]}_$k.log ]; then
				echo "VEX CC: Executing benchmark ${i}_${TYPES[$j]}_$k.s"
				${VEX_BIN_PATH}/cc ${FOLDER}/${i}_${TYPES[$j]}_$k.s -o ${FOLDER}/${i}_${TYPES[$j]}_$k &> tmp.txt
				if [ -s tmp.txt ]; then
					echo "VEX CC Error: Failed to create executable for ${i}_${TYPES[$j]}_$k.s. Check tmp.txt file"
					exit
				else
					echo "VEX CC: OK"
					${FOLDER}/${i}_${TYPES[$j]}_$k > ${FOLDER}/${i}_${TYPES[$j]}_$k.log
					line=$(head -n 1 ${FOLDER}/${i}_${TYPES[$j]}_$k.log)
					if [ $line == "-1" ]; then
						echo "**********************************************************";
						echo "Success ${i}_${TYPES[$j]}_$k.s";
						echo "**********************************************************";
					else
						echo "*************  ERROR in ${i}_${TYPES[$j]}_$k.s **************"
					fi
				fi
			fi
		done
	done
done
