#include "diffieHellman.h"
#include "os_math.h"

//---------------------------- UTILS ---------------------------------------

static const uint8_t BASE64[64] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
                                   'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                                   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                                   'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                                   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};

static void base64EncBlock(uint8_t in[3], uint8_t out[4]) {
    out[0] = BASE64[(in[0] / 0x04) & 0x3F];
    out[1] = BASE64[(in[0] * 0x10 + in[1] / 0x10) & 0x3F];
    out[2] = BASE64[(in[1] * 0x04 + in[2] / 0x40) & 0x3F];
    out[3] = BASE64[in[2] & 0x3F];
}

// Base64 encodes as many block as possible.
// Move unencoded part of inBuffer to the beginning and sets inSize accordingly
static WARN_UNUSED_RESULT uint16_t base64EncWholeBlocks(uint8_t *inBuffer,
                                                        uint8_t *inSize,
                                                        uint8_t *outBuffer,
                                                        uint16_t *outSize) {
    uint8_t processedBlocks = 0;
    while (1) {
        // We cannot process whole block
        if (*inSize < BASE64_IN_BLOCK_SIZE * (processedBlocks + 1)) {
            // move unread inBuffer data to beginning and set new inSize
            *inSize -= BASE64_IN_BLOCK_SIZE * processedBlocks;
            memmove(inBuffer, inBuffer + BASE64_IN_BLOCK_SIZE * processedBlocks, *inSize);
            break;
        }

        // process one block
        if (*outSize < BASE64_OUT_BLOCK_SIZE * (processedBlocks + 1)) {
            return ERR_ASSERT;
        };
        base64EncBlock(inBuffer + BASE64_IN_BLOCK_SIZE * processedBlocks,
                       outBuffer + BASE64_OUT_BLOCK_SIZE * processedBlocks);
        processedBlocks++;
    }
    *outSize = BASE64_OUT_BLOCK_SIZE * processedBlocks;
    return SUCCESS;
}

// Encodes one block from cache using AES key
// Move unencoded part of inBuffer to the beginning and sets inSize accordingly
static WARN_UNUSED_RESULT uint16_t processDHOneBlockFromCache(dh_context_t *ctx,
                                                              const dh_aes_key_t *aesKey,
                                                              uint8_t *outBuffer,
                                                              uint16_t *outSize) {
    // precondition sanity check
    if (ctx->cacheLength != CX_AES_BLOCK_SIZE) {
        return ERR_ASSERT;
    }
    STATIC_ASSERT(SIZEOF(ctx->IV) == CX_AES_BLOCK_SIZE, "Incompatible IV size");

    // We work in CBC mode
    // 1. IV xor plaintext
    for (uint16_t i = 0; i < CX_AES_BLOCK_SIZE; i++) {
        ctx->cache[i] ^= ctx->IV[i];
    }

    // 2. encrypt the result to obtain cyphertext 3. use cyphertext as new IV
    cx_err_t err = cx_aes_enc_block(&aesKey->aesKey, ctx->cache, ctx->IV);
    if (err != CX_OK) {
        return ERR_ASSERT;
    }

    // append cyphertext (not base64 encrypted) to hmac and clear cache
    err = cx_hmac_update((cx_hmac_t *) &ctx->hmacCtx, ctx->IV, CX_AES_BLOCK_SIZE);
    if (err != CX_OK) {
        return ERR_ASSERT;
    }
    explicit_bzero(ctx->cache, SIZEOF(ctx->cache));
    ctx->cacheLength = 0;

    // base64 encode

    // sanity check, we expect that cache does not contain whole block first
    if (ctx->base64EncodingCacheLen >= BASE64_IN_BLOCK_SIZE) {
        return ERR_ASSERT;
    }
    STATIC_ASSERT(SIZEOF(ctx->base64EncodingCache) >= BASE64_IN_BLOCK_SIZE + CX_AES_BLOCK_SIZE,
                  "Cache too small");
    memmove(ctx->base64EncodingCache + ctx->base64EncodingCacheLen, ctx->IV, CX_AES_BLOCK_SIZE);
    ctx->base64EncodingCacheLen += CX_AES_BLOCK_SIZE;
    // This also sets outSize as desired
    return base64EncWholeBlocks(ctx->base64EncodingCache,
                                &ctx->base64EncodingCacheLen,
                                outBuffer,
                                outSize);
}

