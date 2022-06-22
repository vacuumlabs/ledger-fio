#ifndef H_FIO_APP_SIGN_COIUNTED_SECTION
#define H_FIO_APP_SIGN_COIUNTED_SECTION

#include <stdint.h>
#include <stdbool.h>

#define MAX_NESTED_COUNTED_SECTIONS 5

// currencLevel=1 strores value on count[0], etc...
typedef struct {
    uint32_t initialized_magic;
    uint32_t count[MAX_NESTED_COUNTED_SECTIONS];
    uint8_t currentLevel;
} tx_counted_section_t;

void countedSectionInit(tx_counted_section_t *cs);

bool countedSectionBegin(tx_counted_section_t *cs, uint32_t expectedLength);

bool countedSectionProcess(tx_counted_section_t *cs, uint32_t expectedLength);

bool countedSectionEnd(tx_counted_section_t *cs);

bool countedSectionFinalize(tx_counted_section_t *cs);

#ifdef DEVEL
void run_countedSection_test();
#endif  // DEVEL

#endif  // H_FIO_APP_SIGN_COIUNTED_SECTION
