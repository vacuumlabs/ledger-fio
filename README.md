# FIO Ledger App

FIO Ledger App for Ledger Nano S and Ledger Nano X.


## Building

There are two ways how to build: local build and containerize build. Enviromental variable `BOLOS_SDK` determines the approach. If using local build it should contain directory containing SDK. If using containerize approach is should be empty.

Containerized approach is preferred. For containerized approach you need docker. For local build you need to setup the enviroment. Environment setup and developer documentation is sufficiently provided in Ledger’s [Read the Docs](https://developers.ledger.com/docs/nano-app/quickstart/).

Make sure you have:
- SDK >= 2.0.0 (for local build)
- MCU >= 1.11 (if you want to lead the app on the device)


### Building and app development

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


### Loading the app

`make load`
Builds and loads the application into connected device. Just make sure to close the Ledger app on the device before running the command.

`make delete`
Deletes the application from connected device

`make seed`
Resets mnemonics and pin as desired to ones desired by test.


### Starting and stopping Speculos
Requires Docker.

`make speculos_port_5001_start`
Starts the container. You can interact with it on ports:
- 5001: API port
    You can use this api to press buttons, take snapshots; besides this you can interact at http://localhost:5001/
- 40001: APDU port
    You may use SpeculosTransport class to communicate with the device via this port. Note that this transport can be injected into main js class.

`make speculos_port_5001_stop`


### Running tests

If you update JavaScript, you need to ...


### JavaScript

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


### Debug version

In `Makefile`, uncomment

    #DEVEL = 1
    #DEFINES += HEADLESS

also comment out

    DEFINES += RESET_ON_CRASH

and then run `make clean load`.

### Setup

Make sure you have:
- SDK >= 2.0.0
- MCU >= 1.11

Environment setup and developer documentation is sufficiently provided in Ledger’s [Read the Docs](https://developers.ledger.com/docs/nano-app/quickstart/).

You want a debug version of the MCU firmware (but it blocks SDK firmware updates, so for the purpose of upgrading SDK, replace it temporarily with a non-debug one). Instructions for swapping MCU versions: https://github.com/LedgerHQ/ledger-dev-doc/blob/master/source/userspace/debugging.rst

### Troubleshooting connection problems

The quickstart guide's script sets up your udev rules, but there still might be problems.
- https://support.ledger.com/hc/en-us/articles/115005165269-Fix-connection-issues

## Development

To learn more about development process and individual commands, [check the desing doc](doc/design_doc.md).

## Deploying

The build process is managed with [Make](https://www.gnu.org/software/make/).

### Make Commands

* `load`: Load signed app onto the Ledger device
* `clean`: Clean the build and output directories
* `delete`: Remove the application from the device
* `build`: Build obj and bin api artefacts without loading
* `format`: Format source code.

See `Makefile` for list of included functions.

## How to get a transaction body computed by Ledger (for development purposes)

Ordinarily, Ledger computes a rolling hash of the serialized transaction body, but the body itself is not available. It is possible to acquire it from the development build by going through the following steps:

1. [Install debug MCU](https://ledger.readthedocs.io/en/latest/userspace/debugging.html#application-debug) on your Ledger Nano S device.

2. Install the debug version of FIO app (see above).

3. Install `usbtool` and turn on [console printing](https://ledger.readthedocs.io/en/latest/userspace/debugging.html#console-printing).

4. Send a single `signTx` call to Ledger (e.g. by running `yarn test-integration --grep "<some-signTx-test>"`).

5. After the call is processed, the terminal running console printing now contains all log messages resulting from that `signTx` call. (See the `TRACE*` macros.). You can build the transactions using data between logged within sha_256_append function.

