SRC := $(wildcard src/*.js src/*/*.js)
BUILD := bin/build
BUDO := node_modules/.bin/budo
TARGETS := $(patsubst src/%, %, $(SRC))
YARN_OR_NPM := $(shell which yarn npm | head -1)

ifeq ($(YARN_OR_NPM),)
$(error Missing package manager. \
				Please install yarn or npm)
endif

.PHONY: all
all: $(SRC)
	@$(BUILD) $(patsubst src/%, %, $@)

$(SRC): node_modules

$(TARGETS): node_modules
	$(BUDO) src/$@ --open

node_modules: package.json
	@$(YARN_OR_NPM) install
