STORED1 4b, STORED2 12b, stored3 64b



General APDU structure: constDataLen, varDataLen, constData, varData
===================
INIT 
----------
----------
chainId
===================
APPEND_CONST_DATA 
----------
data_to_append
----------
===================
SHOW_MESSAGE
----------
Key Len
Key
Value Len
Value
----------
===================
SHOW_DATA
----------
ValueFormat: NAME, STRING, UINT64 (1b)					
ValueValidation: NONE, LENGTH, EQUALS_STORED (1b)
ValueValidationArg 1 (1b)
ValueValidationArg 2 (1b)
Policy (1b)
Key Len: 
Key
----------
Value
===================
START_COUNTED_SECTION 
----------
ValueValidation: NONE, LENGTH(min, max)
format: UINT8, VARUINT32
----------
expected length
====================
END_COUNTED_SECTION 
----------
----------
====================
STORE_VALUE
----------
STORED_1/STORED_2/STORED_3
ValueValidation: NONE, LENGTH(min, max)
----------
Value
====================
FINISH
----------
----------
Derivation path
====================

