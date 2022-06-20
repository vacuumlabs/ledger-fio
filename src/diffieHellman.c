#include "diffieHellman.h"
#include "os_math.h"

__noinline_due_to_stack__ void dh_init_aes_key(dh_aes_key_t* dhKey,
                                               const bip44_path_t* pathSpec,
                                               const public_key_t* publicKey) {
    private_key_t privateKey;
    unsigned char basicSecret[32];
    unsigned char secret[SHA_512_SIZE];
    uint8_t K[SHA_512_SIZE];

    TRACE("dh_init_aesKey");
    BEGIN_TRY {
        TRY {
            derivePrivateKey(pathSpec, &privateKey);

            // this is how it is done...
            cx_err_t err = cx_ecdh_no_throw(&privateKey,
                                            CX_ECDH_X,
                                            publicKey->W,
                                            publicKey->W_len,
                                            basicSecret,
                                            SIZEOF(basicSecret));
            ASSERT(err == CX_OK);
            sha_512_hash(basicSecret, SIZEOF(basicSecret), secret, SIZEOF(secret));
            sha_512_hash(secret, SIZEOF(secret), K, SIZEOF(K));

            // First DH_AES_SECRET_SIZE bytes are used to compute shared secret, then DH_KM_SIZE are
            // used as Km for HMAC calculation
            STATIC_ASSERT(SIZEOF(K) == DH_AES_SECRET_SIZE + DH_KM_SIZE, "Incompatible types");
            cx_aes_init_key_no_throw(K, DH_AES_SECRET_SIZE, &dhKey->aesKey);
            STATIC_ASSERT(SIZEOF(dhKey->km) == DH_KM_SIZE, "Incompatible types");
            memmove(dhKey->km, K + DH_AES_SECRET_SIZE, DH_KM_SIZE);
            dhKey->initialized_magic = DH_AES_KEY_INITIALIZED_MAGIC;
        }
        FINALLY {
            explicit_bzero(&privateKey, sizeof(privateKey));
            explicit_bzero(basicSecret, SIZEOF(basicSecret));
            explicit_bzero(secret, SIZEOF(secret));
            explicit_bzero(K, SIZEOF(K));
        }
    }
    END_TRY;
}

size_t dh_encode_init(dh_context_t* ctx,
                      const dh_aes_key_t* aes_key,
                      const uint8_t* iv,
                      size_t ivSize,
                      uint8_t* outBuffer,
                      size_t outSize) {
    TRACE("dh_encode_init");

    ASSERT(ivSize == SIZEOF(ctx->IV));
    ASSERT(aes_key->initialized_magic == DH_AES_KEY_INITIALIZED_MAGIC);

    ctx->cacheLength = 0;
    explicit_bzero(ctx->cache, SIZEOF(ctx->cache));
    memcpy(ctx->IV, iv, SIZEOF(ctx->IV));

    explicit_bzero(&ctx->hmacCtx, SIZEOF(ctx->hmacCtx));
    cx_err_t err = cx_hmac_sha256_init_no_throw(&ctx->hmacCtx, aes_key->km, SIZEOF(aes_key->km));
    ASSERT(err == CX_OK);
    err = cx_hmac_update((cx_hmac_t*) &ctx->hmacCtx, iv, ivSize);
    ASSERT(err == CX_OK);

    ctx->initialized_magic = HASH_CONTEXT_INITIALIZED_MAGIC;

    ASSERT(outSize >= SIZEOF(ctx->IV));
    memcpy(outBuffer, ctx->IV, SIZEOF(ctx->IV));

    return SIZEOF(ctx->IV);
}

