UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	BINUTILS = ~/Dropbox/Universidade/Mestrado/rVEX/binutils-gdb-linux
else
	BINUTILS = ~/Dropbox/Universidade/Mestrado/rVEX/binutils-gdb-mac
endif
AS = $(BINUTILS)/gas/as-new
LD = $(BINUTILS)/ld/ld-new
ELF2VHD = $(BINUTILS)/binutils/elf2vhd


FRONTEND_CC = /Users/ttjost/build/Debug/bin/clang
BACKEND_CC = /Users/ttjost/build/Debug/bin/llc
LLCFLAGS_2I = -mcpu=rvex-2issue -march=vex -disable-vex-misched=true -enable-vliw-scheduling -filetype=asm
LLCFLAGS_4I = -mcpu=rvex-4issue -march=vex -disable-vex-misched=true -enable-vliw-scheduling -filetype=asm
LLCFLAGS_8I = -mcpu=rvex-8issue -march=vex -disable-vex-misched=true -enable-vliw-scheduling -filetype=asm
LLCFLAGS_GEN = -generic-binary=true -march=vex -disable-vex-misched=true -enable-vliw-scheduling -filetype=asm
CFLAGS0 = --target=i386-unknown-gnu-linux -c -m32 -O0 -emit-llvm -S
CFLAGS1 = --target=i386-unknown-gnu-linux -c -m32 -O1 -emit-llvm -S
CFLAGS2 = --target=i386-unknown-gnu-linux -c -m32 -O2 -emit-llvm -S
CFLAGS3 = --target=i386-unknown-gnu-linux -c -m32 -O3 -emit-llvm -S
ASFLAGS_2I = --issue 2 --borrow 1,0.0,1. --config 713
ASFLAGS_4I = --issue 4 --borrow 1,3.2,0.3,1.0,2. --config 5339
ASFLAGS_8I = --issue 8 --borrow 1,3.0,2.1,3.2,4.3,5.4,6.5,7.6,4. --config 93333335
ASFLAGS_GEN = --issue 8 --borrow 1.0.3.2.5.4.7.6. --config fbfbfbfb -u --autosplit --padding 2

SCRIPT_DIR = /home/jost/Dropbox/Universidade/Mestrado/rVEX/rvex-2.0/

SRCDIR = ./src
EXECUTABLE_DIR = ./Executable
ASSEMBLY_DIR = ./Assembly
BITCODE_DIR = ./Bitcode
MEMORY_DIR = ./Memory
OBJECT_DIR = ./Object
VHDL_DIR = ./VHDL
MEMORY_DIR = ./Memory
LOG_DIR = ./Logs

PWD = $(shell pwd)


BUILD  =   ./Executable

#EXECUTABLES = adpcm cjpeg dft itver2 matrix x264
EXECUTABLES = adpcm cjpeg itver2 matrix x264

empty:=
run_string:= run-
vhd_string:= vhd-
hex_string:= hex-

.SUFFIXES:
#.PRECIOUS: %.o %.ll %.s
.PRECIOUS: %.ll %.s

.PHONY: all
all: $(EXECUTABLES)

#_start.s: $(SRCDIR)/_start.s
#	cp $^ $@

%.o:
	# 2 Issue
	# $(AS) $(ASFLAGS_2I) $(ASSEMBLY_DIR)/Issue2/$(basename $<)O0.s -o $(OBJECT_DIR)/Issue2/$(basename $@)O0.o
	# $(AS) $(ASFLAGS_2I) $(ASSEMBLY_DIR)/Issue2/$(basename $<)O1.s -o $(OBJECT_DIR)/Issue2/$(basename $@)O1.o
	# $(AS) $(ASFLAGS_2I) $(ASSEMBLY_DIR)/Issue2/$(basename $<)O2.s -o $(OBJECT_DIR)/Issue2/$(basename $@)O2.o
	# $(AS) $(ASFLAGS_2I) $(ASSEMBLY_DIR)/Issue2/$(basename $<)O3.s -o $(OBJECT_DIR)/Issue2/$(basename $@)O3.o
	# 4 Issue
	$(AS) $(ASFLAGS_4I) $(ASSEMBLY_DIR)/Issue4/$(basename $@)O0.s -o $(OBJECT_DIR)/Issue4/$(basename $@)O0.o
