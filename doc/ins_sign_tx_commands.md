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
ValueValidationArg 1 (8b)
ValueValidationArg 2 (8b)
Policy + storage (1b) higher 4 bits storage, lower 4 bits policy
Key Len: 
Key
----------
Value
===================
START_COUNTED_SECTION 
----------
ValueFormat: must be number format (1b)					
ValueValidation: NONE, LENGTH, EQUALS_STORED (1b)
ValueValidationArg 1 (8b)
ValueValidationArg 2 (8b)
----------
expected length
====================
END_COUNTED_SECTION 
----------
----------
====================
STORE_VALUE
P2: Register to store 1/2/3 1 and 2 have 8b, 3 has 64b
----------
----------
Value
====================
FINISH
----------
----------
Derivation path
====================