size_t dh_encode_append(dh_context_t* ctx,
                        const dh_aes_key_t* aes_key,
                        const uint8_t* inBuffer,
                        size_t inSize,
                        uint8_t* outBuffer,
                        size_t outSize) {
    TRACE("dh_encode_append");

    ASSERT(inSize < BUFFER_SIZE_PARANOIA);
    ASSERT(ctx->initialized_magic == HASH_CONTEXT_INITIALIZED_MAGIC);
    ASSERT(aes_key->initialized_magic == DH_AES_KEY_INITIALIZED_MAGIC);
    ASSERT(ctx->cacheLength < CX_AES_BLOCK_SIZE);
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");

    size_t processedInput = 0;
    size_t written = 0;
    while (processedInput < outSize) {
        // fill ctx->buffer
        size_t to_read = MIN(CX_AES_BLOCK_SIZE - ctx->cacheLength, inSize - processedInput);
        memcpy(ctx->cache + ctx->cacheLength, inBuffer + processedInput, to_read);
        ctx->cacheLength += to_read;
        processedInput += to_read;

        // if block is only partially filled, we finish encoding, the data was read to cache
        // this means that there was not enough input to fill the block
        if (ctx->cacheLength < CX_AES_BLOCK_SIZE) {
            break;
        }
        // cache is full now
        // we can encrypt a block,
        STATIC_ASSERT(SIZEOF(ctx->IV) >= CX_AES_BLOCK_SIZE, "dh_context_t->IV too small");
        STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");
        ASSERT(outSize - written >= CX_AES_BLOCK_SIZE);

        // We work in CBC mode
        // 1. IV xor plaintext
        for (size_t i = 0; i < CX_AES_BLOCK_SIZE; i++) {
            ctx->cache[i] ^= ctx->IV[i];
        }
        // 2. encrypt the result to obtain cyphertext 3. use cyphertext as new IV
        cx_err_t err = cx_aes_enc_block(&aes_key->aesKey, ctx->cache, ctx->IV);
        ASSERT(err == CX_OK);
        memmove(outBuffer + written, ctx->IV, CX_AES_BLOCK_SIZE);
        written += CX_AES_BLOCK_SIZE;

        // append cyphertext to hmac and clear cache
        err = cx_hmac_update((cx_hmac_t*) &ctx->hmacCtx, ctx->IV, CX_AES_BLOCK_SIZE);
        ASSERT(err == CX_OK);
        ctx->cacheLength = 0;
        explicit_bzero(ctx->cache, SIZEOF(ctx->cache));
    }

    return written;
}

size_t dh_encode_finalize(dh_context_t* ctx,
                          const dh_aes_key_t* aes_key,
                          uint8_t* outBuffer,
                          size_t outSize) {
    TRACE("dh_encode_finalize");

    ASSERT(ctx->initialized_magic == HASH_CONTEXT_INITIALIZED_MAGIC);
    ASSERT(aes_key->initialized_magic == DH_AES_KEY_INITIALIZED_MAGIC);
    ASSERT(ctx->cacheLength < CX_AES_BLOCK_SIZE);

    // fill the last cache block with integers equal to number of elements missing
    // if the next block is empty we create a block full of 0x10 (CX_AES_BLOCK_SIZE)
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");
    uint8_t fillValue = CX_AES_BLOCK_SIZE - ctx->cacheLength;
    for (size_t i = ctx->cacheLength; i < CX_AES_BLOCK_SIZE; i++) {
        ctx->cache[i] = fillValue;
    }

    // encrypt last block
    STATIC_ASSERT(SIZEOF(ctx->IV) >= CX_AES_BLOCK_SIZE, "dh_context_t->IV too small");
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");
    // 1. IV xor plaintext
    for (size_t i = 0; i < CX_AES_BLOCK_SIZE; i++) {
        ctx->cache[i] ^= ctx->IV[i];
    }
    // 2. eencrypt the result to obtain cyphertext
    ASSERT(outSize >= CX_AES_BLOCK_SIZE);
    cx_err_t err = cx_aes_enc_block(&aes_key->aesKey, ctx->cache, outBuffer);
    ASSERT(err == CX_OK);

    // append cyphertext to hmac
    err = cx_hmac_update((cx_hmac_t*) &ctx->hmacCtx, outBuffer, CX_AES_BLOCK_SIZE);
    ASSERT(err == CX_OK);

    // finalize hmac and append it to cyphertext
    ASSERT(outSize >= CX_AES_BLOCK_SIZE + DH_HMAC_SIZE);
    size_t hmacOutSize = outSize - CX_AES_BLOCK_SIZE;
    err = cx_hmac_final((cx_hmac_t*) &ctx->hmacCtx, outBuffer + CX_AES_BLOCK_SIZE, &hmacOutSize);
    ASSERT(err == CX_OK);
    ASSERT(hmacOutSize == DH_HMAC_SIZE);

    return CX_AES_BLOCK_SIZE + DH_HMAC_SIZE;
}

size_t dh_encode(bip44_path_t* pathSpec,
                 public_key_t* publicKey,
                 const uint8_t* iv,
                 size_t ivSize,
                 const uint8_t* inBuffer,
                 size_t inSize,
                 uint8_t* outBuffer,
                 size_t outSize) {
    dh_aes_key_t key;
    TRACE("dh_encode");

    ASSERT(inSize < BUFFER_SIZE_PARANOIA);

    size_t written = 0;

    BEGIN_TRY {
        TRY {
            dh_init_aes_key(&key, pathSpec, publicKey);

            dh_context_t ctx;
            written +=
                dh_encode_init(&ctx, &key, iv, ivSize, outBuffer + written, outSize - written);
            written += dh_encode_append(&ctx,
                                        &key,
                                        inBuffer,
                                        inSize,
                                        outBuffer + written,
                                        outSize - written);
            written += dh_encode_finalize(&ctx, &key, outBuffer + written, outSize - written);
        }
        FINALLY {
            explicit_bzero(&key, sizeof(key));
        }
    }
    END_TRY;

    return written;
}