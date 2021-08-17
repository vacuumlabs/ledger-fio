#include "common.h"
#include "handlers.h"

#include "getSerial.h"
#include "state.h"
#include "hash.h"
#include "endian.h"
#include "eos_utils.h"
#include "securityPolicy.h"
#include "uiHelpers.h"

static ins_sign_transaction_context_t* ctx = &(instructionState.signTransactionContext);

typedef enum {
	SIGN_STAGE_NONE = 0,
	SIGN_STAGE_INIT = 23,
	SIGN_STAGE_FEE = 24,
	SIGN_STAGE_WITNESSES = 25,
} sign_tx_stage_t;

// this is supposed to be called at the beginning of each APDU handler
static inline void CHECK_STAGE(sign_tx_stage_t expected)
{
	TRACE("Checking stage... current one is %d, expected %d", ctx->stage, expected);
	VALIDATE(ctx->stage == expected, ERR_INVALID_STATE);
}

// advances the stage of the main state machine
static inline void advanceStage()
{
	TRACE("Advancing sign tx stage from: %d", ctx->stage);

	switch (ctx->stage) {

	case SIGN_STAGE_INIT:
		ctx->stage = SIGN_STAGE_FEE;
		break;

	case SIGN_STAGE_FEE:
		ctx->stage = SIGN_STAGE_WITNESSES;
		break;

	case SIGN_STAGE_WITNESSES:
		ctx->stage = SIGN_STAGE_NONE;
		ui_idle(); // we are done with this tx
		break;

	case SIGN_STAGE_NONE:
		THROW(ERR_INVALID_STATE);

	default:
		ASSERT(false);
	}

	TRACE("Advancing sign tx stage to: %d", ctx->stage);
}

void respondSuccessEmptyMsg()
{
	TRACE();
	io_send_buf(SUCCESS, NULL, 0);
	ui_displayBusy(); // needs to happen after I/O
}

uint8_t const SECP256K1_N[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
								0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe,
								0xba, 0xae, 0xdc, 0xe6, 0xaf, 0x48, 0xa0, 0x3b,
								0xbf, 0xd2, 0x5e, 0x8c, 0xd0, 0x36, 0x41, 0x41};

// ============================== INIT ==============================
enum {
	HANDLE_INIT_STEP_DISPLAY_DETAILS = 100,
	HANDLE_INIT_STEP_RESPOND,
	HANDLE_INIT_STEP_INVALID,
} ;

static void signTx_handleInit_ui_runStep()
{
	TRACE("UI step %d", ctx->ui_step);
	TRACE_STACK_USAGE();
	ui_callback_fn_t* this_fn = signTx_handleInit_ui_runStep;

	UI_STEP_BEGIN(ctx->ui_step, this_fn);

	UI_STEP(HANDLE_INIT_STEP_DISPLAY_DETAILS) {
		ui_displayPaginatedText(
				"Here will be",
				"ChainId",
				this_fn
		);
	}

	UI_STEP(HANDLE_INIT_STEP_RESPOND) {
		respondSuccessEmptyMsg();
		advanceStage();
	}

	UI_STEP_END(HANDLE_INIT_STEP_INVALID);
}

__noinline_due_to_stack__
void signTx_handleInitAPDU(uint8_t p2, uint8_t* wireDataBuffer, size_t wireDataSize) {
	TRACE_STACK_USAGE();
	{
		// sanity checks
		CHECK_STAGE(SIGN_STAGE_INIT);

		VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
		ASSERT(wireDataSize < BUFFER_SIZE_PARANOIA);
	}

    {
		// parse data
		TRACE_BUFFER(wireDataBuffer, wireDataSize);

		struct {
			uint8_t chainId[32];
		}* wireData = (void*) wireDataBuffer;

		TRACE("%d, %d, wireDataSize", SIZEOF(*wireData), wireDataSize);
		VALIDATE(SIZEOF(*wireData) == wireDataSize, ERR_INVALID_DATA);


    	TRACE("SHA_256_init");
	    sha_256_init(&ctx->hashContext);
    	TRACE("SHA_256_append");
		TRACE_BUFFER(wireData->chainId, SIZEOF(wireData->chainId))
		sha_256_append(&ctx->hashContext, wireData->chainId, SIZEOF(wireData->chainId));
	}
		
	security_policy_t policy = policyForSignTxInit();
	TRACE("Policy: %d", (int) policy);
	ENSURE_NOT_DENIED(policy);
	{
		// select UI steps
		switch (policy) {
#	define  CASE(POLICY, UI_STEP) case POLICY: {ctx->ui_step=UI_STEP; break;}
			CASE(POLICY_SHOW_BEFORE_RESPONSE, HANDLE_INIT_STEP_DISPLAY_DETAILS);
#	undef   CASE
		default:
			THROW(ERR_NOT_IMPLEMENTED);
		}
	}

	signTx_handleInit_ui_runStep();
}

