#include <os_io_seproxyhal.h>
#include <stdint.h>
#include "errors.h"
#include "keyDerivation.h"
#include "hash.h"
#include "utils.h"
#include "fio.h"
#include "securityPolicy.h"
#include "eos_utils.h"

#define PRIVATE_KEY_SEED_LEN 64

// Taken from EOS app. Needed to produce signatures.
static uint8_t const SECP256K1_N[] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe,
    0xba, 0xae, 0xdc, 0xe6, 0xaf, 0x48, 0xa0, 0x3b, 0xbf, 0xd2, 0x5e, 0x8c, 0xd0, 0x36, 0x41, 0x41};

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t derivePrivateKey(const bip44_path_t* pathSpec,
                                                                       private_key_t* privateKey) {
    if (policyDerivePrivateKey(pathSpec) == POLICY_DENY) {
        return ERR_REJECTED_BY_POLICY;
    }

    // Sanity check
    if (pathSpec->length >= ARRAY_LEN(pathSpec->path)) {
        return ERR_ASSERT;
    }

    TRACE();
    uint8_t privateKeySeed[PRIVATE_KEY_SEED_LEN];
    explicit_bzero(privateKeySeed, SIZEOF(privateKeySeed));

    STATIC_ASSERT(CX_APILEVEL >= 5, "unsupported api level");

    cx_err_t err = os_derive_bip32_with_seed_no_throw(HDW_NORMAL,
                                                      CX_CURVE_SECP256K1,
                                                      pathSpec->path,
                                                      pathSpec->length,
                                                      privateKeySeed,
                                                      NULL,
                                                      NULL,
                                                      0);
    if (err != CX_OK) {
        explicit_bzero(privateKeySeed, SIZEOF(privateKeySeed));
        return ERR_ASSERT;
    }

    err = cx_ecfp_init_private_key_no_throw(CX_CURVE_SECP256K1, privateKeySeed, 32, privateKey);
    if (err != CX_OK) {
        explicit_bzero(privateKeySeed, SIZEOF(privateKeySeed));
        explicit_bzero(privateKey, SIZEOF(*privateKey));
        return ERR_ASSERT;
    }

    return SUCCESS;
}

__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t derivePublicKey(const bip44_path_t* pathSpec,
                                                                      public_key_t* publicKey) {
    private_key_t privateKey;
    explicit_bzero(&privateKey, SIZEOF(privateKey));

    {
        uint16_t err = derivePrivateKey(pathSpec, &privateKey);
        if (err != SUCCESS) {
            explicit_bzero(&privateKey, SIZEOF(privateKey));
            return err;
        }
    }

    cx_err_t err = cx_ecfp_init_public_key_no_throw(CX_CURVE_SECP256K1, NULL, 0, publicKey);
    if (err != CX_OK) {
        explicit_bzero(&privateKey, SIZEOF(privateKey));
        return ERR_ASSERT;
    }

    err = cx_ecfp_generate_pair_no_throw(CX_CURVE_SECP256K1,
                                         publicKey,
                                         &privateKey,
                                         1);  // 1 - private key preserved
    if (err != CX_OK) {
        explicit_bzero(&privateKey, SIZEOF(privateKey));
        return ERR_ASSERT;
    }

    return SUCCESS;
}

// This function contains code producing signatures that is taken from EOS app
// The produced signature contains both
__noinline_due_to_stack__ WARN_UNUSED_RESULT uint16_t signTransaction(bip44_path_t* wittnessPath,
                                                                      uint8_t hashBuf[SHA_256_SIZE],
                                                                      uint8_t* signature,
                                                                      size_t signatureLen) {
    if (signatureLen < 200) {
        return ERR_ASSERT;
    }

    // Derive keys and sign the transaction, setup
    private_key_t privateKey;
    explicit_bzero(&privateKey, SIZEOF(privateKey));

    // We derive the private key
    {
        uint16_t err = derivePrivateKey(wittnessPath, &privateKey);
        if (err != SUCCESS) {
            explicit_bzero(&privateKey, SIZEOF(privateKey));
            return err;
        }
        TRACE("privateKey.d:");
        TRACE_BUFFER(privateKey.d, privateKey.d_len);
    }

    // We sign the hash
    explicit_bzero(signature, signatureLen);
    uint8_t V[33];
    uint8_t K[32];
    int tries = 0;

    // Loop until a candidate matching the canonical signature is found
    for (;;) {
        if (tries == 0) {
            cx_err_t err = rng_rfc6979(signature + 100,
                                       hashBuf,
                                       privateKey.d,
                                       privateKey.d_len,
                                       SECP256K1_N,
                                       32,
                                       V,
                                       K);
            if (err != CX_OK) {
                explicit_bzero(&privateKey, SIZEOF(privateKey));
                explicit_bzero(signature, signatureLen);
                return ERR_ASSERT;
            }
        } else {
            cx_err_t err = rng_rfc6979(signature + 100, hashBuf, NULL, 0, SECP256K1_N, 32, V, K);
            if (err != CX_OK) {
                explicit_bzero(&privateKey, SIZEOF(privateKey));
                explicit_bzero(signature, signatureLen);
                return ERR_ASSERT;
            }
        }
        uint32_t infos;

        size_t sig_len_ = 100;
        cx_err_t err = cx_ecdsa_sign_no_throw(&privateKey,
                                              CX_NO_CANONICAL | CX_RND_PROVIDED | CX_LAST,
                                              CX_SHA256,
                                              hashBuf,
                                              32,
                                              signature + 100,
                                              &sig_len_,
                                              &infos);
        if (err != CX_OK) {
            explicit_bzero(&privateKey, SIZEOF(privateKey));
            explicit_bzero(signature, signatureLen);
            return ERR_ASSERT;
        }
        TRACE_BUFFER(signature + 100, 100);

        if ((infos & CX_ECCINFO_PARITY_ODD) != 0) {
            signature[100] |= 0x01;
        }
        signature[0] = 27 + 4 + (signature[100] & 0x01);
        ecdsa_der_to_sig(signature + 100, signature + 1);
        TRACE_BUFFER(signature, PUBKEY_LENGTH);

        if (check_canonical(signature + 1)) {
            TRACE("Try %d succesfull!", tries);
            break;
        } else {
            TRACE("Try %d unsuccesfull!", tries);
            tries++;
        }
    }

    explicit_bzero(&privateKey, sizeof(privateKey));
    return SUCCESS;
}
