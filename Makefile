.PHONY: help
help:
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: build
build:
	cabal build all

.PHONY: test
test:
	cabal test all

.PHONY: install
install:
	cd trajectory && cabal install --overwrite-policy=always
	cd powers && cabal install --overwrite-policy=always
	cd plots && cabal install --overwrite-policy=always
	cd glosspicture && cabal install --overwrite-policy=always
	cd glossanimation && cabal install --overwrite-policy=always
	cd glosssimulate && cabal install --overwrite-policy=always
	cd notglosspicture3d && cabal install --overwrite-policy=always
	cd notglossanimation3d && cabal install --overwrite-policy=always
	cd notglosssimulate3d && cabal install --overwrite-policy=always

.PHONY: clean
clean:
	rm -rf dist-newstyle
	rm tags
