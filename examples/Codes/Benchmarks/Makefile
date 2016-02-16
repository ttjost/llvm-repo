

CC = llc
CFLAGS=-march=vex -enable-vliw-scheduling -filetype=asm

FILES = adpcm cjpeg dft matrix x264

SOURCES = $(FILES:=.ll)
OBJECTS = $(FILES:=.s)

all: $(OBJECTS)
	
$(OBJECTS) : $(SOURCES)
	  $(CC) $(CFLAGS) $<_printO0.ll -o %@_printO0.s
	  $(CC) $(CFLAGS) $<_printO3.ll -o %@_printO3.s
