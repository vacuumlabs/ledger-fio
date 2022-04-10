#*******************************************************************************
#   Ledger Nano S
#   (c) 2016 Ledger
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#*******************************************************************************

ifneq ($(BOLOS_SDK),)
$(error Containerized build, BOLOS_SDK should be empty)
endif

default_target: build

SPECULOS_SDK=2.0
SPECULOS_MODEL_SWITCH=nanos
NANO_ICON_GIF=nanos_icon.gif
BOLOS_SDK_DIRECTORY=/opt/nanos-secure-sdk
TARGET_NAME=TARGET_NANOS
TEST_DEVICE=nanos
ifeq ($(TARGET_DEVICE), NANO_X)
    $(info Targeting NanoX)
    SPECULOS_MODEL_SWITCH=nanox
    NANO_ICON_GIF=nanox_icon.gif
    BOLOS_SDK_DIRECTORY=/opt/nanox-secure-sdk
    TARGET_NAME=TARGET_NANOX
    TEST_DEVICE=nanox
endif

ifdef INTERACTIVE
INTERACTIVE_SETTING:="-i"
TTY_SETTING:="-t"
else
INTERACTIVE_SETTING:=
TTY_SETTING:=
endif

#We build the container from source to avoid this issue https://github.community/t/docker-pull-from-public-github-package-registry-fail-with-no-basic-auth-credentials-error/16358
define run_docker	
	@echo "docker host: id -u: `id -u`"
	@echo "docker host: whoami: `whoami`"
	docker version
	docker build -t ledger-app-builder:latest $(CURDIR)/submodules/ledger-app-builder
	docker run $(TTY_SETTING) $(INTERACTIVE_SETTING) $(MAKE_LINUX_DOCKER_OPTIONS) --rm \
	-e SCP_PRIVKEY=$(SCP_PRIVKEY) \
	-e BOLOS_ENV_IGNORE=/opt/bolos \
	-e COIN=$(COIN) \
	-e APP_TESTING=$(APP_TESTING) \
	-e BOLOS_SDK=$(BOLOS_SDK_DIRECTORY) \
	-e TARGET_NAME=$(TARGET_NAME) \
	-u $(USERID):$(USERID) \
	-v $(shell pwd):/app \
	$(1) \
	ledger-app-builder:latest \
	$(2)
endef

##############
#   Build    #
##############

.PHONY: shell
shell:
	$(call run_docker, -ti, bash)

.PHONY: build
build: 
	$(call run_docker, , make build)
	
.PHONY: all
all: 
	$(call run_docker, , make all)

.PHONY: clean
clean:
	$(call run_docker, , make clean)
	
.PHONY: listvariants
listvariants:
	$(call run_docker, , make listvariants)

.PHONY: size
size:
	$(call run_docker, , make size)


##############
#   Style    #
##############

.PHONY: format
format:
	$(call run_docker, , make format)

#Does not work in non-containerized build
.PHONY: scan-build
scan-build:
	$(call run_docker, , make scan-build)


##############
#    Load    #
##############

.PHONY: load
load: build
	${CURDIR}/pkg/loadingtool.sh load

.PHONY: delete
delete: build
	${CURDIR}/pkg/loadingtool.sh delete

.PHONY: seed
seed: 
	python -m ledgerblue.hostOnboard --id $(NANOS_ID) --words $(WORDS) --pin $(PIN)
