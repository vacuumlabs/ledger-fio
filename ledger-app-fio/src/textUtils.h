#ifndef H_FIO_APP_TEXT_UTILS
#define H_FIO_APP_TEXT_UTILS

#include "common.h"

size_t str_formatFIOAmount(uint64_t amount, char* out, size_t outSize);

size_t str_formatUint64(uint64_t number, char* out, size_t outSize);

#ifdef DEVEL
void str_traceFIOAmount(const char *prefix, uint64_t amount);
#define TRACE_FIO_AMOUNT(PREFIX, AMOUNT) \
	do { \
		str_traceFioAmount(PREFIX, AMOUNT); \
	} while(0)
#else
#define TRACE_FIO_AMOUNT(PREFIX, AMOUNT)
#endif // DEVEL

#ifdef DEVEL
void str_traceUint64(uint64_t number);
#define TRACE_UINT64(NUMBER) \
	do { \
		str_traceUint64(NUMBER); \
	} while(0)
#else
#define TRACE_UINT64(NUMBER)
#endif // DEVEL

size_t str_formatValidityBoundary(uint64_t slotNumber, char* out, size_t outSize);

size_t str_formatMetadata(const uint8_t* metadataHash, size_t metadataHashSize, char* out, size_t outSize);

void str_validateTextBuffer(const uint8_t* text, size_t textSize);


#ifdef DEVEL

size_t str_textToBuffer(const char* text, uint8_t* buffer, size_t bufferSize);

void run_textUtils_test();

#endif // DEVEL

#endif // H_CARDANO_FIO_TEXT_UTILS