//---------------------------- DH ENCODING ---------------------------------------

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t
dh_init_aes_key(dh_aes_key_t *dhKey, const bip44_path_t *pathSpec, const public_key_t *publicKey) {
    // Crypto assets to be cleared
    private_key_t privateKey;
    explicit_bzero(&privateKey, SIZEOF(privateKey));
    unsigned char basicSecret[32];
    explicit_bzero(basicSecret, SIZEOF(basicSecret));
    unsigned char secret[SHA_512_SIZE];
    explicit_bzero(secret, SIZEOF(secret));
    uint8_t K[SHA_512_SIZE];
    explicit_bzero(K, SIZEOF(K));
    explicit_bzero(dhKey, SIZEOF(*dhKey));

    TRACE_STACK_USAGE();
    TRACE("dh_init_aesKey");

    {
        uint16_t err = derivePrivateKey(pathSpec, &privateKey);
        if (err != SUCCESS) {
            explicit_bzero(&privateKey, SIZEOF(privateKey));
            return err;
        }
    }

    cx_err_t err = cx_ecdh_no_throw(&privateKey,
                                    CX_ECDH_X,
                                    publicKey->W,
                                    publicKey->W_len,
                                    basicSecret,
                                    SIZEOF(basicSecret));
    explicit_bzero(&privateKey, SIZEOF(privateKey));
    if (err != CX_OK) {
        explicit_bzero(basicSecret, SIZEOF(basicSecret));
        return ERR_ASSERT;
    }

    err = sha_512_hash(basicSecret, SIZEOF(basicSecret), secret, SIZEOF(secret));
    explicit_bzero(basicSecret, SIZEOF(basicSecret));
    if (err != CX_OK) {
        explicit_bzero(secret, SIZEOF(secret));
        return ERR_ASSERT;
    }

    err = sha_512_hash(secret, SIZEOF(secret), K, SIZEOF(K));
    explicit_bzero(secret, SIZEOF(secret));
    if (err != CX_OK) {
        explicit_bzero(K, SIZEOF(K));
        return ERR_ASSERT;
    }

    // First DH_AES_SECRET_SIZE bytes are used to compute shared secret, then DH_KM_SIZE are
    // used as Km for HMAC calculation
    STATIC_ASSERT(SIZEOF(K) == DH_AES_SECRET_SIZE + DH_KM_SIZE, "Incompatible types");
    err = cx_aes_init_key_no_throw(K, DH_AES_SECRET_SIZE, &dhKey->aesKey);
    if (err != CX_OK) {
        explicit_bzero(K, SIZEOF(K));
        explicit_bzero(dhKey, SIZEOF(*dhKey));
        return ERR_ASSERT;
    }

    STATIC_ASSERT(SIZEOF(dhKey->km) == DH_KM_SIZE, "Incompatible types");
    memmove(dhKey->km, K + DH_AES_SECRET_SIZE, DH_KM_SIZE);
    explicit_bzero(K, SIZEOF(K));
    return SUCCESS;
}

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t dh_encode_init(dh_context_t *ctx,
                                                                     const bip44_path_t *pathSpec,
                                                                     const public_key_t *publicKey,
                                                                     const uint8_t *iv,
                                                                     uint16_t ivSize,
                                                                     uint8_t *outBuffer,
                                                                     uint16_t *outSize) {
    // Crypto assets to be cleared
    dh_aes_key_t aesKey;
    explicit_bzero(&aesKey, SIZEOF(aesKey));

    TRACE_STACK_USAGE();
    TRACE("dh_encode_init");

    STATIC_ASSERT(SIZEOF(ctx->IV) == CX_AES_BLOCK_SIZE, "Unexpected IV length");
    if (ivSize != SIZEOF(ctx->IV)) {
        return ERR_ASSERT;
    }

    // initialize DH context
    ctx->cacheLength = 0;
    explicit_bzero(ctx->cache, SIZEOF(ctx->cache));
    ctx->base64EncodingCacheLen = 0;
    explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
    memcpy(ctx->IV, iv, SIZEOF(ctx->IV));

    // Compute AES key
    {
        uint16_t err = dh_init_aes_key(&aesKey, pathSpec, publicKey);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }
    }

    explicit_bzero(&ctx->hmacCtx, SIZEOF(ctx->hmacCtx));
    cx_err_t err = cx_hmac_sha256_init_no_throw(&ctx->hmacCtx, aesKey.km, SIZEOF(aesKey.km));
    explicit_bzero(&aesKey, SIZEOF(aesKey));
    if (err != CX_OK) {
        return ERR_ASSERT;
    }
    err = cx_hmac_update((cx_hmac_t *) &ctx->hmacCtx, iv, ivSize);
    if (err != CX_OK) {
        return ERR_ASSERT;
    }

    ctx->initialized_magic = HASH_CONTEXT_INITIALIZED_MAGIC;

    // Base64 We encode IV
    STATIC_ASSERT(SIZEOF(ctx->base64EncodingCache) >= SIZEOF(ctx->IV), "Cache too small");
    memcpy(ctx->base64EncodingCache, ctx->IV, SIZEOF(ctx->IV));
    ctx->base64EncodingCacheLen = SIZEOF(ctx->IV);
    // This also sets outSize as desired
    return base64EncWholeBlocks(ctx->base64EncodingCache,
                                &ctx->base64EncodingCacheLen,
                                outBuffer,
                                outSize);
}

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t
dh_encode_append(dh_context_t *ctx,
                 const bip44_path_t *pathSpec,
                 const public_key_t *publicKey,
                 const uint8_t *inBuffer,
                 uint16_t inSize,
                 uint8_t *outBuffer,
                 uint16_t *outSize) {
    // Crypto assets to be cleared
    dh_aes_key_t aesKey;
    explicit_bzero(&aesKey, SIZEOF(aesKey));

    TRACE("dh_encode_append");
    TRACE_STACK_USAGE();

    // sanity checks
    if (inSize >= BUFFER_SIZE_PARANOIA) {
        return ERR_ASSERT;
    }
    if (ctx->initialized_magic != HASH_CONTEXT_INITIALIZED_MAGIC) {
        return ERR_ASSERT;
    }
    if (ctx->cacheLength >= CX_AES_BLOCK_SIZE) {
        return ERR_ASSERT;
    }
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");

    // Compute AES key
    {
        uint16_t err = dh_init_aes_key(&aesKey, pathSpec, publicKey);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }
    }

    uint16_t processedInput = 0;
    uint16_t written = 0;
    while (1) {
        // fill ctx->buffer
        uint16_t to_read = MIN(CX_AES_BLOCK_SIZE - ctx->cacheLength, inSize - processedInput);
        memcpy(ctx->cache + ctx->cacheLength, inBuffer + processedInput, to_read);
        ctx->cacheLength += to_read;
        processedInput += to_read;

        // if block is only partially filled, we finish encoding, the data was read to cache
        // this means that there was not enough input to fill the block
        if (ctx->cacheLength < CX_AES_BLOCK_SIZE) {
            TRACE("Block not full");
            break;
        }

        uint16_t restLength = *outSize - written;  // remaining buffer
        uint16_t err = processDHOneBlockFromCache(ctx, &aesKey, outBuffer + written, &restLength);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }
        written += restLength;  // processDHOneBlockFromCache returns number of bytes written
    }

    explicit_bzero(&aesKey, SIZEOF(aesKey));
    TRACE("Leaving dh_encode_append, written: %d", (int) written);
    *outSize = written;
    return SUCCESS;
}

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t
dh_encode_finalize(dh_context_t *ctx,
                   const bip44_path_t *pathSpec,
                   const public_key_t *publicKey,
                   uint8_t *outBuffer,
                   uint16_t *outSize) {
    // Crypto assets to be cleared
    dh_aes_key_t aesKey;
    explicit_bzero(&aesKey, SIZEOF(aesKey));
    // ctx->base64EncodingCache will contain final HMAC at one point
    // Crypto assets to be cleared in case of failure
    explicit_bzero(outBuffer, *outSize);  // It suffices to clear this after final hmac

    TRACE("dh_encode_finalize");
    TRACE_STACK_USAGE();

    // sanity checks
    if (ctx->initialized_magic != HASH_CONTEXT_INITIALIZED_MAGIC) {
        return ERR_ASSERT;
    }
    if (ctx->cacheLength >= CX_AES_BLOCK_SIZE) {
        return ERR_ASSERT;
    }
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");
    TRACE_BUFFER(ctx->cache, ctx->cacheLength);

    // Compute AES key
    {
        uint16_t err = dh_init_aes_key(&aesKey, pathSpec, publicKey);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }
    }

    // fill the last cache block with integers equal to number of elements missing
    // if the next block is empty we create a block full of 0x10 (CX_AES_BLOCK_SIZE)
    STATIC_ASSERT(SIZEOF(ctx->cache) >= CX_AES_BLOCK_SIZE, "dh_context_t->cache too small");
    uint8_t fillValue = CX_AES_BLOCK_SIZE - ctx->cacheLength;
    for (uint16_t i = ctx->cacheLength; i < CX_AES_BLOCK_SIZE; i++) {
        ctx->cache[i] = fillValue;
    }
    ctx->cacheLength = CX_AES_BLOCK_SIZE;

    uint8_t written = 0;

    // Encode last block
    {
        uint16_t restLength = *outSize - written;  // remaining buffer
        uint16_t err = processDHOneBlockFromCache(ctx, &aesKey, outBuffer + written, &restLength);
        explicit_bzero(&aesKey, SIZEOF(aesKey));
        if (err != SUCCESS) {
            return err;
        }
        written += restLength;
    }

    // finalize hmac and append base64 encode it and append to cyphertext
    {
        size_t hmacOutSize = SIZEOF(ctx->base64EncodingCache) - ctx->base64EncodingCacheLen;
        cx_err_t err = cx_hmac_final((cx_hmac_t *) &ctx->hmacCtx,
                                     ctx->base64EncodingCache + ctx->base64EncodingCacheLen,
                                     &hmacOutSize);
        // cache now contains possibly sensitive data
        if (err != CX_OK || hmacOutSize != DH_HMAC_SIZE) {
            explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
            return ERR_ASSERT;
        }
        ctx->base64EncodingCacheLen += DH_HMAC_SIZE;
    }

    // Encode cache content
    {
        uint16_t restLength = *outSize - written;  // remaining buffer
        uint16_t err = base64EncWholeBlocks(ctx->base64EncodingCache,
                                            &ctx->base64EncodingCacheLen,
                                            outBuffer + written,
                                            &restLength);
        if (err != SUCCESS) {
            explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
            explicit_bzero(outBuffer, *outSize);
            return err;
        }
        written += restLength;  // processDHOneBlockFromCache returns number of bytes written
    }

    // the last base64 encoding block
    uint8_t lastBlock[3] = {0, 0, 0};
    switch (ctx->base64EncodingCacheLen) {
        case 0:
            break;
        case 1:
            if (*outSize < written + BASE64_OUT_BLOCK_SIZE) {
                explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
                explicit_bzero(outBuffer, *outSize);
                return ERR_ASSERT;
            }
            lastBlock[0] = ctx->base64EncodingCache[0];
            base64EncBlock(lastBlock, outBuffer + written);
            *(outBuffer + written + 2) = '=';
            *(outBuffer + written + 3) = '=';
            written += BASE64_OUT_BLOCK_SIZE;
            break;
        case 2:
            if (*outSize < written + BASE64_OUT_BLOCK_SIZE) {
                explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
                explicit_bzero(outBuffer, *outSize);
                return ERR_ASSERT;
            }
            lastBlock[0] = ctx->base64EncodingCache[0];
            lastBlock[1] = ctx->base64EncodingCache[1];
            base64EncBlock(lastBlock, outBuffer + written);
            *(outBuffer + written + 3) = '=';
            written += BASE64_OUT_BLOCK_SIZE;
            break;
        default:
            explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
            explicit_bzero(outBuffer, *outSize);
            return ERR_ASSERT;
    }
    explicit_bzero(ctx->base64EncodingCache, SIZEOF(ctx->base64EncodingCache));
    *outSize = written;
    return SUCCESS;
}

