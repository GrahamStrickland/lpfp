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
	cd reddiskbluecircle && cabal install --overwrite-policy=always
	cd reddiskprojectile && cabal install --overwrite-policy=always
	cd reddiskprojectilesim && cabal install --overwrite-policy=always
	cd axes && cabal install --overwrite-policy=always
	cd rotatingcube && cabal install --overwrite-policy=always
	cd simulationtest && cabal install --overwrite-policy=always
	cd ocean && cabal install --overwrite-policy=always
	cd oceansunset && cabal install --overwrite-policy=always
	cd reddiskanim && cabal install --overwrite-policy=always
	cd reddiskmotion && cabal install --overwrite-policy=always
	cd limitcycle && cabal install --overwrite-policy=always
	cd reddiskoscillate && cabal install --overwrite-policy=always

.PHONY: clean
clean:
	cabal clean
	rm -rf dist-newstyle
	rm tags
