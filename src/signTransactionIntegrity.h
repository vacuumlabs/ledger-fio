#ifndef H_FIO_APP_SIGN_TRANSACTION_INTEGRITY
#define H_FIO_APP_SIGN_TRANSACTION_INTEGRITY

#include <stdint.h>
#include <stdbool.h>

void integrityCheckInit();

void integrityCheckProcessInstruction(uint8_t p1,
                                      uint8_t p2,
                                      const uint8_t *constData,
                                      uint8_t constDataLength);

bool integrityCheckFinalize();

#ifdef DEVEL
#include "hash.h"
bool _integrityCheckFinalize(const uint8_t (*allowedHashes)[SHA_256_SIZE],
                             uint16_t allowedHashesLength);

void run_integrityCheck_test();
#endif  // DEVEL

#endif  // H_FIO_APP_SIGN_TRANSACTION_INTEGRITY
