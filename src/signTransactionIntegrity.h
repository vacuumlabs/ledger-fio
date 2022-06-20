#ifndef H_FIO_APP_SIGN_TRANSACTION_INTEGRITY
#define H_FIO_APP_SIGN_TRANSACTION_INTEGRITY

#include <stdint.h>
#include <stdbool.h>
#include "hash.h"

typedef struct {
    uint16_t initialized_magic;
    uint8_t integrityHash[SHA_256_SIZE];
} tx_integrity_t;

void integrityCheckInit(tx_integrity_t *integrity);

void integrityCheckProcessInstruction(tx_integrity_t *integrity,
                                      uint8_t p1,
                                      uint8_t p2,
                                      const uint8_t *constData,
                                      uint8_t constDataLength);

bool integrityCheckFinalize(tx_integrity_t *integrity);

#ifdef DEVEL
#include "hash.h"
bool _integrityCheckFinalize(tx_integrity_t *integrity,
                             const uint8_t (*allowedHashes)[SHA_256_SIZE],
                             uint16_t allowedHashesLength);

void run_integrityCheck_test();
#endif  // DEVEL

#endif  // H_FIO_APP_SIGN_TRANSACTION_INTEGRITY
