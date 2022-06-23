#include "handlers.h"

#include <stdint.h>

typedef struct {
    uint8_t cla;
    uint8_t ins;
    uint8_t p1;
    uint8_t p2;
    uint8_t lc;
} header_t;

int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {
    // the size of the data should not exceed the max size for lc + header size
    if (Size > sizeof(header_t) && Size < sizeof(header_t) + 0xff){
        header_t * header = (void *) Data;

        // Compute lc
        uint8_t lc = Size - (sizeof(header_t) - sizeof(uint8_t));
        header->lc = lc;

        uint8_t* data = (uint8_t *)(Data + sizeof(*header) - sizeof(uint8_t)); // remove size of lc

        handler_fn_t* handlerFn = lookupHandler(header->ins);
        handlerFn(header->p1, header->p2, data, header->lc, true);
    }

    return 0;
}