#	$(AS) $(ASFLAGS_4I) $(ASSEMBLY_DIR)/Issue4/$(basename $@)O1.s -o $(OBJECT_DIR)/Issue4/$(basename $@)O1.o
	$(AS) $(ASFLAGS_4I) $(ASSEMBLY_DIR)/Issue4/$(basename $@)O2.s -o $(OBJECT_DIR)/Issue4/$(basename $@)O2.o
	$(AS) $(ASFLAGS_4I) $(ASSEMBLY_DIR)/Issue4/$(basename $@)O3.s -o $(OBJECT_DIR)/Issue4/$(basename $@)O3.o
	# 8 Issue
	$(AS) $(ASFLAGS_8I) $(ASSEMBLY_DIR)/Issue8/$(basename $@)O0.s -o $(OBJECT_DIR)/Issue8/$(basename $@)O0.o
	$(AS) $(ASFLAGS_8I) $(ASSEMBLY_DIR)/Issue8/$(basename $@)O1.s -o $(OBJECT_DIR)/Issue8/$(basename $@)O1.o
	$(AS) $(ASFLAGS_8I) $(ASSEMBLY_DIR)/Issue8/$(basename $@)O2.s -o $(OBJECT_DIR)/Issue8/$(basename $@)O2.o
	$(AS) $(ASFLAGS_8I) $(ASSEMBLY_DIR)/Issue8/$(basename $@)O3.s -o $(OBJECT_DIR)/Issue8/$(basename $@)O3.o
	# Generic
	$(AS) $(ASFLAGS_GEN) $(ASSEMBLY_DIR)/Generic/$(basename $@)O0.s -o $(OBJECT_DIR)/Generic/$(basename $@)O0.o
	$(AS) $(ASFLAGS_GEN) $(ASSEMBLY_DIR)/Generic/$(basename $@)O1.s -o $(OBJECT_DIR)/Generic/$(basename $@)O1.o
	$(AS) $(ASFLAGS_GEN) $(ASSEMBLY_DIR)/Generic/$(basename $@)O2.s -o $(OBJECT_DIR)/Generic/$(basename $@)O2.o
	$(AS) $(ASFLAGS_GEN) $(ASSEMBLY_DIR)/Generic/$(basename $@)O3.s -o $(OBJECT_DIR)/Generic/$(basename $@)O3.o


%: %.o
	# 2 Issue
	# $(LD) _start.o $(OBJECT_DIR)/Issue2/$(basename $<)O0.o -o $(EXECUTABLE_DIR)/Issue2/$(basename $<)O0
	# $(LD) _start.o $(OBJECT_DIR)/Issue2/$(basename $<)O1.o -o $(EXECUTABLE_DIR)/Issue2/$(basename $<)O1
	# $(LD) _start.o $(OBJECT_DIR)/Issue2/$(basename $<)O2.o -o $(EXECUTABLE_DIR)/Issue2/$(basename $<)O2
	# $(LD) _start.o $(OBJECT_DIR)/Issue2/$(basename $<)O3.o -o $(EXECUTABLE_DIR)/Issue2/$(basename $<)O3
	# 4 Issue
	$(LD) $(OBJECT_DIR)/Issue4/$(basename $<)O0.o _start.o -o $(EXECUTABLE_DIR)/Issue4/$(basename $<)O0
