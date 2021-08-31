#ifndef H_FIO_APP_FIO
#define H_FIO_APP_FIO

#include "common.h"

typedef enum  {
	NETWORK_MAINNET = 0,
	NETWORK_TESTNET = 1,
	NETWORK_UNKNOWN = 2,
} network_type_t; 

#define CHAIN_ID_LENGTH 32
network_type_t getNetworkByChainId(uint8_t *chainId, size_t length);

typedef enum {
	ACTION_TYPE_TRNSFIOPUBKY = 0,
	ACTION_TYPE_UNKNOWN = 1,
} action_type_t; 

#define CONTRACT_ACCOUNT_NAME_LENGTH 16
action_type_t getActionTypeByContractAccountName(network_type_t network, uint8_t * contractAccountName, size_t length);

//name compressed to 8 bytes, uncompresed up to 13 bytes, last byte for 0
#define NAME_VAR_LENGHT 8
typedef uint64_t name_t;
#define NAME_STRING_MAX_LENGTH 14
void name_to_string(name_t value, char *out, size_t size); 

#endif // H_FIO_APP_FIO
