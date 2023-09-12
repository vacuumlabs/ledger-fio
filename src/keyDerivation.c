#include <os_io_seproxyhal.h>
#include <stdint.h>

#include "assert.h"
#include "errors.h"
#include "keyDerivation.h"
#include "hash.h"
#include "utils.h"
#include "fio.h"
#include "securityPolicy.h"

#define PRIVATE_KEY_SEED_LEN 64

__noinline_due_to_stack__ void derivePrivateKey(const bip44_path_t* pathSpec,
                                                private_key_t* privateKey) {
    ENSURE_NOT_DENIED(policyDerivePrivateKey(pathSpec));

    // Sanity check
    ASSERT(pathSpec->length < ARRAY_LEN(pathSpec->path));

    TRACE();
    uint8_t privateKeySeed[PRIVATE_KEY_SEED_LEN];

    BEGIN_TRY {
        TRY {
            STATIC_ASSERT(CX_APILEVEL >= 5, "unsupported api level");

            io_seproxyhal_io_heartbeat();
            CX_THROW(os_derive_bip32_with_seed_no_throw(HDW_NORMAL,
                                                        CX_CURVE_SECP256K1,
                                                        pathSpec->path,
                                                        pathSpec->length,
                                                        privateKeySeed,
                                                        NULL,
                                                        NULL,
                                                        0));
            io_seproxyhal_io_heartbeat();

            CX_THROW(cx_ecfp_init_private_key_no_throw(CX_CURVE_SECP256K1,
                                                       privateKeySeed,
                                                       32,
                                                       privateKey));
        }
        FINALLY {
            explicit_bzero(privateKeySeed, SIZEOF(privateKeySeed));
        }
    }
    END_TRY;
}

__noinline_due_to_stack__ void derivePublicKey(const bip44_path_t* pathSpec,
                                               public_key_t* publicKey) {
    private_key_t privateKey;
    BEGIN_TRY {
        TRY {
            derivePrivateKey(pathSpec, &privateKey);
            // We should do cx_ecfp_generate_pair here, but it does not work in SDK < 1.5.4,
            // should work with the new SDK
            io_seproxyhal_io_heartbeat();
            CX_THROW(cx_ecfp_init_public_key_no_throw(CX_CURVE_SECP256K1, NULL, 0, publicKey));
            CX_THROW(cx_ecfp_generate_pair_no_throw(CX_CURVE_SECP256K1,
                                                    publicKey,
                                                    &privateKey,
                                                    1));  // 1 - private key preserved
            io_seproxyhal_io_heartbeat();
        }
        FINALLY {
            explicit_bzero(&privateKey, SIZEOF(privateKey));
        }
    }
    END_TRY;
}
