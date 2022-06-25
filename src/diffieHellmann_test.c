#ifdef DEVEL

#include "diffieHellman.h"
#include "hexUtils.h"
#include "testUtils.h"
#include "utils.h"
#include "bip44.h"
#include "state.h"

#define HD HARDENED_BIP32

// The testcases here were generated using:
// To create shared secret (this creates SharedCipher instance):
// https://github.com/fioprotocol/fiojs/blob/10848a02983a4b5b7f185c90bc96fb78e9ab0a6f/src/encryption-fio.ts#L20
// For encryption (this is method of SharedCypher):
// https://github.com/fioprotocol/fiojs/blob/10848a02983a4b5b7f185c90bc96fb78e9ab0a6f/src/encryption-fio.ts#L52
// It was not very convenient to use higher level funtions for this purpose as they depend on fio
// serialization

__noinline_due_to_stack__ static void pathSpec_init(bip44_path_t* pathSpec,
                                                    const uint32_t* pathArray,
                                                    uint32_t pathLength) {
    pathSpec->length = pathLength;
    memmove(pathSpec->path, pathArray, pathLength * 4);
}

__noinline_due_to_stack__ static void run_dh_encode_tests() {
    BEGIN_ASSERT_NOEXCEPT {
        TRACE_STACK_USAGE();
        // initializing derivation paths
        uint32_t path[] = {HD + 44, HD + 235, HD + 0, 0, 0};
        bip44_path_t pathSpec;
        pathSpec_init(&pathSpec, path, 5);
        bip44_PRINTF(&pathSpec);
        PRINTF("\n");

        public_key_t publicKey;
        const char* publicKeyHex =
            "0484e52dfea57b8f1787488a356374cd8e8515b8ad8db3dd4f9088d8e42ed2fb6d571e8894cccbdbf15e1b"
            "d84f8b4362f52d1b5b712b9775c0a51cdd5ee9a9e8ca";
        uint8_t publicKeyBuffer[65];
        size_t publicKeyLen = decode_hex(publicKeyHex, publicKeyBuffer, SIZEOF(publicKeyBuffer));
        ASSERT(publicKeyLen == 65);
        cx_ecfp_init_public_key_no_throw(CX_CURVE_SECP256K1,
                                         publicKeyBuffer,
                                         publicKeyLen,
                                         &publicKey);

        const uint8_t IV[DH_AES_IV_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

#define TESTCASE(msgHex_, expectedEncMsg)                                \
    {                                                                    \
        const char* msgHex = msgHex_;                                    \
        uint8_t msg[100];                                                \
        size_t msgLen = decode_hex(msgHex, msg, SIZEOF(msg));            \
        uint8_t encMsg[200];                                             \
        size_t encMsgLength = dh_encode(&pathSpec,                       \
                                        &publicKey,                      \
                                        IV,                              \
                                        DH_AES_IV_SIZE,                  \
                                        msg,                             \
                                        msgLen,                          \
                                        encMsg,                          \
                                        SIZEOF(encMsg));                 \
        ASSERT(encMsgLength == strlen(expectedEncMsg));                  \
        EXPECT_EQ_BYTES(encMsg, expectedEncMsg, strlen(expectedEncMsg)); \
    }
        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef",
                 "AAECAwQFBgcICQoLDA0OD5UItJL5bwZ8xy74x8JKwgcjEMTh02vWc3lY8KOgBVdtYLZLjoxzLYk/"
                 "bNN0yrwLMIgrbuurp69ygm5UsR1IqHBZdK332VerofQo9YrKJaxa");

        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00",
                 "AAECAwQFBgcICQoLDA0OD5UItJL5bwZ8xy74x8JKwgcjEMTh02vWc3lY8KOgBVdt+"
                 "TtaLr71hTLsLS3SHBH9tZDQWlmHQK+P2SYzQ+sdhafmlDwh0lRoLQvcTHRhnqIs");

        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0011",
                 "AAECAwQFBgcICQoLDA0OD5UItJL5bwZ8xy74x8JKwgcjEMTh02vWc3lY8KOgBVdtK4jF9Qm7cnajL5RZX"
                 "hls84KwYlmS3RlCEKDlRUEHQagBOhItLt2SM8qj/Ut1+ZRs");

        TESTCASE(
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddee",
            "AAECAwQFBgcICQoLDA0OD5UItJL5bwZ8xy74x8JKwgcjEMTh02vWc3lY8KOgBVdt+ZmX+"
            "ip0JmWwHDXH1srrwvvRvUR5y4GetFISOg7GNW9AIi9/yM68OluB9kTy91Yp");

        TESTCASE(
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddeeff",
            "AAECAwQFBgcICQoLDA0OD5UItJL5bwZ8xy74x8JKwgcjEMTh02vWc3lY8KOgBVdtYKY7MOUtuZP9tT9nugPNCr"
            "7YlPVJKaxq3f1wdpcFl6Q6NsUlrR/ENJxpviFxirB7xjkXJmOSfLB1+nd3l+DBxA==");

#undef TESTCASE
    }
    END_ASSERT_NOEXCEPT;
}

