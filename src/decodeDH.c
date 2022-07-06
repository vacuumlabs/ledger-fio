#include "state.h"
#include "securityPolicy.h"
#include "uiHelpers.h"
#include "uiScreens.h"
#include "getPublicKey.h"
#include "utils.h"
#include "eos_utils.h"


static const int16_t DECODING_FINISHED_MAGIC = 23456;
static const uint16_t MAX_SEND_FIRST_MESSAGE = 200;
static ins_decode_context_t* ctx = &(instructionState.decodeContext);

static inline void CHECK_STAGE(decode_stage_t expected) {
    VALIDATE(ctx->stage == expected, ERR_INVALID_STATE);
}

enum {
    P2_NEWFUNDSREQ = 1,
    P2_RECORDOBT = 2, 
};

//we want to wipe out all confidental data on reject
static void dh_respond_with_user_reject() {
    explicit_bzero(G_io_apdu_buffer, SIZEOF(G_io_apdu_buffer));
    explicit_bzero(ctx->buffer, SIZEOF(ctx->buffer));
    io_send_buf(ERR_REJECTED_BY_USER, NULL, 0);
    ui_idle();
}

// ctx->ui_state is shared between the intertwined UI state machines below
// it should be set to this value at the beginning and after a UI state machine is finished
static int UI_STEP_NONE = 0;


typedef struct {
    uint8_t length;
    uint8_t data[];
} string_with_length_t;

static struct {
    string_with_length_t *payee_public_address;
    string_with_length_t *payer_public_address;
    string_with_length_t *amount;
    string_with_length_t *chain_code;
    string_with_length_t *token_code;
    string_with_length_t *status;
    string_with_length_t *obt_id;
    string_with_length_t *memo;
    string_with_length_t *hash;
    string_with_length_t *offline_url;
} parsedContent;

static void readStringWithLength(size_t *read, string_with_length_t **result) {
    VALIDATE(ctx->bufferLen >= 1 + *read, ERR_INVALID_DATA);
    *result = (string_with_length_t *)(ctx->buffer+*read);
    *read += (*result)->length + 1; //+1 for actual length
    TRACE("%d, %d" ,(*result)->length, *read);
}

static void readOptionalStringWithLength(size_t *read, string_with_length_t **result) {
    VALIDATE(ctx->bufferLen >= 1 + *read, ERR_INVALID_DATA);
    if (ctx->buffer[*read] == 1) {
        *read += 1; // has memo or not
        readStringWithLength(read, result);
    }
    else {
        VALIDATE(ctx->buffer[*read] == 0, ERR_INVALID_DATA);
        *read += 1; // has memo or not
        *result = NULL;
        TRACE("Not present: %d" ,*read);
    }
}

// ============================== NEWFUNDSREQ state machine ==============================

enum {
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MESSAGE1 = 200,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MESSAGE2,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_OUR_PATH,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_THEIR_PUBKEY,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_PAYEE_PUBLIC_ADDRESS,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_AMOUNT,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_CHAIN_CODE,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_TOKEN_CODE,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MEMO,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_CONFIRM,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_RESPOND,
    DECODE_NEWFUNDSREQ_MEMO_UI_STEP_INVALID,
};

