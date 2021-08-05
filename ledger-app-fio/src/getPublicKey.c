#include "state.h"
#include "securityPolicy.h"
#include "uiHelpers.h"
#include "uiScreens.h"
#include "getPublicKey.h"
#include "bufView.h"

static int16_t RESPONSE_READY_MAGIC = 23456;

static ins_get_key_context_t* ctx = &(instructionState.getKeyContext);

// ctx->ui_state is shared between the intertwined UI state machines below
// it should be set to this value at the beginning and after a UI state machine is finished
static int UI_STEP_NONE = 0;

static inline void CHECK_STAGE(get_key_stage_t expected)
{
	TRACE("Checking stage... current one is %d, expected %d", ctx->stage, expected);
	VALIDATE(ctx->stage == expected, ERR_INVALID_STATE);
}

// read a path from view into ctx->pathSpec
static void parsePath(read_view_t* view)
{
	view_skipBytes(view, bip44_parseFromWire(&ctx->pathSpec, VIEW_REMAINING_TO_TUPLE_BUF_SIZE(view)));
	BIP44_PRINTF(&ctx->pathSpec);
}

static void advanceStage()
{
	TRACE("Advancing from stage: %d", ctx->stage);

	switch (ctx->stage) {

	case GET_KEY_STAGE_INIT:
		ctx->stage = GET_KEY_STAGE_NONE;
		ui_idle(); // we are done with this key export
		break;

	default:
		ASSERT(false);
	}
}

// ============================== derivation and UI state machine ==============================

enum {
	GET_KEY_UI_STEP_WARNING = 200,
	GET_KEY_UI_STEP_DISPLAY,
	GET_KEY_UI_STEP_CONFIRM,
	GET_KEY_UI_STEP_RESPOND,
} ;

static void getPublicKey_respondOneKey_ui_runStep()
{
	TRACE("UI step %d", ctx->ui_step);
	ui_callback_fn_t* this_fn = getPublicKey_respondOneKey_ui_runStep;

	UI_STEP_BEGIN(ctx->ui_step);
	UI_STEP(GET_KEY_UI_STEP_WARNING) {
		ui_displayPaginatedText(
		        "Unusual request",
		        "Proceed with care",
		        this_fn
		);
	}
	UI_STEP(GET_KEY_UI_STEP_DISPLAY) {
		ui_displayPathScreen("Export public key", &ctx->pathSpec, this_fn);
	}
	UI_STEP(GET_KEY_UI_STEP_CONFIRM) {
		ui_displayPrompt(
		        "Confirm export",
		        "public key?",
		        this_fn,
		        respond_with_user_reject
		);
	}
	UI_STEP(GET_KEY_UI_STEP_RESPOND) {
		ASSERT(ctx->responseReadyMagic == RESPONSE_READY_MAGIC);
        
		io_send_buf(SUCCESS, (uint8_t*) &ctx->extPubKey.pubKey, SIZEOF(ctx->extPubKey.pubKey));
		ctx->responseReadyMagic = 0; // just for safety 
		ui_displayBusy(); // needs to happen after I/O

		TRACE("Export done.");

		advanceStage();
	}
	UI_STEP_END(UI_STEP_NONE);
}

// derive the key described by ctx->pathSpec and run the ui state machine accordingly
static void runGetOnePublicKeyUIFlow()
{
	ASSERT(ctx->ui_step == UI_STEP_NONE); // make sure no ui state machine is running

	ctx->responseReadyMagic = 0;

	// Check security policy
	security_policy_t policy = policyForGetPublicKey(&ctx->pathSpec);
	TRACE("Policy: %d", (int) policy);
	ENSURE_NOT_DENIED(policy);

	{
		// Calculation
		deriveExtendedPublicKey(
		        & ctx->pathSpec,
		        & ctx->extPubKey
		);
		ctx->responseReadyMagic = RESPONSE_READY_MAGIC;
	}

	switch (policy) {
#	define  CASE(policy, step) case policy: {ctx->ui_step = step; break;}
		CASE(POLICY_PROMPT_WARN_UNUSUAL,    GET_KEY_UI_STEP_WARNING);
		CASE(POLICY_PROMPT_BEFORE_RESPONSE, GET_KEY_UI_STEP_DISPLAY);
		CASE(POLICY_ALLOW_WITHOUT_PROMPT,   GET_KEY_UI_STEP_RESPOND);
#	undef   CASE
	default:
		ASSERT(false);
	}

	getPublicKey_respondOneKey_ui_runStep();
}

// ============================== MAIN HANDLER ==============================

void getPublicKey_handleAPDU(
        uint8_t p1,
        uint8_t p2,
        uint8_t* wireDataBuffer,
        size_t wireDataSize,
        bool isNewCall
)
{
	VALIDATE(isNewCall, ERR_INVALID_STATE);
	VALIDATE(p1 == P1_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
	VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);

	explicit_bzero(ctx, SIZEOF(*ctx));
	ctx->stage = GET_KEY_STAGE_INIT;
	ctx->ui_step = UI_STEP_NONE;

    CHECK_STAGE(GET_KEY_STAGE_INIT);
	ASSERT(wireDataSize < BUFFER_SIZE_PARANOIA);

	read_view_t view = make_read_view(wireDataBuffer, wireDataBuffer + wireDataSize);
	parsePath(&view);
	VALIDATE(view_remainingSize(&view) == 0, ERR_INVALID_DATA);

	runGetOnePublicKeyUIFlow();
}
