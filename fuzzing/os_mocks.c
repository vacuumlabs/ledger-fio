#include "cx.h"

void os_longjmp(unsigned int exception) {
    longjmp(try_context_get()->jmp_buf, exception);
}

try_context_t *current_context = NULL;
try_context_t *try_context_get(void) {
    return current_context;
}

try_context_t *try_context_set(try_context_t *ctx) {
    try_context_t *previous_ctx = current_context;
    current_context = ctx;
    return previous_ctx;
}

size_t cx_hash_get_size(const cx_hash_t *ctx) {
    return 32;
}

cx_err_t cx_sha256_init_no_throw(cx_sha256_t *hash) {
    return CX_OK;
}

cx_err_t cx_hash_no_throw(cx_hash_t *hash, uint32_t mode, const uint8_t *in, size_t len, uint8_t *out, size_t out_len) {
    return CX_OK;
}

cx_err_t cx_ecdsa_sign_no_throw(const cx_ecfp_private_key_t *pvkey,
                       uint32_t                     mode,
                       cx_md_t                      hashID,
                       const uint8_t *              hash,
                       size_t                       hash_len,
                       uint8_t *                    sig,
                       size_t *                     sig_len,
                       uint32_t *                   info){
    return CX_OK;
}

unsigned int os_serial(unsigned char *serial PLENGTH(maxlength),
                               unsigned int maxlength){
    return 7;
}