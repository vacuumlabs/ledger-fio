#ifndef H_FIO_APP_STATE
#define H_FIO_APP_STATE

#include "getVersion.h"

typedef struct {
	int placeholder;
	int placeholder2;
} placeholder_t;

typedef struct {
	int placeholder;
	int placeholder2;
} placeholder2_t;



typedef union {
	// Here should go states of all instructions
	placeholder_t placeholder;
	placeholder2_t placeholder2;
} instructionState_t;

// Note(instructions are uint8_t but we have a special INS_NONE value
extern int currentInstruction;

extern instructionState_t instructionState;

#endif // H_FIO_APP_STATE
