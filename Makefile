SRC := $(wildcard src/*.js src/*/*.js)
BUILD := bin/build
YARN_OR_NPM := $(shell which yarn npm | head -1)

ifeq ($(YARN_OR_NPM),)
$(error Missing package manager. \
				Please install yarn or npm)
endif

.PHONY: all
all: $(SRC)
	@$(BUILD)

node_modules: package.json
	@$(YARN_OR_NPM) install