static void decodeNewfundsreqMemo_ui_runStep() {
    TRACE("UI step %d", ctx->ui_step);
    ui_callback_fn_t* this_fn = decodeNewfundsreqMemo_ui_runStep;

    UI_STEP_BEGIN(ctx->ui_step, this_fn);

    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MESSAGE1) {
        ui_displayPaginatedText("Decode shared", "secret", this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MESSAGE2) {
        ui_displayPaginatedText("Interpreting", "the message as Request funds,", this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_OUR_PATH) {
        ui_displayPathScreen("Our path", &ctx->pathSpec, this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_THEIR_PUBKEY) {
        ui_displayPubkeyScreen("Their public key", &ctx->otherPubKey, this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_PAYEE_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payee public address", 
                        parsedContent.payee_public_address->data,
                        parsedContent.payee_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_AMOUNT) {
        ui_displayAsciiBufferScreen("Amount", 
                        parsedContent.amount->data,
                        parsedContent.amount->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_CHAIN_CODE) {
        ui_displayAsciiBufferScreen("Chain code", 
                        parsedContent.chain_code->data,
                        parsedContent.chain_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_TOKEN_CODE) {
        ui_displayAsciiBufferScreen("Token code", 
                        parsedContent.token_code->data,
                        parsedContent.token_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MEMO) {
        ASSERT(parsedContent.memo != NULL);
        ui_displayAsciiBufferScreen("Memo", 
                        parsedContent.memo->data,
                        parsedContent.memo->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_CONFIRM) {
        ui_displayPrompt("Confirm", "response", this_fn, dh_respond_with_user_reject);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_RESPOND) {
        io_send_buf(SUCCESS, NULL, 0);
        ui_displayBusy();             // needs to happen after I/O
        ctx->stage = DECODE_STAGE_SEND_REST;
    }
    UI_STEP_END(DECODE_NEWFUNDSREQ_MEMO_UI_STEP_INVALID);
}

enum {
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_MESSAGE1 = 250,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_MESSAGE2,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_OUR_PATH,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_THEIR_PUBKEY,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_PAYEE_PUBLIC_ADDRESS,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_AMOUNT,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_CHAIN_CODE,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_TOKEN_CODE,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_HASH,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_OFFLINE_URL,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_CONFIRM,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_RESPOND,
    DECODE_NEWFUNDSREQ_HASH_UI_STEP_INVALID,
};

static void decodeNewfundsreqHash_ui_runStep() {
    TRACE("UI step %d", ctx->ui_step);
    ui_callback_fn_t* this_fn = decodeNewfundsreqHash_ui_runStep;

    UI_STEP_BEGIN(ctx->ui_step, this_fn);

    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_MESSAGE1) {
        ui_displayPaginatedText("Decode shared", "secret", this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_MESSAGE2) {
        ui_displayPaginatedText("Interpreting", "the message as Request funds,", this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_OUR_PATH) {
        ui_displayPathScreen("Our path", &ctx->pathSpec, this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_THEIR_PUBKEY) {
        ui_displayPubkeyScreen("Their public key", &ctx->otherPubKey, this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_PAYEE_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payee public address", 
                        parsedContent.payee_public_address->data,
                        parsedContent.payee_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_AMOUNT) {
        ui_displayAsciiBufferScreen("Amount", 
                        parsedContent.amount->data,
                        parsedContent.amount->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_CHAIN_CODE) {
        ui_displayAsciiBufferScreen("Chain code", 
                        parsedContent.chain_code->data,
                        parsedContent.chain_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_TOKEN_CODE) {
        ui_displayAsciiBufferScreen("Token code", 
                        parsedContent.token_code->data,
                        parsedContent.token_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_HASH) {
        ASSERT(parsedContent.hash != NULL);
        ui_displayAsciiBufferScreen("Hash", 
                        parsedContent.hash->data,
                        parsedContent.hash->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_OFFLINE_URL) {
        ASSERT(parsedContent.offline_url != NULL);
        ui_displayAsciiBufferScreen("Offline URL", 
                        parsedContent.offline_url->data,
                        parsedContent.offline_url->length, 
                        this_fn);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_CONFIRM) {
        ui_displayPrompt("Confirm", "response", this_fn, dh_respond_with_user_reject);
    }
    UI_STEP(DECODE_NEWFUNDSREQ_HASH_UI_STEP_RESPOND) {
        io_send_buf(SUCCESS, NULL, 0);
        ui_displayBusy();             // needs to happen after I/O
        ctx->stage = DECODE_STAGE_SEND_REST;
    }
    UI_STEP_END(DECODE_NEWFUNDSREQ_HASH_UI_STEP_INVALID);
}

// Parse newfundsreq data
static void decodeNewfundsreqUIFlow() {
    ASSERT(ctx->ui_step == UI_STEP_NONE);  // make sure no ui state machine is running

    explicit_bzero(&parsedContent, SIZEOF(parsedContent));
    size_t read = 0;
    readStringWithLength(&read, &parsedContent.payee_public_address);
    readStringWithLength(&read, &parsedContent.amount);
    readStringWithLength(&read, &parsedContent.chain_code);
    readStringWithLength(&read, &parsedContent.token_code);
    readOptionalStringWithLength(&read, &parsedContent.memo);
    readOptionalStringWithLength(&read, &parsedContent.hash);
    readOptionalStringWithLength(&read, &parsedContent.offline_url);
    VALIDATE(read == ctx->bufferLen, ERR_INVALID_DATA);

    if (parsedContent.memo != NULL && parsedContent.hash == NULL && parsedContent.offline_url == NULL) {
        ctx->ui_step = DECODE_NEWFUNDSREQ_MEMO_UI_STEP_MESSAGE1;
        decodeNewfundsreqMemo_ui_runStep();
    }
    else if (parsedContent.memo == NULL && parsedContent.hash != NULL && parsedContent.offline_url != NULL) {
        ctx->ui_step = DECODE_NEWFUNDSREQ_HASH_UI_STEP_MESSAGE1;
        decodeNewfundsreqHash_ui_runStep();

    } 
    else {
        THROW(ERR_INVALID_DATA);
    }

}

// ============================== RECORDOBT state machine ==============================

enum {
    DECODE_RECORDOBT_MEMO_UI_STEP_MESSAGE1 = 300,
    DECODE_RECORDOBT_MEMO_UI_STEP_MESSAGE2,
    DECODE_RECORDOBT_MEMO_UI_STEP_OUR_PATH,
    DECODE_RECORDOBT_MEMO_UI_STEP_THEIR_PUBKEY,
    DECODE_RECORDOBT_MEMO_UI_STEP_PAYEE_PUBLIC_ADDRESS,
    DECODE_RECORDOBT_MEMO_UI_STEP_PAYER_PUBLIC_ADDRESS,
    DECODE_RECORDOBT_MEMO_UI_STEP_AMOUNT,
    DECODE_RECORDOBT_MEMO_UI_STEP_CHAIN_CODE,
    DECODE_RECORDOBT_MEMO_UI_STEP_TOKEN_CODE,
    DECODE_RECORDOBT_MEMO_UI_STEP_STATUS,
    DECODE_RECORDOBT_MEMO_UI_STEP_OBT_ID,
    DECODE_RECORDOBT_MEMO_UI_STEP_MEMO,
    DECODE_RECORDOBT_MEMO_UI_STEP_CONFIRM,
    DECODE_RECORDOBT_MEMO_UI_STEP_RESPOND,
    DECODE_RECORDOBT_MEMO_UI_STEP_INVALID,
};

static void decodeRecordobtMemo_ui_runStep() {
    TRACE("UI step %d", ctx->ui_step);
    ui_callback_fn_t* this_fn = decodeRecordobtMemo_ui_runStep;

    UI_STEP_BEGIN(ctx->ui_step, this_fn);

    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_MESSAGE1) {
        ui_displayPaginatedText("Decode shared", "secret", this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_MESSAGE2) {
        ui_displayPaginatedText("Interpreting", "the message as Request funds,", this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_OUR_PATH) {
        ui_displayPathScreen("Our path", &ctx->pathSpec, this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_THEIR_PUBKEY) {
        ui_displayPubkeyScreen("Their public key", &ctx->otherPubKey, this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_PAYEE_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payee public address", 
                        parsedContent.payee_public_address->data,
                        parsedContent.payee_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_PAYER_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payer public address", 
                        parsedContent.payer_public_address->data,
                        parsedContent.payer_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_AMOUNT) {
        ui_displayAsciiBufferScreen("Amount", 
                        parsedContent.amount->data,
                        parsedContent.amount->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_CHAIN_CODE) {
        ui_displayAsciiBufferScreen("Chain code", 
                        parsedContent.chain_code->data,
                        parsedContent.chain_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_TOKEN_CODE) {
        ui_displayAsciiBufferScreen("Token code", 
                        parsedContent.token_code->data,
                        parsedContent.token_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_STATUS) {
        ui_displayAsciiBufferScreen("Status", 
                        parsedContent.status->data,
                        parsedContent.status->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_OBT_ID) {
        ui_displayAsciiBufferScreen("Obt ID", 
                        parsedContent.obt_id->data,
                        parsedContent.obt_id->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_MEMO) {
        ASSERT(parsedContent.memo != NULL);
        ui_displayAsciiBufferScreen("Memo", 
                        parsedContent.memo->data,
                        parsedContent.memo->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_CONFIRM) {
        ui_displayPrompt("Confirm", "response", this_fn, dh_respond_with_user_reject);
    }
    UI_STEP(DECODE_RECORDOBT_MEMO_UI_STEP_RESPOND) {
        io_send_buf(SUCCESS, NULL, 0);
        ui_displayBusy();             // needs to happen after I/O
        ctx->stage = DECODE_STAGE_SEND_REST;
    }
    UI_STEP_END(DECODE_RECORDOBT_MEMO_UI_STEP_INVALID);
}

enum {
    DECODE_RECORDOBT_HASH_UI_STEP_MESSAGE1 = 350,
    DECODE_RECORDOBT_HASH_UI_STEP_MESSAGE2,
    DECODE_RECORDOBT_HASH_UI_STEP_OUR_PATH,
    DECODE_RECORDOBT_HASH_UI_STEP_THEIR_PUBKEY,
    DECODE_RECORDOBT_HASH_UI_STEP_PAYEE_PUBLIC_ADDRESS,
    DECODE_RECORDOBT_HASH_UI_STEP_PAYER_PUBLIC_ADDRESS,
    DECODE_RECORDOBT_HASH_UI_STEP_AMOUNT,
    DECODE_RECORDOBT_HASH_UI_STEP_CHAIN_CODE,
    DECODE_RECORDOBT_HASH_UI_STEP_TOKEN_CODE,
    DECODE_RECORDOBT_HASH_UI_STEP_STATUS,
    DECODE_RECORDOBT_HASH_UI_STEP_OBT_ID,
    DECODE_RECORDOBT_HASH_UI_STEP_HASH,
    DECODE_RECORDOBT_HASH_UI_STEP_OFFLINE_URL,
    DECODE_RECORDOBT_HASH_UI_STEP_CONFIRM,
    DECODE_RECORDOBT_HASH_UI_STEP_RESPOND,
    DECODE_RECORDOBT_HASH_UI_STEP_INVALID,
};

static void decodeRecordobtHash_ui_runStep() {
    TRACE("UI step %d", ctx->ui_step);
    ui_callback_fn_t* this_fn = decodeRecordobtHash_ui_runStep;

    UI_STEP_BEGIN(ctx->ui_step, this_fn);

    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_MESSAGE1) {
        ui_displayPaginatedText("Decode shared", "secret", this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_MESSAGE2) {
        ui_displayPaginatedText("Interpreting", "the message as Request funds,", this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_OUR_PATH) {
        ui_displayPathScreen("Our path", &ctx->pathSpec, this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_THEIR_PUBKEY) {
        ui_displayPubkeyScreen("Their public key", &ctx->otherPubKey, this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_PAYEE_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payee public address", 
                        parsedContent.payee_public_address->data,
                        parsedContent.payee_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_PAYER_PUBLIC_ADDRESS) {
        ui_displayAsciiBufferScreen("Payer public address", 
                        parsedContent.payer_public_address->data,
                        parsedContent.payer_public_address->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_AMOUNT) {
        ui_displayAsciiBufferScreen("Amount", 
                        parsedContent.amount->data,
                        parsedContent.amount->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_CHAIN_CODE) {
        ui_displayAsciiBufferScreen("Chain code", 
                        parsedContent.chain_code->data,
                        parsedContent.chain_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_TOKEN_CODE) {
        ui_displayAsciiBufferScreen("Token code", 
                        parsedContent.token_code->data,
                        parsedContent.token_code->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_STATUS) {
        ui_displayAsciiBufferScreen("Status", 
                        parsedContent.status->data,
                        parsedContent.status->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_OBT_ID) {
        ui_displayAsciiBufferScreen("Obt ID", 
                        parsedContent.obt_id->data,
                        parsedContent.obt_id->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_HASH) {
        ASSERT(parsedContent.hash != NULL);
        ui_displayAsciiBufferScreen("Hash", 
                        parsedContent.hash->data,
                        parsedContent.hash->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_OFFLINE_URL) {
        ASSERT(parsedContent.offline_url != NULL);
        ui_displayAsciiBufferScreen("Offline URL", 
                        parsedContent.offline_url->data,
                        parsedContent.offline_url->length, 
                        this_fn);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_CONFIRM) {
        ui_displayPrompt("Confirm", "response", this_fn, dh_respond_with_user_reject);
    }
    UI_STEP(DECODE_RECORDOBT_HASH_UI_STEP_RESPOND) {
        io_send_buf(SUCCESS, NULL, 0);
        ui_displayBusy();             // needs to happen after I/O
        ctx->stage = DECODE_STAGE_SEND_REST;
    }
    UI_STEP_END(DECODE_RECORDOBT_HASH_UI_STEP_INVALID);
}

// Parse newfundsreq data
static void decodeRecordobtUIFlow() {
    ASSERT(ctx->ui_step == UI_STEP_NONE);  // make sure no ui state machine is running

    explicit_bzero(&parsedContent, SIZEOF(parsedContent));
    size_t read = 0;
    readStringWithLength(&read, &parsedContent.payee_public_address);
    readStringWithLength(&read, &parsedContent.payer_public_address);
    readStringWithLength(&read, &parsedContent.amount);
    readStringWithLength(&read, &parsedContent.chain_code);
    readStringWithLength(&read, &parsedContent.token_code);
    readStringWithLength(&read, &parsedContent.status);
    readStringWithLength(&read, &parsedContent.obt_id);
    readOptionalStringWithLength(&read, &parsedContent.memo);
    readOptionalStringWithLength(&read, &parsedContent.hash);
    readOptionalStringWithLength(&read, &parsedContent.offline_url);
    VALIDATE(read == ctx->bufferLen, ERR_INVALID_DATA);

    if (parsedContent.memo != NULL && parsedContent.hash == NULL && parsedContent.offline_url == NULL) {
        ctx->ui_step = DECODE_RECORDOBT_MEMO_UI_STEP_MESSAGE1;
        decodeRecordobtMemo_ui_runStep();
    }
    else if (parsedContent.memo == NULL && parsedContent.hash != NULL && parsedContent.offline_url != NULL) {
        ctx->ui_step = DECODE_RECORDOBT_HASH_UI_STEP_MESSAGE1;
        decodeRecordobtHash_ui_runStep();

    } 
    else {
        THROW(ERR_INVALID_DATA);
    }

}

// ============================== MAIN HANDLER ==============================

void decode_handleAPDU(uint8_t p1,
                             uint8_t p2,
                             uint8_t* wireDataBuffer,
                             size_t wireDataSize,
                             bool isNewCall) {
    TRACE("P1 = 0x%x, P2 = 0x%x, isNewCall = %d", p1, p2, isNewCall);

    if (isNewCall) {
        VALIDATE(p1 == DECODE_STAGE_RECEIVE_DATA, ERR_INVALID_STATE);
        explicit_bzero(ctx, SIZEOF(*ctx));
        ctx->bufferLen = 0;
        ctx->stage = DECODE_STAGE_RECEIVE_DATA;
    }

    if (p1 == DECODE_STAGE_RECEIVE_DATA) {
        VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
        CHECK_STAGE(DECODE_STAGE_RECEIVE_DATA);

        //we just append data to the buffer
        VALIDATE(wireDataSize + ctx->bufferLen <= SIZEOF(ctx->buffer), ERR_DATA_TOO_LARGE);
        memcpy(ctx->buffer+ctx->bufferLen, wireDataBuffer, wireDataSize);
        ctx->bufferLen += wireDataSize;
        TRACE("Extending buffer by %d to %d", (int)wireDataSize, (int)ctx->bufferLen);

        //respond ok
        io_send_buf(SUCCESS, NULL, 0);
        ui_displayBusy();  // needs to happen after I/O
        return;
    }
    else if (p1 == DECODE_STAGE_DECODE) {
        CHECK_STAGE(DECODE_STAGE_RECEIVE_DATA);
        ctx->stage = DECODE_STAGE_DECODE;
        VALIDATE(p2 == P2_NEWFUNDSREQ || p2 == P2_RECORDOBT, ERR_INVALID_REQUEST_PARAMETERS);

        //parse other pubkey and derivation path
        VALIDATE(wireDataSize >= PUBKEY_LENGTH + 1, ERR_INVALID_DATA);
        {
            cx_err_t err = cx_ecfp_init_public_key_no_throw(CX_CURVE_SECP256K1,
                                                            wireDataBuffer,
                                                            PUBKEY_LENGTH,
                                                            &ctx->otherPubKey);
            VALIDATE(err == CX_OK, ERR_INVALID_DATA);
        }
        size_t parsedSize = bip44_parseFromWire(&ctx->pathSpec, wireDataBuffer+PUBKEY_LENGTH, wireDataSize-PUBKEY_LENGTH);
        VALIDATE(parsedSize == wireDataSize-PUBKEY_LENGTH, ERR_INVALID_DATA);

        // Security policy for DH decode
        ENSURE_NOT_DENIED(policyForDecodeDHDecode(&ctx->pathSpec));

        // Decode DH buffer inplace
        TRACE("Decoding DH");
        ASSERT(ctx->bufferLen <= SIZEOF(ctx->buffer));
        TRACE_BUFFER(ctx->buffer, ctx->bufferLen);
        ctx->messageDecodedMagic = DECODING_FINISHED_MAGIC;
        ctx->bufferLen = dh_decode(&ctx->pathSpec, &ctx->otherPubKey, ctx->buffer, ctx->bufferLen);
        ctx->bufferSentLen = 0;
        TRACE_BUFFER(ctx->buffer, ctx->bufferLen);

        // Call parsing function
        if (p2 == P2_NEWFUNDSREQ) {
            decodeNewfundsreqUIFlow();
            return;
        } 
        else if (p2 == P2_RECORDOBT) {
            decodeRecordobtUIFlow();
            return;
        }

        THROW(ERR_INVALID_REQUEST_PARAMETERS);
    }
    else if (p1 == DECODE_STAGE_SEND_REST) {
        VALIDATE(p2 == P2_UNUSED, ERR_INVALID_REQUEST_PARAMETERS);
        VALIDATE(wireDataSize == 0, ERR_INVALID_REQUEST_PARAMETERS);

        CHECK_STAGE(DECODE_STAGE_SEND_REST);
        VALIDATE(ctx->messageDecodedMagic == DECODING_FINISHED_MAGIC, ERR_INVALID_STATE);
        ASSERT(ctx->bufferLen <= SIZEOF(ctx->buffer));
        ASSERT(ctx->bufferSentLen <= ctx->bufferLen);

        uint16_t toSend = ctx->bufferLen-ctx->bufferSentLen;
        uint16_t toSendTotal = ctx->bufferLen;
        if (toSend > MAX_SEND_FIRST_MESSAGE) {
            toSend = MAX_SEND_FIRST_MESSAGE;
        }

        TRACE("Sent: %d, toSend: %d, Total %d",ctx->bufferSentLen, toSend, toSendTotal);
        ASSERT(SIZEOF(G_io_apdu_buffer) >= SIZEOF(toSendTotal)+1+toSend);
        memcpy(G_io_apdu_buffer, &toSendTotal, SIZEOF(toSendTotal));
        G_io_apdu_buffer[SIZEOF(toSendTotal)] = (uint8_t)toSend; 
        memmove(G_io_apdu_buffer+SIZEOF(toSendTotal)+1, ctx->buffer+ctx->bufferSentLen, toSend);
        io_send_buf(SUCCESS, G_io_apdu_buffer, SIZEOF(toSendTotal)+1+toSend);
        //We finish the apdu sequence
        ui_displayBusy();  // needs to happen after I/O
        ctx->bufferSentLen += toSend;

        if(ctx->bufferSentLen == ctx->bufferLen) {
            ctx->stage = DECODE_STAGE_NONE;
            ui_idle();         // we are done with this tx
        }
        return;
    }

    THROW(ERR_INVALID_REQUEST_PARAMETERS);
}
