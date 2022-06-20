#ifdef DEVEL

#include "diffieHellman.h"
#include "hexUtils.h"
#include "testUtils.h"
#include "utils.h"
#include "bip44.h"

#define HD HARDENED_BIP32

// The testcases here were generated using:
// To create shared secret (this creates SharedCipher instance):
// https://github.com/fioprotocol/fiojs/blob/10848a02983a4b5b7f185c90bc96fb78e9ab0a6f/src/encryption-fio.ts#L20
// For encryption (this is method of SharedCypher):
// https://github.com/fioprotocol/fiojs/blob/10848a02983a4b5b7f185c90bc96fb78e9ab0a6f/src/encryption-fio.ts#L52
// It was not very convenient to use higher level funtions for this purpose as they depend on fio
// serialization

static void pathSpec_init(bip44_path_t* pathSpec, const uint32_t* pathArray, uint32_t pathLength) {
    pathSpec->length = pathLength;
    memmove(pathSpec->path, pathArray, pathLength * 4);
}

static void run_dh_encode_tests() {
    BEGIN_ASSERT_NOEXCEPT {
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

#define TESTCASE(msgHex_, expectedEncryptedMsgHex_)                             \
    {                                                                           \
        const char* msgHex = msgHex_;                                           \
        uint8_t msg[200];                                                       \
        size_t msgLen = decode_hex(msgHex, msg, SIZEOF(msg));                   \
        uint8_t encMsg[300];                                                    \
        size_t encMsgLength = dh_encode(&pathSpec,                              \
                                        &publicKey,                             \
                                        IV,                                     \
                                        DH_AES_IV_SIZE,                         \
                                        msg,                                    \
                                        msgLen,                                 \
                                        encMsg,                                 \
                                        SIZEOF(encMsg));                        \
        const char* expectedEncMsgHex = expectedEncryptedMsgHex_;               \
        uint8_t expectedEncMsg[300];                                            \
        decode_hex(expectedEncMsgHex, expectedEncMsg, SIZEOF(expectedEncMsg));  \
        ASSERT(encMsgLength == strlen(expectedEncMsgHex) / 2);                  \
        EXPECT_EQ_BYTES(expectedEncMsg, encMsg, strlen(expectedEncMsgHex) / 2); \
    }

        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef",
                 "000102030405060708090a0b0c0d0e0f9508b492f96f067cc72ef8c7c24ac2072310c4e1d36bd6737"
                 "958f0a3a005576d60b64b8e8c732d893f6cd374cabc0b30882b6eebaba7af72826e54b11d48a87059"
                 "74adf7d957aba1f428f58aca25ac5a")

        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00",
                 "000102030405060708090a0b0c0d0e0f9508b492f96f067cc72ef8c7c24ac2072310c4e1d36bd6737"
                 "958f0a3a005576df93b5a2ebef58532ec2d2dd21c11fdb590d05a598740af8fd9263343eb1d85a7e6"
                 "943c21d254682d0bdc4c74619ea22c")

        TESTCASE("0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0011",
                 "000102030405060708090a0b0c0d0e0f9508b492f96f067cc72ef8c7c24ac2072310c4e1d36bd6737"
                 "958f0a3a005576d2b88c5f509bb7276a32f94595e196cf382b0625992dd194210a0e545410741a801"
                 "3a122d2edd9233caa3fd4b75f9946c")

        TESTCASE(
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddee",
            "000102030405060708090a0b0c0d0e0f9508b492f96f067cc72ef8c7c24ac2072310c4e1d36bd6737958f0"
            "a3a005576df99997fa2a742665b01c35c7d6caebc2fbd1bd4479cb819eb452123a0ec6356f40222f7fc8ce"
            "bc3a5b81f644f2f75629")

        TESTCASE(
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddeeff",
            "000102030405060708090a0b0c0d0e0f9508b492f96f067cc72ef8c7c24ac2072310c4e1d36bd6737958f0"
            "a3a005576d60a63b30e52db993fdb53f67ba03cd0abed894f54929ac6addfd7076970597a43a36c525ad1f"
            "c4349c69be21718ab07bc639172663927cb075fa777797e0c1c4")

#undef TESTCASE
    }
    END_ASSERT_NOEXCEPT;
}

void run_dh_encode_init_append_finalize_tests() {
    BEGIN_ASSERT_NOEXCEPT {
        // initializing derivation paths
        uint32_t path[] = {HD + 44, HD + 235, HD + 0, 0, 2000};
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

        const uint8_t IV[DH_AES_IV_SIZE] =
            {100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100};

        dh_aes_key_t key;
        dh_init_aes_key(&key, &pathSpec, &publicKey);
        dh_context_t ctx;

        const char* inBufferHex =
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef00112233445566778899aa"
            "bbccddeeff";
        uint8_t inBuffer[200];
        size_t inBufferLength = decode_hex(inBufferHex, inBuffer, SIZEOF(inBuffer));
        const char* expectedHex =
            "6464646464646464646464646464646440a725eec9623619fd422c0ce7bf965506c15165fa5277429c66e6"
            "ed1f2c6f64c6e10668dd7c5e704c12eea22579a11118da4211e13782ff8193ecf400fd04dbcf317a5df47f"
            "449d1dbb75e9f48428d0a840a0e90139759ad39d28990cb37f62";
        uint8_t expected[300];
        decode_hex(expectedHex, expected, SIZEOF(expected));

        uint8_t outBuffer[200];
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
        ASSERT(outBufferLength == 7 * 16);
        EXPECT_EQ_BYTES(expected, outBuffer, outBufferLength);

        size_t read = 0;
        size_t written = 0;

        outBufferLength = dh_encode_init(&ctx, &key, IV, SIZEOF(IV), outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 16);
        EXPECT_EQ_BYTES(expected + written, outBuffer, 16);
        written += 16;

        outBufferLength =
            dh_encode_append(&ctx, &key, inBuffer + read, 1, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 0);
        read += 1;

        outBufferLength =
            dh_encode_append(&ctx, &key, inBuffer + read, 14, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 0);
        read += 14;

        outBufferLength =
            dh_encode_append(&ctx, &key, inBuffer + read, 18, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 32);
        EXPECT_EQ_BYTES(expected + written, outBuffer, 32);
        read += 18, written += 32;

        outBufferLength =
            dh_encode_append(&ctx, &key, inBuffer + read, 1, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 0);
        read += 1;

        outBufferLength =
            dh_encode_append(&ctx, &key, inBuffer + read, 14, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 16);
        EXPECT_EQ_BYTES(expected + written, outBuffer, 16);
        read += 14, written += 16;

        outBufferLength = dh_encode_finalize(&ctx, &key, outBuffer, SIZEOF(outBuffer));
        ASSERT(outBufferLength == 48);
        EXPECT_EQ_BYTES(expected + written, outBuffer, 48);
        written += 48;

        ASSERT(read == inBufferLength);
    }
    END_ASSERT_NOEXCEPT;
}

void run_diffieHellman_test() {
    PRINTF("Running DH tests\n");
    PRINTF("If they fail, make sure you seeded your device with\n");
    PRINTF("12-word mnemonic: 11*abandon about\n");
    run_dh_encode_tests();
    run_dh_encode_init_append_finalize_tests();
}

#endif  // DEVEL