__noinline_due_to_stack__ static void run_dh_encode_init_append_finalize_tests() {
    BEGIN_ASSERT_NOEXCEPT {
        TRACE_STACK_USAGE();

        // initializing derivation paths
        uint32_t path[] = {HD + 44, HD + 235, HD + 0, 0, 2000};
        bip44_path_t pathSpec;
        pathSpec_init(&pathSpec, path, 5);
        bip44_PRINTF(&pathSpec);
        PRINTF("\n");

        public_key_t publicKey;
        {
            const char* publicKeyHex =
                "0484e52dfea57b8f1787488a356374cd8e8515b8ad8db3dd4f9088d8e42ed2fb6d571e8894cccbdbf1"
                "5e1b"
                "d84f8b4362f52d1b5b712b9775c0a51cdd5ee9a9e8ca";
            uint8_t publicKeyBuffer[65];
            size_t publicKeyLen =
                decode_hex(publicKeyHex, publicKeyBuffer, SIZEOF(publicKeyBuffer));
            ASSERT(publicKeyLen == 65);
            cx_ecfp_init_public_key_no_throw(CX_CURVE_SECP256K1,
                                             publicKeyBuffer,
                                             publicKeyLen,
                                             &publicKey);
        }

        const uint8_t IV[DH_AES_IV_SIZE] =
            {100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100};

        dh_aes_key_t key;
        dh_init_aes_key(&key, &pathSpec, &publicKey);

        uint8_t inBuffer[50];
        uint8_t outBuffer[160];
        const char* inBufferHex =
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddeeff";
        size_t inBufferLength = decode_hex(inBufferHex, inBuffer, SIZEOF(inBuffer));
        const char* expected =
            "ZGRkZGRkZGRkZGRkZGRkZECnJe7JYjYZ/UIsDOe/"
            "llUGwVFl+lJ3Qpxm5u0fLG9kxuEGaN18XnBMEu6iJXmhERjaQhHhN4L/"
            "gZPs9AD9BNvPMXpd9H9EnR27den0hCjQqECg6QE5dZrTnSiZDLN/Yg==";

        size_t outBufferLength = 0;
        outBufferLength = dh_encode(&pathSpec,
                                    &publicKey,
                                    IV,
                                    DH_AES_IV_SIZE,
                                    inBuffer,
                                    inBufferLength,
                                    outBuffer,
                                    SIZEOF(outBuffer));
        TRACE_BUFFER(outBuffer, outBufferLength);
        ASSERT(outBufferLength == strlen(expected));
        EXPECT_EQ_BYTES(expected, outBuffer, outBufferLength);

        size_t read = 0;
        size_t written = 0;
        {
            TRACE_STACK_USAGE();
            // due to memory limitations we reuse static tx data
            dh_context_t* ctx = &instructionState.signTransactionContext.dhContext;
            outBufferLength =
                dh_encode_init(ctx, &key, IV, SIZEOF(IV), outBuffer, SIZEOF(outBuffer));
            ASSERT(outBufferLength == 20);
            EXPECT_EQ_BYTES(expected + written, outBuffer, 20);
            written += 20;  // Cache 0b, 1b

            {
                outBufferLength =
                    dh_encode_append(ctx, &key, inBuffer + read, 1, outBuffer, SIZEOF(outBuffer));
                ASSERT(outBufferLength == 0);
                read += 1;  // Cache 1b, 1b
            }
            {
                outBufferLength =
                    dh_encode_append(ctx, &key, inBuffer + read, 14, outBuffer, SIZEOF(outBuffer));
                ASSERT(outBufferLength == 0);
                read += 14;  // Cache 15b, 1b
            }

            outBufferLength =
                dh_encode_append(ctx, &key, inBuffer + read, 18, outBuffer, SIZEOF(outBuffer));
            ASSERT(outBufferLength == 44);
            EXPECT_EQ_BYTES(expected + written, outBuffer, 44);
            read += 18, written += 44;  // Cache 1b, 0b

            outBufferLength =
                dh_encode_append(ctx, &key, inBuffer + read, 1, outBuffer, SIZEOF(outBuffer));
            ASSERT(outBufferLength == 0);
            read += 1;  // Cache 2b, 0b

            outBufferLength =
                dh_encode_append(ctx, &key, inBuffer + read, 14, outBuffer, SIZEOF(outBuffer));
            ASSERT(outBufferLength == 20);
            EXPECT_EQ_BYTES(expected + written, outBuffer, 20);
            read += 14, written += 20;  // Cache 0b, 1b

            outBufferLength = dh_encode_finalize(ctx, &key, outBuffer, SIZEOF(outBuffer));
            ASSERT(outBufferLength == 68);
            EXPECT_EQ_BYTES(expected + written, outBuffer, 68);
            written += 68;

            ASSERT(read == inBufferLength);
        }
    }
    END_ASSERT_NOEXCEPT;
}

__noinline_due_to_stack__ void run_diffieHellman_test() {
    PRINTF("Running DH tests\n");
    PRINTF("If they fail, make sure you seeded your device with\n");
    PRINTF("12-word mnemonic: 11*abandon about\n");
    TRACE_STACK_USAGE();
    run_dh_encode_tests();
    run_dh_encode_init_append_finalize_tests();
}

#endif  // DEVEL
