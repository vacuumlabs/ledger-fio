#include "common.h"
#include "signTransactionParse.h"
#include "hexUtils.h"
#include "textUtils.h"
#include "fio.h"

static void parse_bufferShowAsHex(const uint8_t *value,
                                  uint8_t valueLen,
                                  char display[MAX_DISPLAY_VALUE_LENGTH]) {
    VALIDATE(valueLen * 2 < MAX_DISPLAY_VALUE_LENGTH, ERR_INVALID_DATA);
    size_t outlen = encode_hex(value, valueLen, display, MAX_DISPLAY_VALUE_LENGTH);
    ASSERT(outlen < MAX_DISPLAY_VALUE_LENGTH);
    display[outlen] = 0;
}

static void parse_asciiString(const uint8_t *value,
                              uint8_t valueLen,
                              char display[MAX_DISPLAY_VALUE_LENGTH]) {
    VALIDATE(valueLen < MAX_DISPLAY_VALUE_LENGTH, ERR_INVALID_DATA);
    str_validateTextBuffer(value, valueLen);
    memcpy(display, value, valueLen);
    display[valueLen] = 0;
}

static void parse_fioAmount(const uint8_t *value,
                            uint8_t valueLen,
                            char display[MAX_DISPLAY_VALUE_LENGTH]) {
    uint64_t amount = 0;
    VALIDATE(valueLen == SIZEOF(amount), ERR_INVALID_DATA);
    memcpy(&amount, value, SIZEOF(amount));
    size_t outlen = str_formatFIOAmount(amount, display, MAX_DISPLAY_VALUE_LENGTH);
    ASSERT(outlen < MAX_DISPLAY_VALUE_LENGTH);
    display[outlen] = 0;
}

static void parse_name(const uint8_t *value,
                       uint8_t valueLen,
                       char display[MAX_DISPLAY_VALUE_LENGTH]) {
    VALIDATE(valueLen == NAME_VAR_LENGTH, ERR_INVALID_DATA);
    uint8array_name_to_string(value,
                              valueLen,
                              display,
                              MAX_DISPLAY_VALUE_LENGTH);  // null terminated, no return vallue
}

static void parse_uint64(const uint8_t *value,
                         uint8_t valueLen,
                         char display[MAX_DISPLAY_VALUE_LENGTH]) {
    uint64_t number = 0;
    VALIDATE(valueLen == SIZEOF(number), ERR_INVALID_DATA);
    memcpy(&number, value, SIZEOF(number));
    size_t outlen = str_formatUint64(number, display, MAX_DISPLAY_VALUE_LENGTH);
    ASSERT(outlen < MAX_DISPLAY_VALUE_LENGTH);
    display[outlen] = 0;
}

//-------------------- MAIN FUNCITON ----------------------

void parseValue(value_format_t format,
                value_buffer_validation_t validation,
                uint8_t arg1,
                uint8_t arg2,
                const uint8_t *value,
                uint8_t valueLen,
                char display[MAX_DISPLAY_VALUE_LENGTH]) {
    // buffer validation
    switch (validation) {
#define CASE(VALIDATION, CHECK)            \
    case VALIDATION: {                     \
        VALIDATE(CHECK, ERR_INVALID_DATA); \
        break;                             \
    }

        CASE(VALUE_VALIDATION_NONE, arg2 == 0 && arg2 == 0);
        CASE(VALUE_VALIDATION_INBUFFER_LENGTH, arg1 <= valueLen && arg2 >= valueLen);
        default:
            THROW(ERR_INVALID_DATA);
#undef CASE
    }

    // parsing
    switch (format) {
#define CASE(FORMAT, HANDLER) \
    case FORMAT:              \
        return HANDLER(value, valueLen, display);

        CASE(VALUE_FORMAT_BUFFER_SHOW_AS_HEX, parse_bufferShowAsHex);
        CASE(VALUE_FORMAT_ASCII_STRING, parse_asciiString);
        CASE(VALUE_FORMAT_FIO_AMOUNT, parse_fioAmount);
        CASE(VALUE_FORMAT_NAME, parse_name);
        CASE(VALUE_UINT64, parse_uint64);
        default:
            THROW(ERR_INVALID_DATA);
#undef CASE
    }
}
