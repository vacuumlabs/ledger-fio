# Sign Transaction

**Description**

Construct and sign a transaction (returns just the signature).

Due to Ledger constraints and potential security implications (parsing errors), FIO Ledger app uses a custom format for streaming the transaction to be signed. The main rationale behind is the following:
1) Serializing is easier than parsing. This is true especially if transaction chunks would not be aligned with processing (e.g., inputs/outputs arbitrarily split between multiple APDUs). This also allows a potentially smaller memory footprint on the device.
2) SignTx communication protocol is more extensible in the future.
3) Potential security improvement --- because SignTx does not output the serialized transaction, only the witnesses, the host app is responsible for serializing the transaction itself. Any serialization mismatch between host and Ledger would result in a transaction which is rejected by nodes.

**SignTx Limitations**

- Single Transfer FIO tokens action, single authorization. Actor in authorization and action data must be the same. 

**Communication protocol non-goals:**

The communication protocol is designed to *ease* the Ledger App implementation (and simplify potential edge conditions). As such, the protocol might need more APDU exchanges than strictly necessary. We deem this as a good tradeoff between implementation and performance (after all, the bottleneck are user UI confirmations).

Given these requirements in mind, here is how transaction signing works:

## Signing

Transaction signing consists of an exchange of several APDUs. During this exchange, Ledger keeps track of its current internal state, so APDU messages have to be sent in the order of increasing P1 values, and the entities in the transaction body are serialized in the same order as the messages are received. The Ledger maintains an internal state and refuses to accept APDU messages that are out of place by aborting the transaction being signed. (This also applies to outputs and pool registration certificates which are serialized in multiple steps.)

By BIP44, we refer here both to the original BIP44 scheme and its Cardano Shelley analogue using 1852' in place of 44'.

**General command**

|Field|Value|
|-----|-----|
| CLA | `0xD7` |
| INS | `0x21` |
|  P1 | signing phase |
|  P2 | (specific for each subcall) |

The phases must follow in sequence, each call exactly once. Ledger is computing the rolling hash of the serialized transaction.

### Initialize signing

Initializes signing request.

**Command**

|Field|Value|
|-----|-----|
|  P1 | `0x01` |
|  P2 | unused |

*Data*

|Field| Length | Comments|
|------|-----|-----|
| chainId                                | 32 |  |

*Serialization*

Serializes chainId as it is.

### Transaction header

|Field|Value|
|-----|-----|
|  P1 | `0x02` |
|  P2 | unused |

*Data*

Ledger cannot parse and display generic auxiliary data in full because their structure is too loose and their memory footprint potentially too big.
So only the hash is transferred and displayed and the user has to use other means of verification that the hash is correct.

|Field| Length | Comments|
|-----|--------|--------|
| Expiration | 4 | time_t, little endian |
| Ref block num | 2 | little endian |
| Ref block prefix | 4 | little endian |

*Serialization*

Converts all three integer to big endian for serialization. Then it adds 4 zero bytes which stand for `max_net_usage_words`, `max_cpu_usage_ms`, `delay_sec`, and number of context-free actions. 


### Action header

**Command**

|Field|Value|
|-----|-----|
|  P1 | `0x03` |
|  P2 | unused |

*Data*

|Field| Length | Comments|
|-----|--------|--------|
| Contract, Account, Name | 16 |  serialized as they go into the transaction |

Ledger knows and recognizes the constant and asigns correct actiion to it.

*Serialization*

Adds one byte with value 1, this stands for one action. 16 bytes from APDU data follows.


### Action Authorization

**Command (top-level output data)**

|Field|Value|
|-----|-----|
|  P1 | `0x04` |
|  P2 | unused |

*Data*

|Field| Length | Comments|
|-----|--------|--------|
| Actor | 8 | Serialized as `name`|
| Permission | 8 | Serialized as `name`|

*Serialization*

Adds one byte with value 1, this stands for one auhorization. Actor and Permission follow (8+8 bytes).


### Action Data

As of now, only Transfer FIO tokens action is implemented.

|Field|Value|
|-----|-----|
|  P1 | `0x05` |
|  P2 | unused |

*Data*

We add trailing zeroes to he string. Thus APDU data length will be Data length (as it goes to the transaction) +3. This is for two trailing 0's and data length field.

|Field| Length | Comments|
|-----|--------|--------|
| Data length | 1 | Length of the action data in the transaction|
| Pubkey length | 1 | |
| Pubkey | Pubkey lenght | |
| 0 | 1 | Pubkey trailing `0` |
| Amount | 8 | little endian in SUFs |
| Fee | 8 | little endian in SUFs |
| Actor | 8 | Serialized as `name`, must match Action authorization `actor` |
| tpid length | 1 | |
| tpid | tpid lenght | |
| 0 | 1 | Tpid trailing `0` |

*Serialization*

The data are serialized as in APDU, except:
- the two trailing 0's are ommited
- amount and fee are converted to big endian.
The Data length field must be equal to the ledgth of the rest of serialized data.

### Compute witnesses

Given a valid BIP44 path, sign TxHash by Ledger. Return the hash and the signature.
The caller is responsible for assembling the actual witness.

**Command**

|Field|Value|
|-----|-----|
|  P1 | `0x10` |
|  P2 | unused |
| data | BIP44 path. See [GetExtPubKey call](ins_get_public_key.md) for a format example |

*Serialization*

Adds 33 empty bytes. This stands for extension points (1 byte) and context-free data (32 bytes).

**Response**

|Field|Length| Comments|
|-----|-----|-----|
| Signature |65| Witness signature.|
| Hash |32| Serialized Tx hash.|