#	$(LD) $(OBJECT_DIR)/Issue4/$(basename $<)O1.o _start.o -o $(EXECUTABLE_DIR)/Issue4/$(basename $<)O1
	$(LD) $(OBJECT_DIR)/Issue4/$(basename $<)O2.o _start.o -o $(EXECUTABLE_DIR)/Issue4/$(basename $<)O2
	$(LD) $(OBJECT_DIR)/Issue4/$(basename $<)O3.o _start.o -o $(EXECUTABLE_DIR)/Issue4/$(basename $<)O3
	# 8 Issue
	$(LD) $(OBJECT_DIR)/Issue8/$(basename $<)O0.o _start.o -o $(EXECUTABLE_DIR)/Issue8/$(basename $<)O0
	$(LD) $(OBJECT_DIR)/Issue8/$(basename $<)O1.o _start.o -o $(EXECUTABLE_DIR)/Issue8/$(basename $<)O1
	$(LD) $(OBJECT_DIR)/Issue8/$(basename $<)O2.o _start.o -o $(EXECUTABLE_DIR)/Issue8/$(basename $<)O2
	$(LD) $(OBJECT_DIR)/Issue8/$(basename $<)O3.o _start.o -o $(EXECUTABLE_DIR)/Issue8/$(basename $<)O3
	# Generic
	$(LD) $(OBJECT_DIR)/Generic/$(basename $<)O0.o _start.o -o $(EXECUTABLE_DIR)/Generic/$(basename $<)O0
	$(LD) $(OBJECT_DIR)/Generic/$(basename $<)O1.o _start.o -o $(EXECUTABLE_DIR)/Generic/$(basename $<)O1
	$(LD) $(OBJECT_DIR)/Generic/$(basename $<)O2.o _start.o -o $(EXECUTABLE_DIR)/Generic/$(basename $<)O2
	$(LD) $(OBJECT_DIR)/Generic/$(basename $<)O3.o _start.o -o $(EXECUTABLE_DIR)/Generic/$(basename $<)O3


#$(basename $@)

.PHONY: Assembly
Assembly: $(EXECUTABLES)

%.s: %.ll
	# 2 Issue
	$(BACKEND_CC) $(LLCFLAGS_2I) $(BITCODE_DIR)/$(basename $<)O0.ll -o $(ASSEMBLY_DIR)/Issue2/$(basename $@)O0.s
	$(BACKEND_CC) $(LLCFLAGS_2I) $(BITCODE_DIR)/$(basename $<)O1.ll -o $(ASSEMBLY_DIR)/Issue2/$(basename $@)O1.s
	$(BACKEND_CC) $(LLCFLAGS_2I) $(BITCODE_DIR)/$(basename $<)O2.ll -o $(ASSEMBLY_DIR)/Issue2/$(basename $@)O2.s
	$(BACKEND_CC) $(LLCFLAGS_2I) $(BITCODE_DIR)/$(basename $<)O3.ll -o $(ASSEMBLY_DIR)/Issue2/$(basename $@)O3.s
	# 4 Issue
	$(BACKEND_CC) $(LLCFLAGS_4I) $(BITCODE_DIR)/$(basename $<)O0.ll -o $(ASSEMBLY_DIR)/Issue4/$(basename $@)O0.s
#	$(BACKEND_CC) $(LLCFLAGS_4I) $(BITCODE_DIR)/$(basename $<)O1.ll -o $(ASSEMBLY_DIR)/Issue4/$(basename $@)O1.s
	$(BACKEND_CC) $(LLCFLAGS_4I) $(BITCODE_DIR)/$(basename $<)O2.ll -o $(ASSEMBLY_DIR)/Issue4/$(basename $@)O2.s
	$(BACKEND_CC) $(LLCFLAGS_4I) $(BITCODE_DIR)/$(basename $<)O3.ll -o $(ASSEMBLY_DIR)/Issue4/$(basename $@)O3.s
	# 8 Issue
	$(BACKEND_CC) $(LLCFLAGS_8I) $(BITCODE_DIR)/$(basename $<)O0.ll -o $(ASSEMBLY_DIR)/Issue8/$(basename $@)O0.s
	$(BACKEND_CC) $(LLCFLAGS_8I) $(BITCODE_DIR)/$(basename $<)O1.ll -o $(ASSEMBLY_DIR)/Issue8/$(basename $@)O1.s
	$(BACKEND_CC) $(LLCFLAGS_8I) $(BITCODE_DIR)/$(basename $<)O2.ll -o $(ASSEMBLY_DIR)/Issue8/$(basename $@)O2.s
	$(BACKEND_CC) $(LLCFLAGS_8I) $(BITCODE_DIR)/$(basename $<)O3.ll -o $(ASSEMBLY_DIR)/Issue8/$(basename $@)O3.s
	# Generic Binary
	$(BACKEND_CC) $(LLCFLAGS_GEN) $(BITCODE_DIR)/$(basename $<)O0.ll -o $(ASSEMBLY_DIR)/Generic/$(basename $@)O0.s
	$(BACKEND_CC) $(LLCFLAGS_GEN) $(BITCODE_DIR)/$(basename $<)O1.ll -o $(ASSEMBLY_DIR)/Generic/$(basename $@)O1.s
	$(BACKEND_CC) $(LLCFLAGS_GEN) $(BITCODE_DIR)/$(basename $<)O2.ll -o $(ASSEMBLY_DIR)/Generic/$(basename $@)O2.s
	$(BACKEND_CC) $(LLCFLAGS_GEN) $(BITCODE_DIR)/$(basename $<)O3.ll -o $(ASSEMBLY_DIR)/Generic/$(basename $@)O3.s


