#include "signTransactionIntegrity.h"
#include "state.h"
#include "hash.h"

static const uint8_t allowedHashes[][SHA_256_SIZE] = {};

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