// ============================== FEE ==============================
enum {
	HANDLE_FEE_STEP_DISPLAY_DETAILS = 200,
	HANDLE_FEE_STEP_RESPOND,
	HANDLE_FEE_STEP_INVALID,
} ;

static void signTx_handleFee_ui_runStep()
{
	TRACE("UI step %d", ctx->ui_step);
	TRACE_STACK_USAGE();
	ui_callback_fn_t* this_fn = signTx_handleFee_ui_runStep;

	UI_STEP_BEGIN(ctx->ui_step, this_fn);

	UI_STEP(HANDLE_FEE_STEP_DISPLAY_DETAILS) {
		ui_displayPaginatedText(
				"Here will be",
				"Fee",
				this_fn
		);
	}

	UI_STEP(HANDLE_FEE_STEP_RESPOND) {
		respondSuccessEmptyMsg();
		advanceStage();
	}

	UI_STEP_END(HANDLE_FEE_STEP_INVALID);
}

__noinline_due_to_stack__
void signTx_handleFeeAPDU(uint8_t p2, uint8_t* wireDataBuffer, size_t wireDataSize) {
	TRACE_STACK_USAGE();
	{
		// sanity checks
		CHECK_STAGE(SIGN_STAGE_FEE);

		VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
		ASSERT(wireDataSize < BUFFER_SIZE_PARANOIA);
	}

    {
		// parse data
		TRACE_BUFFER(wireDataBuffer, wireDataSize);

		struct {
			uint8_t fee[8];
		}* wireData = (void*) wireDataBuffer;

		VALIDATE(SIZEOF(*wireData) == wireDataSize, ERR_INVALID_DATA);

    	TRACE("SHA_256_append");
		TRACE_BUFFER(wireData->fee, SIZEOF(wireData->fee))
		sha_256_append(&ctx->hashContext, wireData->fee, SIZEOF(wireData->fee));
	}
		
	security_policy_t policy = policyForSignTxFee();
	TRACE("Policy: %d", (int) policy);
	ENSURE_NOT_DENIED(policy);
	{
		// select UI steps
		switch (policy) {
#	define  CASE(POLICY, UI_STEP) case POLICY: {ctx->ui_step=UI_STEP; break;}
			CASE(POLICY_SHOW_BEFORE_RESPONSE, HANDLE_FEE_STEP_DISPLAY_DETAILS);
#	undef   CASE
		default:
			THROW(ERR_NOT_IMPLEMENTED);
		}
	}

	signTx_handleFee_ui_runStep();
}

// ============================== WITNESS ==============================

enum {
	HANDLE_WITTNESSES_STEP_DISPLAY_DETAILS = 300,
	HANDLE_WITTNESSES_STEP_CONFIRM,
	HANDLE_WITTNESSES_STEP_RESPOND,
	HANDLE_WITTNESSES_STEP_INVALID,
} ;

static void signTx_handleWitnesses_ui_runStep()
{
	TRACE("UI step %d", ctx->ui_step);
	TRACE_STACK_USAGE();
	ui_callback_fn_t* this_fn = signTx_handleWitnesses_ui_runStep;

	UI_STEP_BEGIN(ctx->ui_step, this_fn);

	UI_STEP(HANDLE_WITTNESSES_STEP_DISPLAY_DETAILS) {
		ui_displayPaginatedText(
				"Here will be",
				"Path",
				this_fn
		);
	}

	UI_STEP(HANDLE_WITTNESSES_STEP_CONFIRM) {
		ui_displayPrompt(
		        "Sign",
		        "transaction?",
		        this_fn,
		        respond_with_user_reject
		);
	}

	UI_STEP(HANDLE_WITTNESSES_STEP_RESPOND) {
  	    io_send_buf(SUCCESS, G_io_apdu_buffer, 65 + 32);
		ui_displayBusy(); // needs to happen after I/O
		advanceStage();
	}

	UI_STEP_END(HANDLE_WITTNESSES_STEP_INVALID);
}

