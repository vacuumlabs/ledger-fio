#include "uiScreens.h"
#include "bech32.h"
#include "hexUtils.h"
#include "textUtils.h"


void ui_displayPathScreen(
        const char* screenHeader,
        const bip44_path_t* path,
        ui_callback_fn_t callback
)
{
	ASSERT(strlen(screenHeader) > 0);
	ASSERT(strlen(screenHeader) < BUFFER_SIZE_PARANOIA);

	char pathStr[1 + BIP44_MAX_PATH_STRING_LENGTH];
	bip44_printToStr(path, pathStr, SIZEOF(pathStr));

	ui_displayPaginatedText(
	        screenHeader,
	        pathStr,
	        callback
	);
}

void ui_displayUint64Screen(
        const char* screenHeader,
        uint64_t value,
        ui_callback_fn_t callback
)
{
	char valueStr[30];
	str_formatUint64(value, valueStr, SIZEOF(valueStr));

	ui_displayPaginatedText(
	        screenHeader,
	        valueStr,
	        callback
	);
}

void ui_displayHexBufferScreen(
        const char* screenHeader,
        const uint8_t* buffer, size_t bufferSize,
        ui_callback_fn_t callback
)
{
	ASSERT(strlen(screenHeader) > 0);
	ASSERT(strlen(screenHeader) < BUFFER_SIZE_PARANOIA);
	ASSERT(bufferSize > 0);
	ASSERT(bufferSize <= 32); // this is used for hashes, all are <= 32 bytes

	char bufferHex[2 * 32 + 1];
	explicit_bzero(bufferHex, SIZEOF(bufferHex));

	size_t length = encode_hex(
	                        buffer, bufferSize,
	                        bufferHex, SIZEOF(bufferHex)
	                );
	ASSERT(length == strlen(bufferHex));
	ASSERT(length == 2 * bufferSize);

	ui_displayPaginatedText(
	        screenHeader,
	        bufferHex,
	        callback
	);
}

#define BECH32_BUFFER_SIZE_MAX 150
#define BECH32_PREFIX_LENGTH_MAX 10

// works for bufferSize <= 150 and prefix length <= 10
void ui_displayBech32Screen(
        const char* screenHeader,
        const char* bech32Prefix,
        const uint8_t* buffer, size_t bufferSize,
        ui_callback_fn_t callback
)
{
	{
		// assert inputs
		ASSERT(strlen(screenHeader) > 0);
		ASSERT(strlen(screenHeader) < BUFFER_SIZE_PARANOIA);

		ASSERT(strlen(bech32Prefix) > 0);
		ASSERT(strlen(bech32Prefix) <= BECH32_PREFIX_LENGTH_MAX);

		ASSERT(bufferSize <= BECH32_BUFFER_SIZE_MAX);
	}

	char encodedStr[10 + BECH32_PREFIX_LENGTH_MAX + 2 * BECH32_BUFFER_SIZE_MAX]; // rough upper bound on required size
	explicit_bzero(encodedStr, SIZEOF(encodedStr));

	{
		size_t len = bech32_encode(bech32Prefix, buffer, bufferSize, encodedStr, SIZEOF(encodedStr));

		ASSERT(len == strlen(encodedStr));
		ASSERT(len + 1 <= SIZEOF(encodedStr));
	}

	ui_displayPaginatedText(
	        screenHeader,
	        encodedStr,
	        callback
	);
}


