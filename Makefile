.PHONY: help
help:   ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: install
install:  ## Install cabal project
	cabal v2-install

.PHONY: build
install:  ## Build cabal project
	cabal v2-build

.PHONY: clean
clean:  ## Clean up cabal files and build artifacts
	rm -rf dist-newstyle
	rm tags
	rm cabal.project.local