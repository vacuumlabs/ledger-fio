#ifndef H_FIO_APP_SIGN_TRANSACTION
#define H_FIO_APP_SIGN_TRANSACTION

#include "handlers.h"
#include "hash.h"

handler_fn_t signTransaction_handleAPDU;

typedef struct {
    sha_256_context_t hashContext;
	int ui_step;
	int stage;

    //We will need to save memory, theese will e in union eventualy
	bip44_path_t path;
	uint8_t signature[64];
} ins_sign_transaction_context_t; 

#endif // H_FIO_APP_SIGN_TRANSACTION
