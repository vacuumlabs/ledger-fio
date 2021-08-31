#ifndef H_FIO_APP_SIGN_TRANSACTION
#define H_FIO_APP_SIGN_TRANSACTION

#include "handlers.h"
#include "hash.h"
#include "fio.h"

handler_fn_t signTransaction_handleAPDU;

typedef struct {
    sha_256_context_t hashContext;
	int ui_step;
	int stage;

	network_type_t network;
	action_type_t action_type;
	bip44_path_t path;

    //We will need to save memory, theese will e in union eventualy
	uint32_t expiration;
	uint16_t refBlockNum;
	uint32_t refBlockPrefix;

	char actionValidationActor[NAME_STRING_MAX_LENGTH];
	char actionValidationPermission[NAME_STRING_MAX_LENGTH];

	uint8_t signature[64];
} ins_sign_transaction_context_t; 

#endif // H_FIO_APP_SIGN_TRANSACTION
