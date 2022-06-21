#ifndef H_FIO_APP_SIGN_TRANSACTION_PARSE
#define H_FIO_APP_SIGN_TRANSACTION_PARSE
#include <stdint.h>
#include "signTransaction.h"

typedef enum {
    VALUE_FORMAT_UNKNOWN = 0x00,
    VALUE_FORMAT_BUFFER_SHOW_AS_HEX = 0x01,
    VALUE_FORMAT_ASCII_STRING = 0x02,
    VALUE_FORMAT_NAME = 0x03,
    VALUE_FORMAT_FIO_AMOUNT = 0x10,
    VALUE_UINT64 = 0x14,
} value_format_t;

typedef enum {
    VALUE_VALIDATION_UNKNOWN = 0,
    VALUE_VALIDATION_NONE = 1,
    VALUE_VALIDATION_INBUFFER_LENGTH = 2,
} value_buffer_validation_t;

void parseValue(value_format_t format,
                value_buffer_validation_t validation,
                uint8_t arg1,
                uint8_t arg2,
                const uint8_t *value,
                uint8_t valueLen,
                char display[MAX_DISPLAY_VALUE_LENGTH]);

#endif  // H_FIO_APP_SIGN_TRANSACTION_PARSE
