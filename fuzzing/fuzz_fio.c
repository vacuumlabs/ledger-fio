#include "handlers.h"
#include "state.h"

#include <stdint.h>

static const int INS_NONE = -1;

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

        BEGIN_TRY {
            TRY {
                handler_fn_t* handlerFn = lookupHandler(header->ins);

                VALIDATE(handlerFn != NULL, ERR_UNKNOWN_INS);

                bool isNewCall = false;
                if (currentInstruction == INS_NONE) {
                    explicit_bzero(&instructionState, SIZEOF(instructionState));
                    isNewCall = true;
                    currentInstruction = header->ins;
                } else {
                    VALIDATE(header->ins == currentInstruction, ERR_STILL_IN_CALL);
                }

                handlerFn(header->p1, header->p2, data, header->lc, isNewCall);
            }
            CATCH_OTHER(e) {
            }
            FINALLY {
            }
        }
        END_TRY;
    }
    
    return 0;
}
