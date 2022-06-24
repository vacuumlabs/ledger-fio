#ifndef H_FIO_APP_SIGN_TRANSACTION
#define H_FIO_APP_SIGN_TRANSACTION

#include "handlers.h"
#include "hash.h"
#include "fio.h"
#include "keyDerivation.h"
#include "signTransactionIntegrity.h"
#include "signTransactionCountedSection.h"
#include <stdint.h>

handler_fn_t signTransaction_handleAPDU;

#define MAX_DISPLAY_KEY_LENGTH   20
#define MAX_DISPLAY_VALUE_LENGTH 200

#define MAX_APPEND_CONST_DATA_LEN 200

typedef struct {
    uint32_t initialized_magic;

    uint8_t storedValueLen1;
    uint8_t storedValue1[8];

    uint8_t storedValueLen2;
    uint8_t storedValue2[8];

    uint8_t storedValueLen3;
    uint8_t storedValue3[64];
} tx_value_storage_t;

typedef struct {
    bip44_path_t wittnessPath;
    sha_256_context_t hashContext;
    tx_integrity_t integrity;
    tx_counted_section_t countedSections;
    tx_value_storage_t storage;
    int ui_step;

    char key[MAX_DISPLAY_KEY_LENGTH];
    char value[MAX_DISPLAY_VALUE_LENGTH];

} ins_sign_transaction_context_t;

#endif  // H_FIO_APP_SIGN_TRANSACTION
