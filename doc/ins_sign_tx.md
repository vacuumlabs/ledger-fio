# Sign Transaction

**Description**

Construct and sign a transaction (returns just the signature).

For FIO app main use cases it is instrumental that the app is as small as possible, while we need to have >20 different workflows for various actions. To accomplish this we designed several commands to serialize transaction while displaying (or not) parts of it. Each command is divided into constant part and variable part. Constant parts of the commands are used to calculate integrity hash by contatenating integrity hash of the previous command with constant parts of current command to produce new integrity hash. This process creates a Merkle tree and at every critical step (signing transaction, finishing DH encryption) we compare the integrity hash to one stored in the app. This guarantees that to get ether a signature or encrypted message, the constant parts of theinstructions and the ordering of the instructions have to match exactly.

For the list of allowed command sequences, see [List of allowed command sequences](allowed_command_sequences.md)

The main rationale behind is the following:
1) This approach reduces app size. The app size is almost constant while we add new features.
2) Decreases memory footprint (and no need to use flash memory). We never store whole transaction on the device. The data arrives in natural chunks.
3) Communication protocol is easily extensible in the future.
4) Potential security improvement --- because SignTx does not output the serialized transaction, only the witnesses, the host app is responsible for serializing the transaction itself. Any serialization mismatch between host and Ledger would result in a transaction which is rejected by nodes.

**SignTx Limitations**

- Single Transfer FIO tokens action, single authorization. Actor in authorization and action data must be the same. 

**Communication protocol non-goals:**

The communication protocol is designed to *ease* the Ledger App implementation (and simplify potential edge conditions). As such, the protocol might need more APDU exchanges than strictly necessary. We deem this as a good trade-off between implementation and performance (after all, the bottleneck are user UI confirmations).

Given these requirements in mind, here is how transaction signing works:

## General command structure

**Command**

| Field | Value    |
| ----- | -------- |
| CLA   | `0xD7`   |
| INS   | `0x20`   |
| P1    | command  |
| P2    | variable |
| Lc    | variable |

**Data**

| Field                 | Length   | Comments                            |
| ----------------------| -------- | ----------------------------------- |
| Constant data length  | 1        |                                     |
| Variable data length  | 1        |                                     |
| Constant data         | variable | Length matches constant data length |
| Variable data         | variable | Length matches variable data length |

Ledger will will process only certain paths, other paths will be rejected by app policy (see Ledger responsibilities section). 

**Return value**

FINISH command returns signature and serialized transaction hash. All other commands wither do return nothing, or return newly encoded Diffie-Hellman blocks if we are within DH-encoded sections


## List of commands

### INIT

| Field | Value    |
| ---------------- |
| P1    | `0x01`   |
| P2    | unused   |

**Constant data**

| Field                             | Length | Comments                            |
| --------------------------------- | ------ | ----------------------------------- |
| (none)                            |        |                                     |

**Variable data**

| Field                             | Length | Comments                           |
| --------------------------------- | -------| ---------------------------------- |
| Chain ID                          | 32     | Must be mainnet or testnet chainId |
| BIP32 path len                    | 1      | min 2, max 10                      |
| First derivation index            | 4      | Little endian. Must be 44'         |
| Second derivation index           | 4      | Little endian. Must be 235'        |
| (optional) Third derivation index | 4      | Little endian                      |
| ...                               | ...    | ...                                |
| (optional) Last derivation index  | 4      | Little endian                      |
| (optional) No. of remaining keys  | 4      | Little endian                      |

**Ledger actions**

- Validate Chain Id
- Validate derivation path, ledger accepts only certain derivation paths (see [src/securityPolicy.c](../src/securityPolicy.c))
- Appends Chain Id to the transaction
- Display chain to the user
- Initialize integrity validation

### APPEND_CONST_DATA 

| Field | Value    |
| ---------------- |
| P1    | `0x02`   |
| P2    | unused   |

**Constant data**

| Field                             | Length   | Comments                            |
| --------------------------------- | -------- | ----------------------------------- |
| Data to append to transaction     | variable |                                     |

**Variable data**

| Field                             | Length | Comments                            |
| --------------------------------- | ------ | ----------------------------------- |
| (none)                            |        |                                     |

**Ledger actions**

- Appends data to the transaction
- Continue integrity validation

### SHOW_MESSAGE

| Field | Value    |
| ---------------- |
| P1    | `0x03`   |
| P2    | unused   |

**Constant data**

| Field                             | Length   | Comments                            |
| --------------------------------- | -------- | ----------------------------------- |
| Key Len                           | 1        |                                     |
| Key                               | variable |                                     |
| Value Len                         | 1        |                                     |
| Value                             | variable |                                     |

**Variable data**

| Field                             | Length | Comments                            |
| --------------------------------- | ------ | ----------------------------------- |
| (none)                            |        |                                     |

**Ledger actions**

- Display the message
- Continue integrity validation

### APPEND_DATA

| Field | Value    |
| ---------------- |
| P1    | `0x04`   |
| P2    | unused   |

**Constant data**

| Field                             | Length   | Comments                                   |
| --------------------------------- | -------- | ------------------------------------------ |
| Value Format                      | 1        | NAME, STRING, UINT64                       |
| ValueValidation                   | 1        | NONE, LENGTH, EQUALS_STORED                |
| ValueValidationArg 1              | 8        |                                            |
| ValueValidationArg 2              | 8        |                                            |
| Policy and storage                | 1        | higher 4 bits storage, lower 4 bits policy |
| Key length                        | 1        |                                            |
| Key                               | variable |                                            |

**Variable data**

| Field                             | Length   | Comments                            |
| --------------------------------- | -------- | ----------------------------------- |
| Value                             | variable |                                     |

**Ledger actions**

- Parse and validate the value
- Append value to tx
- Display key and value if policy requires it
- Continue integrity validation

### START_COUNTED_SECTION 

----------
ValueFormat: must be number format (1b)					
ValueValidation: NONE, LENGTH (1b)
ValueValidationArg 1 (8b)
ValueValidationArg 2 (8b)
----------
expected length

### END_COUNTED_SECTION 
----------
----------

### STORE_VALUE
P2: Register to store 1/2/3 1 and 2 have 8b, 3 has 64b
----------
----------
Value

### Start DH encryprion
----------
----------
Encryption pubkey

### End DH encryprion
----------
----------

### FINISH

| Field | Value    |
| ---------------- |
| P1    | `0x10`   |
| P2    | unused   |

**Constant data**

| Field                             | Length   | Comments                            |
| --------------------------------- | -------- | ----------------------------------- |
| Data to append to transaction     | variable |                                     |

**Variable data**

| Field                             | Length | Comments                                                            |
| --------------------------------- | ------ | ------------------------------------------------------------------- |
| BIP32 path len                    | 1      | min 2, max 10                      |
| First derivation index            | 4      | Little endian. Must be 44'         |
| Second derivation index           | 4      | Little endian. Must be 235'        |
| (optional) Third derivation index | 4      | Little endian                      |
| ...                               | ...    | ...                                |
| (optional) Last derivation index  | 4      | Little endian                      |
| (optional) No. of remaining keys  | 4      | Little endian                      |

Ledger will process only certain paths, other paths will be rejected by app policy (see Ledger responsibilities section). 

**Ledger actions**

- Adds 33 empty bytes to tx. This stands for extension points (1 byte) and context-free data (32 bytes).
- Finish integrity validation
- Request confirmation to sign the transaction
- Return the signature and hash

**Response**

| Field     | Length | Comments           |
| --------- | ------ | ------------------ |
| Signature | 65     | Witness signature  |
| Hash      | 32     | Serialized Tx hash |
