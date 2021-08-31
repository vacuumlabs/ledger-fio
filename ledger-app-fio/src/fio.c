#include "fio.h"

network_type_t getNetworkByChainId(uint8_t *chainId, size_t length) {
	ASSERT(length == CHAIN_ID_LENGTH);
	const uint8_t testnetId[CHAIN_ID_LENGTH] = {0xb2, 0x09, 0x01, 0x38, 0x0a, 0xf4, 0x4e, 0xf5, 
	                                            0x9c, 0x59, 0x18, 0x43, 0x9a, 0x1f, 0x9a, 0x41,
									            0xd8, 0x36, 0x69, 0x02, 0x03, 0x19, 0xa8, 0x05,
							            		0x74, 0xb8, 0x04, 0xa5, 0xf9, 0x5c, 0xbd, 0x7e};
	if (!memcmp(chainId, testnetId, CHAIN_ID_LENGTH)) {
		return NETWORK_TESTNET;
	}

	return NETWORK_UNKNOWN;
}

action_type_t getActionTypeByContractAccountName(network_type_t network, uint8_t * contractAccountName, size_t length) {
	ASSERT(length == CONTRACT_ACCOUNT_NAME_LENGTH);
	const uint8_t testnetTrnsfiopubky[CONTRACT_ACCOUNT_NAME_LENGTH] = {0x00, 0x00, 0x98, 0x0a, 0xd2, 0x0c, 0xa8, 0x5b,
	                                                                   0xe0, 0xe1, 0xd1, 0x95, 0xba, 0x85, 0xe7, 0xcd};
	if (network == NETWORK_TESTNET) {
		if (!memcmp(contractAccountName, testnetTrnsfiopubky, CONTRACT_ACCOUNT_NAME_LENGTH)) {
			return ACTION_TYPE_TRNSFIOPUBKY;
		}
		return ACTION_TYPE_UNKNOWN;
	}
	if (network == NETWORK_MAINNET) {
		return ACTION_TYPE_UNKNOWN;
	}

	return ACTION_TYPE_UNKNOWN;
}


static const char* charmap = ".12345abcdefghijklmnopqrstuvwxyz";

//From EOS, slightly modified
void name_to_string(name_t value, char *out, size_t size) {
    ASSERT(size >= NAME_STRING_MAX_LENGTH);

    uint32_t i = 0;
    uint32_t actual_size = NAME_STRING_MAX_LENGTH;
    uint64_t tmp = value;
    char str[13] = {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'};

    for (i = 0; i <= 12; ++i) {
        char c = charmap[tmp & (i == 0 ? 0x0f : 0x1f)];
        str[12 - i] = c;
        tmp >>= (i == 0 ? 4 : 5);
    }

    while (actual_size != 0 && str[actual_size-1] == '.'){
        actual_size--;
    }

    memcpy(out, str, actual_size);

    //clear trailing dots
    i = NAME_STRING_MAX_LENGTH-1;
    do {
        out[i] = 0;
        i--;
    } while (out[i] == '.' && i != 0);
}