#ifdef DEVEL
__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t dh_encode(bip44_path_t *pathSpec,
                                                                public_key_t *publicKey,
                                                                const uint8_t *iv,
                                                                uint16_t ivSize,
                                                                const uint8_t *inBuffer,
                                                                uint16_t inSize,
                                                                uint8_t *outBuffer,
                                                                uint16_t *outSize) {
    TRACE("dh_encode");
    ASSERT(inSize < BUFFER_SIZE_PARANOIA);

    dh_context_t ctx;

    uint16_t written = 0;
    uint16_t remaining = *outSize - written;
    uint16_t err =
        dh_encode_init(&ctx, pathSpec, publicKey, iv, ivSize, outBuffer + written, &remaining);
    if (err != SUCCESS) {
        return err;
    }
    written += remaining;

    remaining = *outSize - written;
    err = dh_encode_append(&ctx,
                           pathSpec,
                           publicKey,
                           inBuffer,
                           inSize,
                           outBuffer + written,
                           &remaining);
    if (err != SUCCESS) {
        return err;
    }
    written += remaining;

    remaining = *outSize - written;
    err = dh_encode_finalize(&ctx, pathSpec, publicKey, outBuffer + written, &remaining);
    if (err != SUCCESS) {
        return err;
    }
    written += remaining;

    *outSize = written;
    return SUCCESS;
}
#endif

