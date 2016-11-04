#!/bin/sh
llvm_build="/home/larissa/Desktop/drygin/llvm_2"
cc="/home/larissa/Desktop/drygin/vex/bin/"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied: <folder_name>"
    exit 1
fi
## rvex_examples, wcet_bench ##
bench=$1



for file in $1/*.c
do
tmp=$(basename $file)
i="${tmp%.*}"
$llvm_build/build/bin/clang -O3 -freg-struct-return -m32 -fno-gnu-inline-asm -ffinite-math-only $1/${i}.c -emit-llvm -S -o ${i}.ll
done

$llvm_build/build/bin/llvm-link *.ll -S -o link.ll

$llvm_build/build/bin/llc -march=vex -mcpu=rvex-4issue  link.ll -o ${bench}.s

./script.sh ${bench}.s

$cc/cc softfloat_sim.s ${bench}.s -o a

rm *.ll *.o ${bench}.s


	
