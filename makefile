# Convenience wrapper around CMake. Run these from the project root.
# NOTE: the indented lines below MUST be real TAB characters, not spaces.

# TODO: Configure below suitable with CMake
BUILD_DIR := out
TARGET    := executableBinary

# Formatter binary. LLVM installs it version-suffixed (see README); override on
# the command line if yours differs, e.g. `make format CLANG_FORMAT=clang-format`.
CLANG_FORMAT ?= clang-format-22
# Files to format / lint.
SOURCES := $(shell find src include -name '*.cpp' -o -name '*.hpp' -o -name '*.h' 2>/dev/null)

# Default target: configure (if needed) + build.
.PHONY: all
all:
	cmake -B $(BUILD_DIR)
	cmake --build $(BUILD_DIR)

# Delete the whole build folder.
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Build and then run the program.
.PHONY: run
run: # all
	./$(BUILD_DIR)/$(TARGET)

# Reformat the sources in place with clang-format (reads .clang-format).
.PHONY: format
format:
	$(CLANG_FORMAT) -i $(SOURCES)

# Check formatting without editing; non-zero exit if any file would change (CI).
.PHONY: format-check
format-check:
	$(CLANG_FORMAT) --dry-run --Werror $(SOURCES)

# Style-check the sources with cpplint (Google C++ style guide).
# --linelength=120 matches ColumnLimit in .clang-format (cpplint defaults to 80).
# See linting/HOW_TO_USE_CPPLINT.md for options and how to silence warnings.
.PHONY: lint
lint:
	python3 linting/cpplint.py --linelength=120 --recursive ./src ./include

.PHONY: debug
debug:
	cmake -B $(BUILD_DIR) --fresh -DCMAKE_BUILD_TYPE=Debug
	cmake --build $(BUILD_DIR)

# Clean rebuild: throw away cached config, reconfigure, rebuild.
# Reconfigure the project into the out folder.
# Use this after changing the compiler.
.PHONY: rebuild
rebuild:
	cmake -B $(BUILD_DIR) --fresh
	cmake --build $(BUILD_DIR)
