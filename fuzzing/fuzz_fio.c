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
    // The size of the data should exceed the length of the header
    if (Size >= sizeof(header_t)){
        header_t * header = (header_t *) Data;

        uint8_t* data = (uint8_t *)(Data + sizeof(*header));

        handler_fn_t* handlerFn = lookupHandler(header->ins);
        handlerFn(header->p1, header->p2, data, header->lc, true);
    }
    
    return 0;
}