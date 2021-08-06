#include "common.h"
#include "handlers.h"

#include "getSerial.h"
#include "uiHelpers.h"
#include "state.h"
#include "hash.h"
#include "endian.h"


static ins_sign_transaction_context_t* ctx = &(instructionState.signTransactionContext);


void signTransaction_handleAPDU(
        uint8_t p1,
        uint8_t p2,
        uint8_t *wireDataBuffer,
        size_t wireDataSize,
        bool isNewCall 
)
{
	if (isNewCall) {
		explicit_bzero(ctx, SIZEOF(*ctx));
	}

    TRACE();
	VALIDATE(p1 == 0, ERR_INVALID_REQUEST_PARAMETERS);
	VALIDATE(p2 == 0, ERR_INVALID_REQUEST_PARAMETERS);
	TRACE();

	TRACE_BUFFER(wireDataBuffer, wireDataSize);
    TRACE("%d", wireDataSize);

	struct {
		uint8_t fee[8];
	}* wireData = (void*) wireDataBuffer;

	VALIDATE(SIZEOF(*wireData) == wireDataSize, ERR_INVALID_DATA);

//	ASSERT_TYPE(ctx->fee, uint64_t);
//	ctx->fee = u8be_read(wireData->fee);


    sha_256_init(&ctx->hashContext);
	sha_256_append(&ctx->hashContext, wireData->fee, SIZEOF(*wireData));
    uint8_t outBuf[32];
    sha_256_finalize(&ctx->hashContext, outBuf, SIZEOF(outBuf));

//    u8be_write(outBuf, ctx->fee);

	TRACE_BUFFER(outBuf, 32);

	io_send_buf(SUCCESS, outBuf, SIZEOF(outBuf));

    TRACE();

	ui_idle();

    TRACE();
}