__noinline_due_to_stack__
void signTx_handleWitnessesAPDU(uint8_t p2, uint8_t* wireDataBuffer, size_t wireDataSize) {
	TRACE_STACK_USAGE();
	{
		// sanity checks
		CHECK_STAGE(SIGN_STAGE_WITNESSES);
		VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
		ASSERT(wireDataSize < BUFFER_SIZE_PARANOIA);
	}

	explicit_bzero(&ctx->path, SIZEOF(ctx->path));
	explicit_bzero(&ctx->signature, SIZEOF(ctx->signature));

	{
		// parse
		TRACE_BUFFER(wireDataBuffer, wireDataSize);

		size_t parsedSize = bip44_parseFromWire(&ctx->path, wireDataBuffer, wireDataSize);
		VALIDATE(parsedSize == wireDataSize, ERR_INVALID_DATA);
	}

	security_policy_t policy = POLICY_DENY;
	{
		// get policy
		policy = policyForSignTxWitnesses(&ctx->path);
		TRACE("Policy: %d", (int) policy);
		ENSURE_NOT_DENIED(policy);
	}

    uint8_t hashBuf[32];
	explicit_bzero(hashBuf, SIZEOF(hashBuf));
    //We finish the hash appending a 32-byte empty buffer
	TRACE("SHA_256_append");
	TRACE_BUFFER(hashBuf, SIZEOF(hashBuf));
	sha_256_append(&ctx->hashContext, hashBuf, SIZEOF(hashBuf));
	//we get the resulting hash
	TRACE("SHA_256_finalize");
    sha_256_finalize(&ctx->hashContext, hashBuf, SIZEOF(hashBuf));
    TRACE("Resulting hash!!!!!!!!!!!!");
    TRACE_BUFFER(hashBuf, 32);

    //We derive the private key
	private_key_t privateKey;
    bip44_path_t pathSpec = {{44 + HARDENED_BIP32, 235 + HARDENED_BIP32, 0 + HARDENED_BIP32, 0, 0}, 5};
    derivePrivateKey(&pathSpec, &privateKey);
	TRACE("privateKey.d:");
    TRACE_BUFFER(privateKey.d, privateKey.d_len);

    //We sign the hash
	//Taken from EOS app
    uint32_t tx = 0;
    uint8_t V[33];
    uint8_t K[32];
    int tries = 0;

    // Loop until a candidate matching the canonical signature is found
	// TODO This probably should not use G_io_apdu_buffer
    for (;;)
    {
        if (tries == 0)
        {
            rng_rfc6979(G_io_apdu_buffer + 100, hashBuf, privateKey.d, privateKey.d_len, SECP256K1_N, 32, V, K);
        }
        else
        {
            rng_rfc6979(G_io_apdu_buffer + 100, hashBuf, NULL, 0, SECP256K1_N, 32, V, K);
        }
        uint32_t infos;
        tx = cx_ecdsa_sign(&privateKey, CX_NO_CANONICAL | CX_RND_PROVIDED | CX_LAST, CX_SHA256,
                           hashBuf, 32, 
                           G_io_apdu_buffer + 100, 100,
                           &infos);

		
        if ((infos & CX_ECCINFO_PARITY_ODD) != 0)
        {
            G_io_apdu_buffer[100] |= 0x01;
        }
        G_io_apdu_buffer[0] = 27 + 4 + (G_io_apdu_buffer[100] & 0x01);
        ecdsa_der_to_sig(G_io_apdu_buffer + 100, G_io_apdu_buffer + 1);
        if (check_canonical(G_io_apdu_buffer + 1))
        {
            tx = 1 + 64;
            break;
        }
        else
        {
			TRACE("Try %d unsuccesfull! We will not get correct signature!!!!!!!!!!!!!!!!!!!!!!!!!", tries);
            tries++;
        }
    }
    // delete private key We should use try macros later TODO
    memset(&privateKey, 0, sizeof(privateKey));

    TRACE("ecdsa_der_to_sig_result:");
    TRACE_BUFFER(G_io_apdu_buffer, 65);
	memcpy(G_io_apdu_buffer + 65, hashBuf, 32);

	{
		// select UI steps
		switch (policy) {
#	define  CASE(POLICY, UI_STEP) case POLICY: {ctx->ui_step=UI_STEP; break;}
			CASE(POLICY_PROMPT_BEFORE_RESPONSE, HANDLE_WITTNESSES_STEP_DISPLAY_DETAILS);
#	undef   CASE
		default:
			THROW(ERR_NOT_IMPLEMENTED);
		}
	}

	signTx_handleWitnesses_ui_runStep();
}


// ============================== MAIN HANDLER ==============================

typedef void subhandler_fn_t(uint8_t p2, uint8_t* dataBuffer, size_t dataSize);

static subhandler_fn_t* lookup_subhandler(uint8_t p1)
{
	switch(p1) {
#	define  CASE(P1, HANDLER) case P1: return HANDLER;
#	define  DEFAULT(HANDLER)  default: return HANDLER;
		CASE(0x01, signTx_handleInitAPDU);
		CASE(0x02, signTx_handleFeeAPDU);
		CASE(0x03, signTx_handleWitnessesAPDU);
		DEFAULT(NULL)
#	undef   CASE
#	undef   DEFAULT
	}
}

void signTransaction_handleAPDU(
        uint8_t p1,
        uint8_t p2,
        uint8_t* wireDataBuffer,
        size_t wireDataSize,
        bool isNewCall
)
{
	TRACE("P1 = 0x%x, P2 = 0x%x, isNewCall = %d", p1, p2, isNewCall);

	if (isNewCall) {
		explicit_bzero(ctx, SIZEOF(*ctx));
		ctx->stage = SIGN_STAGE_INIT;
	}

	subhandler_fn_t* subhandler = lookup_subhandler(p1);
	VALIDATE(subhandler != NULL, ERR_INVALID_REQUEST_PARAMETERS);
	subhandler(p2, wireDataBuffer, wireDataSize);
}
