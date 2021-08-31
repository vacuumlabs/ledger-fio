#ifndef H_FIO_APP_SIGN_TRANSACTION
#define H_FIO_APP_SIGN_TRANSACTION

#include "handlers.h"
#include "hash.h"

handler_fn_t signTransaction_handleAPDU;

typedef enum {
	ACTION_TYPE_TRNSFIOPUBKY = 0,
	ACTION_TYPE_UNKNOWN = 1,
} action_type_t; 

typedef enum  {
	NETWORK_MAINNET = 0,
	NETWORK_TESTNET = 1,
	NETWORK_UNKNOWN = 2,
} network_type_t; 

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

	uint8_t signature[64];
} ins_sign_transaction_context_t; 

#endif // H_FIO_APP_SIGN_TRANSACTION
