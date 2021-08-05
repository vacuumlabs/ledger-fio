#ifndef H_FIO_APP_GET_PUBLIC_KEY
#define H_FIO_APP_GET_PUBLIC_KEY

#include "common.h"
#include "handlers.h"
#include "bip44.h"
#include "keyDerivation.h"

#define MAX_PUBLIC_KEYS 1000

 typedef enum {
	GET_KEY_STAGE_NONE = 0,
	GET_KEY_STAGE_INIT = 20,
} get_key_stage_t;

typedef struct {
	get_key_stage_t stage;

	uint16_t currentPath;

	bip44_path_t pathSpec;
	extendedPublicKey_t extPubKey;

	uint16_t responseReadyMagic;

	int ui_step;
} ins_get_key_context_t; 

handler_fn_t getPublicKey_handleAPDU;

#endif // H_FIO_APP_GET_PUBLIC_KEY