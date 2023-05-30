/*******************************************************************************
 *   Taras Shchybovyk
 *   (c) 2018 Taras Shchybovyk
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ********************************************************************************/
#include <string.h>
#include "eos_utils.h"
#include "os.h"
#include "cx.h"
#include "utils.h"

/**
 * EOS way to check if a signature is canonical :/
 */
unsigned char check_canonical(uint8_t *rs) {
    return !(rs[0] & 0x80) && !(rs[0] == 0 && !(rs[1] & 0x80)) && !(rs[32] & 0x80) &&
           !(rs[32] == 0 && !(rs[33] & 0x80));
}

int ecdsa_der_to_sig(const uint8_t *der, uint8_t *sig) {
    int length;
    int offset = 2;
    int delta = 0;
    if (der[offset + 2] == 0) {
        length = der[offset + 1] - 1;
        offset += 3;
    } else {
        length = der[offset + 1];
        offset += 2;
    }
    if ((length < 0) || (length > 32)) {
        return 0;
    }
    while ((length + delta) < 32) {
        sig[delta++] = 0;
    }
    memcpy(sig + delta, der + offset, length);

    delta = 0;
    offset += length;
    if (der[offset + 2] == 0) {
        length = der[offset + 1] - 1;
        offset += 3;
    } else {
        length = der[offset + 1];
        offset += 2;
    }
    if ((length < 0) || (length > 32)) {
        return 0;
    }
    while ((length + delta) < 32) {
        sig[32 + delta++] = 0;
    }
    memcpy(sig + 32 + delta, der + offset, length);

    return 1;
}

/**
 * The nonce generated by internal library CX_RND_RFC6979 is not compatible
 * with EOS. So this is the way to generate nonve for EOS.
 * Arguments (by relatko):
 * - rnd - out
 * - h1 - hash, in
 * - x - private key, in
 * - x_len - private key length
 * - q - SECP256K1_N, in
 * - q_len - 32, in
 * - V, out
 * - K, out
 */
void rng_rfc6979(unsigned char *rnd,
                 unsigned char *h1,
                 unsigned char *x,
                 unsigned int x_len,
                 const unsigned char *q,
                 unsigned int q_len,
                 unsigned char *V,
                 unsigned char *K) {
    unsigned int h_len, found, i;
    cx_hmac_sha256_t hmac;

    h_len = 32;
    // a. h1 as input

    // loop for a candidate
    found = 0;
    while (!found) {
        if (x) {
            // b.  Set:          V = 0x01 0x01 0x01 ... 0x01
            memset(V, 0x01, h_len);
            // c. Set: K = 0x00 0x00 0x00 ... 0x00
            memset(K, 0x00, h_len);
            // d.  Set: K = HMAC_K(V || 0x00 || int2octets(x) || bits2octets(h1))
            V[h_len] = 0;
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, 0, V, h_len + 1, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, 0, x, x_len, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, h1, h_len, K, 32);
            // e.  Set: V = HMAC_K(V)
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, V, h_len, V, 32);
            // f.  Set:  K = HMAC_K(V || 0x01 || int2octets(x) || bits2octets(h1))
            V[h_len] = 1;
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, 0, V, h_len + 1, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, 0, x, x_len, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, h1, h_len, K, 32);
            // g. Set: V = HMAC_K(V) --
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, V, h_len, V, 32);
            // initial setup only once
            x = NULL;
        } else {
            // h.3  K = HMAC_K(V || 0x00)
            V[h_len] = 0;
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, V, h_len + 1, K, 32);
            // h.3 V = HMAC_K(V)
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, V, h_len, V, 32);
        }

        // generate candidate
        /* Shortcut: As only secp256k1/sha256 is supported, the step h.2 :
         *   While tlen < qlen, do the following:
         *     V = HMAC_K(V)
         *     T = T || V
         * is replace by
         *     V = HMAC_K(V)
         */
        x_len = q_len;
        while (x_len) {
            if (x_len < h_len) {
                h_len = x_len;
            }
            cx_hmac_sha256_init(&hmac, K, 32);
            cx_hmac((cx_hmac_t *) &hmac, CX_LAST, V, h_len, V, 32);
            memcpy(rnd, V, h_len);
            x_len -= h_len;
        }

        // h.3 Check T is < n
        for (i = 0; i < q_len; i++) {
            if (V[i] < q[i]) {
                found = 1;
                break;
            }
        }
    }
}

unsigned char const BASE58ALPHABET[58] = {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
    'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
    'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

#define MAX_B58ENC_LENGTH 60

bool b58enc(uint8_t *bin, uint32_t binsz, char *b58, uint32_t *b58sz) {
    int carry;
    uint32_t i, j, high, zcount = 0;
    uint32_t size;

    while (zcount < binsz && !bin[zcount]) ++zcount;

    size = (binsz - zcount) * 138 / 100 + 1;
    uint8_t buf[MAX_B58ENC_LENGTH];
    ASSERT(size <= MAX_B58ENC_LENGTH);
    memset(buf, 0, sizeof(buf));

    for (i = zcount, high = size - 1; i < binsz; ++i, high = j) {
        for (carry = bin[i], j = size - 1; (j > high) || carry; --j) {
            ASSERT(j < size);
            carry += 256 * buf[j];
            buf[j] = carry % 58;
            carry /= 58;
            if (!j) {
                // Otherwise j wraps to maxint which is > high
                break;
            }
        }
    }

    for (j = 0; j < size && !buf[j]; ++j)
        ;

    if (*b58sz <= zcount + size - j) {
        *b58sz = zcount + size - j + 1;
        return false;
    }

    if (zcount) memset(b58, '1', zcount);
    for (i = zcount; j < size; ++i, ++j) {
        ASSERT(buf[j] < 58);
        ASSERT(i < *b58sz);
        b58[i] = BASE58ALPHABET[buf[j]];
    }
    b58[i] = '\0';
    *b58sz = i + 1;

    return true;
}

uint32_t compressed_public_key_to_wif(const uint8_t *publicKey,
                                      uint32_t keyLength,
                                      char *out,
                                      uint32_t outLength) {
    ASSERT(publicKey != NULL);
    ASSERT(keyLength >= 33);
    ASSERT(outLength >= 40);

    uint8_t temp[37];
    memset(temp, 0, sizeof(temp));
    memcpy(temp, publicKey, 33);

    uint8_t check[20];
    cx_ripemd160_t riprip;
    cx_ripemd160_init(&riprip);
    cx_hash(&riprip.header, CX_LAST, temp, 33, check, sizeof(check));
    memcpy(temp + 33, check, 4);

    memset(out, 0, outLength);
    out[0] = 'F';
    out[1] = 'I';
    out[2] = 'O';
    uint32_t addressLen = outLength - 3;
    b58enc(temp, sizeof(temp), out + 3, &addressLen);
    ASSERT(addressLen + 3 < outLength);

    return addressLen + 3;
}

uint32_t public_key_to_wif(const uint8_t *publicKey,
                           uint32_t keyLength,
                           char *out,
                           uint32_t outLength) {
    ASSERT(publicKey != NULL);
    ASSERT(keyLength >= 33);
    ASSERT(outLength >= 40);

    uint8_t temp[33];
    // is even?
    temp[0] = (publicKey[64] & 0x1) ? 0x03 : 0x02;
    memcpy(temp + 1, publicKey + 1, 32);
    return compressed_public_key_to_wif(temp, sizeof(temp), out, outLength);
}
