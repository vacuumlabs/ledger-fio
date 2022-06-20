#include "signTransactionIntegrity.h"
#include "hash.h"

static const uint8_t allowedHashes[][SHA_256_SIZE] = {};

enum {
    TX_INTEGRITY_HASH_INITIALIZED_MAGIC = 12345,
};

typedef struct {
    uint16_t initialized_magic;
    uint8_t integrityHash[SHA_256_SIZE];
} tx_integrity_hash_t;

static tx_integrity_hash_t integrityHash;

void integrityCheckInit() {
    explicit_bzero(&integrityHash, SIZEOF(integrityHash));
    integrityHash.initialized_magic = TX_INTEGRITY_HASH_INITIALIZED_MAGIC;

    TRACE_BUFFER(&integrityHash.integrityHash, SIZEOF(integrityHash.integrityHash));
}

void integrityCheckProcessInstruction(uint8_t p1, uint8_t p2, const uint8_t *constData, uint8_t constDataLength) {
    ASSERT(integrityHash.initialized_magic == TX_INTEGRITY_HASH_INITIALIZED_MAGIC);
    sha_256_context_t ctx;
    sha_256_init(&ctx);
    sha_256_append(&ctx, integrityHash.integrityHash, SIZEOF(integrityHash.integrityHash));
    sha_256_append(&ctx, &p1, SIZEOF(p1));
    sha_256_append(&ctx, &p2, SIZEOF(p2));
    sha_256_append(&ctx, &constDataLength, SIZEOF(constDataLength));
    sha_256_append(&ctx, constData, constDataLength);
    sha_256_finalize(&ctx, integrityHash.integrityHash, SIZEOF(integrityHash.integrityHash));

    TRACE_BUFFER(&integrityHash.integrityHash, SIZEOF(integrityHash.integrityHash));
}

bool _integrityCheckFinalize(const uint8_t (*allowedHashes)[SHA_256_SIZE], uint16_t allowedHashesLength) {
    ASSERT(integrityHash.initialized_magic == TX_INTEGRITY_HASH_INITIALIZED_MAGIC);
    for(uint16_t i=0; i<allowedHashesLength; i++) {
        STATIC_ASSERT(SIZEOF(allowedHashes[i]) == SIZEOF(integrityHash.integrityHash), "Incompatible hashes.");
        if (memcmp(integrityHash.integrityHash, allowedHashes[i], SIZEOF(allowedHashes[i])) == 0) {
            TRACE("Integrity check passed");
            return true;
        }
    }

    TRACE("Integrity check failed");
    return false;
}

bool integrityCheckFinalize() {
    return _integrityCheckFinalize(allowedHashes, ARRAY_LEN(allowedHashes));
}