__noinline_due_to_stack__ static WARN_UNUSED_RESULT uint16_t validateHmac(dh_aes_key_t *aesKey,
                                                                          const uint8_t *buffer,
                                                                          uint16_t inSize) {
    if (inSize < DH_AES_IV_SIZE + CX_AES_BLOCK_SIZE + DH_HMAC_SIZE) {
        return ERR_INVALID_DATA;
    }

    cx_hmac_sha256_t hmac;
    cx_err_t err = cx_hmac_sha256_init_no_throw(&hmac, aesKey->km, SIZEOF(aesKey->km));
    if (err != CX_OK) {
        return ERR_ASSERT;
    }
    err = cx_hmac_update((cx_hmac_t *) &hmac, buffer, inSize - DH_HMAC_SIZE);
    if (err != CX_OK) {
        return ERR_ASSERT;
    }
    uint8_t hmacBuf[DH_HMAC_SIZE];
    size_t outLen = SIZEOF(hmacBuf);
    err = cx_hmac_final((cx_hmac_t *) &hmac, hmacBuf, &outLen);
    if (err != CX_OK || outLen != DH_HMAC_SIZE) {
        return ERR_ASSERT;
    }
    if (memcmp(hmacBuf, buffer + inSize - DH_HMAC_SIZE, DH_HMAC_SIZE)) {
        return ERR_INVALID_HMAC;
    }
    return SUCCESS;
}

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t dh_decode(bip44_path_t *pathSpec,
                                                                public_key_t *publicKey,
                                                                uint8_t *buffer,
                                                                uint16_t *size) {
    // Crypto assets to be cleared
    dh_aes_key_t aesKey;
    explicit_bzero(&aesKey, SIZEOF(aesKey));
    // Crypto assets to be cleared in case of failure
    TRACE_BUFFER(buffer, *size);  // only after decoding

    if (*size < DH_AES_IV_SIZE + CX_AES_BLOCK_SIZE + DH_HMAC_SIZE) {
        return ERR_INVALID_DATA;
    }
    if (*size % CX_AES_BLOCK_SIZE != 0) {
        return ERR_INVALID_DATA;
    }

    // we do not decode IV, this also creates a buffer so we can decode inplace
    uint16_t read = DH_AES_IV_SIZE;
    uint16_t written = 0;
    {
        uint16_t err = dh_init_aes_key(&aesKey, pathSpec, publicKey);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }
    }

    // validate HMAC
    {
        uint16_t err = validateHmac(&aesKey, buffer, *size);
        if (err != SUCCESS) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            return err;
        }

        TRACE("HMAC validation succesfull.");
    }

    // initiate DH decryptions
    uint8_t IV[CX_AES_BLOCK_SIZE];
    memcpy(IV, buffer, SIZEOF(IV));

    for (; read < *size - DH_HMAC_SIZE; read += CX_AES_BLOCK_SIZE) {
        // 1. Decode next block
        if (read - written != CX_AES_BLOCK_SIZE) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            explicit_bzero(buffer, *size);
            return ERR_ASSERT;
        }
        cx_err_t err = cx_aes_dec_block(&aesKey.aesKey, buffer + read, buffer + written);
        if (err != CX_OK) {
            explicit_bzero(&aesKey, SIZEOF(aesKey));
            explicit_bzero(buffer, *size);
            return ERR_ASSERT;
        }
        // 2. XOR with IV
        for (uint16_t i = 0; i < CX_AES_BLOCK_SIZE; i++) {
            buffer[written + i] ^= IV[i];
        }
        // 3. Cyphertext is the new IV ... we do not care that we copy part of HMAC in last
        // iteration here
        memcpy(IV, buffer + read, CX_AES_BLOCK_SIZE);
        written += CX_AES_BLOCK_SIZE;
    }

    explicit_bzero(&aesKey, SIZEOF(aesKey));

    TRACE("Finishing decription, written:%d, lastCharacter:%d", written, buffer[written - 1]);
    // Calculate resulting length based on the last decoded value
    if (written == 0 || written < buffer[written - 1]) {
        explicit_bzero(buffer, *size);
        return ERR_INVALID_DATA;
    }

    *size = written - buffer[written - 1];
    return SUCCESS;
}
