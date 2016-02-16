#include <stddef.h>
#include <stdint.h>

void* memset (void* b, int c, size_t len) {
    void *bb = b;

    {
        uint8_t *bc;
        for(bc = bb; ((size_t) bc) & 0x3 && len > 0; len--, bc++) {
            *bc = c;
        }
        bb = bc;
    }

    if (len > 3) {
        uint32_t ci = c << 24 | c << 16 | c << 8 | c;
        uint32_t *bi;
        for(bi = bb; len > 3; len -= 4, bi++) {
            *bi = ci;
        }
        bb = bi;
    }

    {
        uint8_t *bc;
        for (bc = bb; len > 0; len--, bc++) {
            *bc = c;
        }
    }

    return b;
}