.PHONY: Bitcode
Bitcode: $(EXECUTABLES)

%.ll: %.c
	$(FRONTEND_CC) $(CFLAGS0) $< -o $(BITCODE_DIR)/$(basename $@)O0.ll
	$(FRONTEND_CC) $(CFLAGS1) $< -o $(BITCODE_DIR)/$(basename $@)O1.ll
	$(FRONTEND_CC) $(CFLAGS2) $< -o $(BITCODE_DIR)/$(basename $@)O2.ll
	$(FRONTEND_CC) $(CFLAGS3) $< -o $(BITCODE_DIR)/$(basename $@)O3.ll

.PHONY: run
run: $(EXECUTABLES:%=run-%)

run-% :
	# # 2 Issue
	# cat $(MEMORY_DIR)/Issue2/d_$(subst $(run_string),$(empty),$@)O0.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue2/i_$(subst $(run_string),$(empty),$@)O0.hex > i_mem.hex
	#$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue2/$(subst $(run_string),$(empty),$@)O0
	# cat $(MEMORY_DIR)/Issue2/d_$(subst $(run_string),$(empty),$@)O1.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue2/i_$(subst $(run_string),$(empty),$@)O1.hex > i_mem.hex
	#$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue2/$(subst $(run_string),$(empty),$@)O1
	# cat $(MEMORY_DIR)/Issue2/d_$(subst $(run_string),$(empty),$@)O2.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue2/i_$(subst $(run_string),$(empty),$@)O2.hex > i_mem.hex
	#$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue2/$(subst $(run_string),$(empty),$@)O2
	# cat $(MEMORY_DIR)/Issue2/d_$(subst $(run_string),$(empty),$@)O3.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue2/i_$(subst $(run_string),$(empty),$@)O3.hex > i_mem.hex
	#$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue2/$(subst $(run_string),$(empty),$@)O3
	# 4 Issue
	cat $(MEMORY_DIR)/Issue4/d_$(subst $(run_string),$(empty),$@)O0.hex > d_mem.hex
	cat $(MEMORY_DIR)/Issue4/i_$(subst $(run_string),$(empty),$@)O0.hex > i_mem.hex
	$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue4/$(subst $(run_string),$(empty),$@)O0
