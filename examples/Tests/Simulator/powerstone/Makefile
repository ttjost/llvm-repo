CC=clang
CFLAGS=

SRC=adpcm.c bcnt.c blit.c crc.c engine.c float/fir.c g3fax.c huff.c jpeg.c pocsag.c float/qurt.c ucbqsort.c v42.c # compress.c
OBJ:=$(patsubst %.c, %, $(SRC))

.PHONY: all

.c.o:
	$(CC) $(CFLAGS) $*.c -o $*

all: $(OBJ)
	tar cfz powerstone.tar.gz $(OBJ)

clean:
	rm -rf $(OBJ) powerstone.tar.gz
