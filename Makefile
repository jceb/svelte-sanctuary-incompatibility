#!/usr/bin/env make -f
.POSIX:
.SUFFIXES:

.PHONY: help
help: ## Show this help (default)
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## 1. Install software
	yarn

.PHONY: dev
dev: ## Start up
	yarn dev

.PHONY: clean
clean: ## Cleanup the build
	@rm -vf game graphics.o physics.o input.o
