#include "signTransactionIntegrity.h"
#include "state.h"
#include "hash.h"

static const uint8_t allowedHashes[][SHA_256_SIZE] = {
#ifdef DEVEL
    {0x8a, 0xe3, 0x7f, 0xe4, 0x95, 0x02, 0x7a, 0xc1, 0x09, 0xde, 0x2e,
     0xe3, 0xf7, 0x95, 0x39, 0x14, 0x0f, 0xd5, 0x6a, 0xa5, 0x6a, 0x50,
     0xd3, 0xe9, 0x96, 0x83, 0x0e, 0x03, 0x3e, 0xda, 0x36, 0x76},
    {0xf3, 0xa5, 0xd8, 0xa3, 0x3f, 0x25, 0x13, 0xa3, 0xdd, 0x2a, 0xc0,
     0xc6, 0x37, 0x43, 0xc8, 0x5a, 0x5c, 0xe9, 0x24, 0x9d, 0x36, 0xd6,
     0xef, 0x32, 0xe8, 0xf1, 0x20, 0x38, 0x6e, 0xe9, 0x2c, 0x69},
#endif
};

enum {
    TX_INTEGRITY_HASH_INITIALIZED_MAGIC = 12345,
};

void integrityCheckInit(tx_integrity_t *integrity) {
    explicit_bzero(integrity, SIZEOF(*integrity));
    integrity->initialized_magic = TX_INTEGRITY_HASH_INITIALIZED_MAGIC;

    TRACE_BUFFER(&integrity->integrityHash, SIZEOF(integrity->integrityHash));
}

void integrityCheckProcessInstruction(tx_integrity_t *integrity,
                                      uint8_t p1,
                                      uint8_t p2,
                                      const uint8_t *constData,
                                      uint8_t constDataLength) {
    ASSERT(integrity->initialized_magic == TX_INTEGRITY_HASH_INITIALIZED_MAGIC);
    sha_256_context_t ctx;
    sha_256_init(&ctx);
    sha_256_append(&ctx, integrity->integrityHash, SIZEOF(integrity->integrityHash));
    sha_256_append(&ctx, &p1, SIZEOF(p1));
    sha_256_append(&ctx, &p2, SIZEOF(p2));
    sha_256_append(&ctx, &constDataLength, SIZEOF(constDataLength));
    sha_256_append(&ctx, constData, constDataLength);
    sha_256_finalize(&ctx, integrity->integrityHash, SIZEOF(integrity->integrityHash));

    TRACE_BUFFER(&integrity->integrityHash, SIZEOF(integrity->integrityHash));
}

bool _integrityCheckFinalize(tx_integrity_t *integrity,
                             const uint8_t (*allowedHashes)[SHA_256_SIZE],
                             uint16_t allowedHashesLength) {
    ASSERT(integrity->initialized_magic == TX_INTEGRITY_HASH_INITIALIZED_MAGIC);
    for (uint16_t i = 0; i < allowedHashesLength; i++) {
        STATIC_ASSERT(SIZEOF(allowedHashes[i]) == SIZEOF(integrity->integrityHash),
                      "Incompatible hashes.");
        if (memcmp(integrity->integrityHash, allowedHashes[i], SIZEOF(allowedHashes[i])) == 0) {
            TRACE("Integrity check passed");
            return true;
        }
    }

    TRACE("Integrity check failed");
    return false;
}

bool integrityCheckFinalize(tx_integrity_t *integrity) {
    return _integrityCheckFinalize(integrity, allowedHashes, ARRAY_LEN(allowedHashes));
}