#	cat $(MEMORY_DIR)/Issue4/d_$(subst $(run_string),$(empty),$@)O1.hex > d_mem.hex
#	cat $(MEMORY_DIR)/Issue4/i_$(subst $(run_string),$(empty),$@)O1.hex > i_mem.hex
#	$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue4/$(subst $(run_string),$(empty),$@)O1
	cat $(MEMORY_DIR)/Issue4/d_$(subst $(run_string),$(empty),$@)O2.hex > d_mem.hex
	cat $(MEMORY_DIR)/Issue4/i_$(subst $(run_string),$(empty),$@)O2.hex > i_mem.hex
	$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue4/$(subst $(run_string),$(empty),$@)O2
	cat $(MEMORY_DIR)/Issue4/d_$(subst $(run_string),$(empty),$@)O3.hex > d_mem.hex
	cat $(MEMORY_DIR)/Issue4/i_$(subst $(run_string),$(empty),$@)O3.hex > i_mem.hex
	$(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue4/$(subst $(run_string),$(empty),$@)O3
	# # 8 Issue
	# cat $(MEMORY_DIR)/Issue8/d_$(subst $(run_string),$(empty),$@)O0.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue8/i_$(subst $(run_string),$(empty),$@)O0.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue8/$(subst $(run_string),$(empty),$@)O0
	# cat $(MEMORY_DIR)/Issue8/d_$(subst $(run_string),$(empty),$@)O1.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue8/i_$(subst $(run_string),$(empty),$@)O1.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue8/$(subst $(run_string),$(empty),$@)O1
	# cat $(MEMORY_DIR)/Issue8/d_$(subst $(run_string),$(empty),$@)O2.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue8/i_$(subst $(run_string),$(empty),$@)O2.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue8/$(subst $(run_string),$(empty),$@)O2
	# cat $(MEMORY_DIR)/Issue8/d_$(subst $(run_string),$(empty),$@)O3.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Issue8/i_$(subst $(run_string),$(empty),$@)O3.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Issue8/$(subst $(run_string),$(empty),$@)O3
	# # Generic
	# cat $(MEMORY_DIR)/Generic/d_$(subst $(run_string),$(empty),$@)O0.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Generic/i_$(subst $(run_string),$(empty),$@)O0.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Generic/$(subst $(run_string),$(empty),$@)O0
	# cat $(MEMORY_DIR)/Generic/d_$(subst $(run_string),$(empty),$@)O1.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Generic/i_$(subst $(run_string),$(empty),$@)O1.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Generic/$(subst $(run_string),$(empty),$@)O1
	# cat $(MEMORY_DIR)/Generic/d_$(subst $(run_string),$(empty),$@)O2.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Generic/i_$(subst $(run_string),$(empty),$@)O2.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Generic/$(subst $(run_string),$(empty),$@)O2
	# cat $(MEMORY_DIR)/Generic/d_$(subst $(run_string),$(empty),$@)O3.hex > d_mem.hex
	# cat $(MEMORY_DIR)/Generic/i_$(subst $(run_string),$(empty),$@)O3.hex > i_mem.hex
	# $(SCRIPT_DIR)/simulation.do  $(LOG_DIR)/Generic/$(subst $(run_string),$(empty),$@)O3

vhd-% :
	# # 2 Issue
	# $(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue2/$(subst $(vhd_string),$(empty),$@)O0
	# mv d_mem.vhd $(VHDL_DIR)/Issue2/d_$(subst $(vhd_string),$(empty),$@)O0.vhd
	# mv i_mem.vhd $(VHDL_DIR)/Issue2/i_$(subst $(vhd_string),$(empty),$@)O0.vhd
	# $(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue2/$(subst $(vhd_string),$(empty),$@)O1
	# mv d_mem.vhd $(VHDL_DIR)/Issue2/d_$(subst $(vhd_string),$(empty),$@)O1.vhd
	# mv i_mem.vhd $(VHDL_DIR)/Issue2/i_$(subst $(vhd_string),$(empty),$@)O1.vhd
	# $(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue2/$(subst $(vhd_string),$(empty),$@)O2
	# mv d_mem.vhd $(VHDL_DIR)/Issue2/d_$(subst $(vhd_string),$(empty),$@)O2.vhd
	# mv i_mem.vhd $(VHDL_DIR)/Issue2/i_$(subst $(vhd_string),$(empty),$@)O2.vhd
	# $(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue2/$(subst $(vhd_string),$(empty),$@)O3
	# mv d_mem.vhd $(VHDL_DIR)/Issue2/d_$(subst $(vhd_string),$(empty),$@)O3.vhd
	# mv i_mem.vhd $(VHDL_DIR)/Issue2/i_$(subst $(vhd_string),$(empty),$@)O3.vhd
	# 4 Issue
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue4/$(subst $(vhd_string),$(empty),$@)O0
	mv d_mem.vhd $(VHDL_DIR)/Issue4/d_$(subst $(vhd_string),$(empty),$@)O0.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue4/i_$(subst $(vhd_string),$(empty),$@)O0.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue4/$(subst $(vhd_string),$(empty),$@)O1
	mv d_mem.vhd $(VHDL_DIR)/Issue4/d_$(subst $(vhd_string),$(empty),$@)O1.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue4/i_$(subst $(vhd_string),$(empty),$@)O1.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue4/$(subst $(vhd_string),$(empty),$@)O2
	mv d_mem.vhd $(VHDL_DIR)/Issue4/d_$(subst $(vhd_string),$(empty),$@)O2.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue4/i_$(subst $(vhd_string),$(empty),$@)O2.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue4/$(subst $(vhd_string),$(empty),$@)O3
	mv d_mem.vhd $(VHDL_DIR)/Issue4/d_$(subst $(vhd_string),$(empty),$@)O3.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue4/i_$(subst $(vhd_string),$(empty),$@)O3.vhd
	# 8 Issue
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue8/$(subst $(vhd_string),$(empty),$@)O0
	mv d_mem.vhd $(VHDL_DIR)/Issue8/d_$(subst $(vhd_string),$(empty),$@)O0.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue8/i_$(subst $(vhd_string),$(empty),$@)O0.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue8/$(subst $(vhd_string),$(empty),$@)O1
	mv d_mem.vhd $(VHDL_DIR)/Issue8/d_$(subst $(vhd_string),$(empty),$@)O1.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue8/i_$(subst $(vhd_string),$(empty),$@)O1.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue8/$(subst $(vhd_string),$(empty),$@)O2
	mv d_mem.vhd $(VHDL_DIR)/Issue8/d_$(subst $(vhd_string),$(empty),$@)O2.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue8/i_$(subst $(vhd_string),$(empty),$@)O2.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Issue8/$(subst $(vhd_string),$(empty),$@)O3
	mv d_mem.vhd $(VHDL_DIR)/Issue8/d_$(subst $(vhd_string),$(empty),$@)O3.vhd
	mv i_mem.vhd $(VHDL_DIR)/Issue8/i_$(subst $(vhd_string),$(empty),$@)O3.vhd
	# Generic
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Generic/$(subst $(vhd_string),$(empty),$@)O0
	mv d_mem.vhd $(VHDL_DIR)/Generic/d_$(subst $(vhd_string),$(empty),$@)O0.vhd
	mv i_mem.vhd $(VHDL_DIR)/Generic/i_$(subst $(vhd_string),$(empty),$@)O0.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Generic/$(subst $(vhd_string),$(empty),$@)O1
	mv d_mem.vhd $(VHDL_DIR)/Generic/d_$(subst $(vhd_string),$(empty),$@)O1.vhd
	mv i_mem.vhd $(VHDL_DIR)/Generic/i_$(subst $(vhd_string),$(empty),$@)O1.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Generic/$(subst $(vhd_string),$(empty),$@)O2
	mv d_mem.vhd $(VHDL_DIR)/Generic/d_$(subst $(vhd_string),$(empty),$@)O2.vhd
	mv i_mem.vhd $(VHDL_DIR)/Generic/i_$(subst $(vhd_string),$(empty),$@)O2.vhd
	$(ELF2VHD) --vhd $(EXECUTABLE_DIR)/Generic/$(subst $(vhd_string),$(empty),$@)O3
	mv d_mem.vhd $(VHDL_DIR)/Generic/d_$(subst $(vhd_string),$(empty),$@)O3.vhd
	mv i_mem.vhd $(VHDL_DIR)/Generic/i_$(subst $(vhd_string),$(empty),$@)O3.vhd

hex-% :
	# # 2 Issue
	# $(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue2/$(subst $(hex_string),$(empty),$@)O0
	# mv d_mem.hex $(MEMORY_DIR)/Issue2/d_$(subst $(hex_string),$(empty),$@)O0.hex
	# mv i_mem.hex $(MEMORY_DIR)/Issue2/i_$(subst $(hex_string),$(empty),$@)O0.hex
	# $(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue2/$(subst $(hex_string),$(empty),$@)O1
	# mv d_mem.hex $(MEMORY_DIR)/Issue2/d_$(subst $(hex_string),$(empty),$@)O1.hex
	# mv i_mem.hex $(MEMORY_DIR)/Issue2/i_$(subst $(hex_string),$(empty),$@)O1.hex
	# $(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue2/$(subst $(hex_string),$(empty),$@)O2
	# mv d_mem.hex $(MEMORY_DIR)/Issue2/d_$(subst $(hex_string),$(empty),$@)O2.hex
	# mv i_mem.hex $(MEMORY_DIR)/Issue2/i_$(subst $(hex_string),$(empty),$@)O2.hex
	# $(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue2/$(subst $(hex_string),$(empty),$@)O3
	# mv d_mem.hex $(MEMORY_DIR)/Issue2/d_$(subst $(hex_string),$(empty),$@)O3.hex
	# mv i_mem.hex $(MEMORY_DIR)/Issue2/i_$(subst $(hex_string),$(empty),$@)O3.hex
	# 4 Issue
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue4/$(subst $(hex_string),$(empty),$@)O0
	mv d_mem.hex $(MEMORY_DIR)/Issue4/d_$(subst $(hex_string),$(empty),$@)O0.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue4/i_$(subst $(hex_string),$(empty),$@)O0.hex
#	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue4/$(subst $(hex_string),$(empty),$@)O1
#	mv d_mem.hex $(MEMORY_DIR)/Issue4/d_$(subst $(hex_string),$(empty),$@)O1.hex
#	mv i_mem.hex $(MEMORY_DIR)/Issue4/i_$(subst $(hex_string),$(empty),$@)O1.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue4/$(subst $(hex_string),$(empty),$@)O2
	mv d_mem.hex $(MEMORY_DIR)/Issue4/d_$(subst $(hex_string),$(empty),$@)O2.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue4/i_$(subst $(hex_string),$(empty),$@)O2.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue4/$(subst $(hex_string),$(empty),$@)O3
	mv d_mem.hex $(MEMORY_DIR)/Issue4/d_$(subst $(hex_string),$(empty),$@)O3.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue4/i_$(subst $(hex_string),$(empty),$@)O3.hex
	# 8 Issue
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue8/$(subst $(hex_string),$(empty),$@)O0
	mv d_mem.hex $(MEMORY_DIR)/Issue8/d_$(subst $(hex_string),$(empty),$@)O0.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue8/i_$(subst $(hex_string),$(empty),$@)O0.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue8/$(subst $(hex_string),$(empty),$@)O1
	mv d_mem.hex $(MEMORY_DIR)/Issue8/d_$(subst $(hex_string),$(empty),$@)O1.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue8/i_$(subst $(hex_string),$(empty),$@)O1.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue8/$(subst $(hex_string),$(empty),$@)O2
	mv d_mem.hex $(MEMORY_DIR)/Issue8/d_$(subst $(hex_string),$(empty),$@)O2.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue8/i_$(subst $(hex_string),$(empty),$@)O2.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Issue8/$(subst $(hex_string),$(empty),$@)O3
	mv d_mem.hex $(MEMORY_DIR)/Issue8/d_$(subst $(hex_string),$(empty),$@)O3.hex
	mv i_mem.hex $(MEMORY_DIR)/Issue8/i_$(subst $(hex_string),$(empty),$@)O3.hex
	# Generic
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Generic/$(subst $(hex_string),$(empty),$@)O0
	mv d_mem.hex $(MEMORY_DIR)/Generic/d_$(subst $(hex_string),$(empty),$@)O0.hex
	mv i_mem.hex $(MEMORY_DIR)/Generic/i_$(subst $(hex_string),$(empty),$@)O0.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Generic/$(subst $(hex_string),$(empty),$@)O1
	mv d_mem.hex $(MEMORY_DIR)/Generic/d_$(subst $(hex_string),$(empty),$@)O1.hex
	mv i_mem.hex $(MEMORY_DIR)/Generic/i_$(subst $(hex_string),$(empty),$@)O1.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Generic/$(subst $(hex_string),$(empty),$@)O2
	mv d_mem.hex $(MEMORY_DIR)/Generic/d_$(subst $(hex_string),$(empty),$@)O2.hex
	mv i_mem.hex $(MEMORY_DIR)/Generic/i_$(subst $(hex_string),$(empty),$@)O2.hex
	$(ELF2VHD) --hex $(EXECUTABLE_DIR)/Generic/$(subst $(hex_string),$(empty),$@)O3
	mv d_mem.hex $(MEMORY_DIR)/Generic/d_$(subst $(hex_string),$(empty),$@)O3.hex
	mv i_mem.hex $(MEMORY_DIR)/Generic/i_$(subst $(hex_string),$(empty),$@)O3.hex

.PHONY: clean
clean:
	$(RM) $(EXECUTABLES) *.o *.s *.vhd *.h *.hex *.map
