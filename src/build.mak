SCRIPT_DIRECTORY := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
OUTPUT_DIRECTORY := $(abspath $(SCRIPT_DIRECTORY)../bin)/
COMPILE_FLAGS := --target=wasm32 --no-standard-libraries -Wl,--export-all -Wl,--no-entry

.PHONY: build
build: \
	$(OUTPUT_DIRECTORY) \
	$(OUTPUT_DIRECTORY)image.wasm \
	$(OUTPUT_DIRECTORY)index.html \
	$(OUTPUT_DIRECTORY)default.png
	
$(OUTPUT_DIRECTORY):
	mkdir "$(OUTPUT_DIRECTORY)"

$(OUTPUT_DIRECTORY)image.wasm: image.c wasm.c
	clang $(COMPILE_FLAGS) -o "$(OUTPUT_DIRECTORY)image.wasm" image.c wasm.c

$(OUTPUT_DIRECTORY)index.html: index.html
	copy index.html "$(OUTPUT_DIRECTORY)index.html"

$(OUTPUT_DIRECTORY)default.png: default.png
	copy default.png "$(OUTPUT_DIRECTORY)default.png"