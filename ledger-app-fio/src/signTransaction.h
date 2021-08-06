#ifndef H_FIO_APP_SIGN_TRANSACTION
#define H_FIO_APP_SIGN_TRANSACTION

#include "handlers.h"
#include "hash.h"

handler_fn_t signTransaction_handleAPDU;

typedef struct {
    sha_256_context_t hashContext;
	uint64_t fee;

	int ui_step;
} ins_sign_transaction_context_t; 

#endif // H_FIO_APP_SIGN_TRANSACTION
