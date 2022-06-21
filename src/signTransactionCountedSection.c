#include "signTransactionCountedSection.h"
#include "utils.h"

enum {
    TX_COUNTED_SECTION_INITIALIZED_MAGIC = 12345,
};

void countedSectionInit(tx_counted_section_t *cs) {
    explicit_bzero(cs, SIZEOF(*cs));
    cs->initialized_magic = TX_COUNTED_SECTION_INITIALIZED_MAGIC;
}

bool countedSectionBegin(tx_counted_section_t *cs, uint16_t expectedLength) {
    STATIC_ASSERT(ARRAY_LEN(cs->count) == MAX_NESTED_COUNTED_SECTIONS, "Incorrect tx_counted_section_t count length");
    ASSERT(cs->initialized_magic == TX_COUNTED_SECTION_INITIALIZED_MAGIC);

    //too deep nesting
    if(cs->currentLevel >= MAX_NESTED_COUNTED_SECTIONS) {
        return false;    
    }

    cs->currentLevel++; 
    cs->count[cs->currentLevel-1] = expectedLength;
    return true;
}

bool countedSectionProcess(tx_counted_section_t *cs, uint16_t expectedLength) {
    STATIC_ASSERT(ARRAY_LEN(cs->count) == MAX_NESTED_COUNTED_SECTIONS, "Incorrect tx_counted_section_t count length");
    ASSERT(cs->initialized_magic == TX_COUNTED_SECTION_INITIALIZED_MAGIC);
    ASSERT(cs->currentLevel <= MAX_NESTED_COUNTED_SECTIONS);

    for(size_t i=0; i<cs->currentLevel; i++) {
        if (cs->count[i] < expectedLength) {
            return false;
        }
        cs->count[i] -= expectedLength;
    }
    return true;
}

bool countedSectionEnd(tx_counted_section_t *cs) {
    STATIC_ASSERT(ARRAY_LEN(cs->count) == MAX_NESTED_COUNTED_SECTIONS, "Incorrect tx_counted_section_t count length");
    ASSERT(cs->initialized_magic == TX_COUNTED_SECTION_INITIALIZED_MAGIC);
    ASSERT(cs->currentLevel <= MAX_NESTED_COUNTED_SECTIONS);

    // curentLevel == 0 we cannot exit counted section
    if (cs->currentLevel == 0) {
        return false;
    }

    // Counted section mismatch
    if (cs->count[cs->currentLevel-1] != 0) {
        return false;
    }

    cs->currentLevel--;
    return true;
}

bool countedSectionFinalize(tx_counted_section_t *cs) {
    STATIC_ASSERT(ARRAY_LEN(cs->count) == MAX_NESTED_COUNTED_SECTIONS, "Incorrect tx_counted_section_t count length");
    ASSERT(cs->initialized_magic == TX_COUNTED_SECTION_INITIALIZED_MAGIC);

    return (cs->currentLevel == 0);
}
