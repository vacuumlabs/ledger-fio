# FIO Ledger App

FIO Ledger App for Ledger Nano S, Ledger Nano X, and Ledger Nano SPlus.


## Building

There are two ways how to build: local build and containerize build. Enviromental variable `BOLOS_SDK` determines the approach. If using local build it should contain directory containing SDK. If using containerize approach is should be empty.

Containerized approach is preferred. For containerized approach you need docker. For local build you need to setup the enviroment. Environment setup and developer documentation is sufficiently provided in Ledger’s [Read the Docs](https://developers.ledger.com/docs/nano-app/quickstart/).

Make sure you have:
- SDK >= 2.0.0 (for local build)
- MCU >= 1.11 (if you want to lead the app on the device)


### Building commands

To select device for which to build use enviromental variable `TARGET_DEVICE=NANO_S` (default), `TARGET_DEVICE=NANO_X`, or`TARGET_DEVICE=NANO_SP`.
To induce debug build set enviromental variable `DEVEL=1`. Thus, you can use: `TARGET_DEVICE=NANO_SP DEVEL=1 make`. 

Use the following commands:

`make` or `make build`
Builds the app, including Loading Tool.

`make all`
Builds the app, including app.hex and app.sha.256 file, excluding Loading Tool. Reqiuires ledgerblue python package.

`make clean`

`make format`

`make scan-build`

`make shell`
Starts the container and runs shell (only for container build)

`make size`
Determines the size of the app. 


## Javascript layer

`make js-yarn`

`make js-prepack`

`make js-lint`

`make js-clean`

`make js-build`

`make js-build-flowtypes`

`make js-flow`

`make js-gen-docs`

`make js-prepublish`

`make js-run-example`
Runs an example app. Requires ledger to be connected and loaded with FIO app.


## Speculos emulator and emulator tests

Requires Docker. You need to set `TARGET_DEVICE` enviromental variable (if you do not want to emulate Nano S) is a similar way as when you build the app.

`make speculos_port_5001_start`
Starts the container. You can interact with it on ports:
- 5001: API port
    You can use this api to press buttons, take snapshots; besides this you can interact at http://localhost:5001/
- 40001: APDU port
    You may use SpeculosTransport class to communicate with the device via this port. Note that this transport can be injected into main js class.

`make speculos_port_5001_stop`
Stops the container


### Running tests on Speculos

If you update JavaScript, you need to `make js-build` to compile it and then `make test-yarn` to update the dependency in tests.

`make test-yarn`
Prepares dependencies for speculos tests

`make speculos_port_5001_test`
Runs integration tests on Speculos.

`make speculos_port_5001_unit_test`
Runs unit tests on Speculos. Requires DEVEL build.


## Testing on physical device

### Setup

Make sure you have:
- SDK >= 2.0.0
- MCU >= 1.11

Environment setup and developer documentation is sufficiently provided in Ledger’s [Read the Docs](https://developers.ledger.com/docs/nano-app/quickstart/).

You want a debug version of the MCU firmware (but it blocks SDK firmware updates, so for the purpose of upgrading SDK, replace it temporarily with a non-debug one). Instructions for swapping MCU versions: https://github.com/LedgerHQ/ledger-dev-doc/blob/master/source/userspace/debugging.rst


### Troubleshooting connection problems

The quickstart guide's script sets up your udev rules, but there still might be problems.
- https://support.ledger.com/hc/en-us/articles/115005165269-Fix-connection-issues


### Loading the app

`make load`
Builds and loads the application into connected device. Just make sure to close the Ledger app on the device before running the command.

`make delete`
Deletes the application from connected device

`make seed`
Resets mnemonics and pin as desired to ones desired by test.
Many of our integration tests expect the device to be configured with a known test mnemonic.
- Plug your device while pressing the right button
- Your device will show "Recovery" in the screen
- Double click


### Running tests on real device

If you update JavaScript, you need to `make js-build` to compile it and then `make test-yarn` to update the dependency in tests.

If you do not want to click through all the screens you may, if you use DEVEL build set `HEADLESS`, e.g. `HEADLESS= make` 
At this moment we experience issues with PRINTF macro on ledger device thus you should only run `make ledger_test` on non-development build.

`make ledger_test`

`make ledger_unit_test`
This requires `DEVEL=1` app version.


## How to get a transaction body computed by Ledger (for development purposes)

If you use Speculos with `DEVEL=1` build, then you can find logs from `sha_256_append` function. Concatenating what went into hash computation gives the transaction body as signed by ledger.



