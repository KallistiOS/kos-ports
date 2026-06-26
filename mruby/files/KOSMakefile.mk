TARGET = libmruby.a

# Definition of build directories
MRUBY_BUILD_DIR = $(CURDIR)/build
MRUBY_BUILD_KOS_ARCH_DIR = $(MRUBY_BUILD_DIR)/$(KOS_ARCH)

# Handling mruby compiler executable (mrbc)
# This compiler is necessary to transpile Ruby sources into a C source file
MRUBY_COMPILER = mrbc
MRUBY_INSTALL_DIR = $(DC_TOOLS_BASE)

# Check Rake availability and set the mruby build command
# On DreamSDK based on MinGW-w64/MSYS2, the "command -v rake" instruction
# doesn't work because the executable flag ("x") isn't properly set. So we're
# testing the expected path directly ("/mingw64/bin/rake").
export RAKE_AVAILABLE := $(shell \
	(command -v rake >/dev/null 2>&1 || [ -f /mingw64/bin/rake ]) && \
	rake --version >/dev/null 2>&1 && \
	echo "1" || echo "0")

# Handling DreamSDK wrappers if needed; it will only happen in this environment
DREAMSDK_USE_WRAPPERS := $(if $(filter DreamSDK,$(ENVIRONMENT_NAME)),RAKE_AVAILABLE=$(RAKE_AVAILABLE),)

# Define mruby build command using rake availability
# Use "make" (which call "rake" internally) or try to call "rake" if needed
MRUBY_BUILD_CMD := $(shell \
	if [ "$(RAKE_AVAILABLE)" = "1" ]; then \
		echo "$(MAKE)"; \
	else \
		ruby_path=$$(command -v ruby); \
		if [ -n "$$ruby_path" ] && [ -f "$$(dirname "$$ruby_path")/rake" ]; then \
			echo "rake"; \
		else \
			echo "echo 'Error: rake not found in PATH' && exit 1"; \
		fi; \
	fi)

# Windows specific
ifeq ($(OS),Windows_NT)
	# On Windows, all executables got a file extension
	EXECUTABLEEXTENSION = .exe

	# "sed" can display some useless warning related to "permission denied".
	# We will just hide this, as this is not relevant.
	SED_FLAGS = >/dev/null 2>&1
endif

# mruby compiler executable (mrbc) (with extension if necessary)
MRUBY_COMPILER_BIN = $(MRUBY_COMPILER)$(EXECUTABLEEXTENSION)

install: | prepare generatemruby copylib installmrbc

# Preparing the location where the mruby compiler executable (mrbc) will be installed
prepare:
	@if [ ! -d "$(MRUBY_INSTALL_DIR)" ]; then \
		if [ -f "$(MRUBY_INSTALL_DIR)" ]; then \
			echo "Error: unable to create directory: \"$(MRUBY_INSTALL_DIR)\""; \
			echo "A file exists at this location. Please move or delete this file."; \
			exit 1; \
		else \
			mkdir -p "$(MRUBY_INSTALL_DIR)"; \
		fi \
	fi

# Generate mruby
generatemruby: prepare
	@echo "Generating mruby..."
	$(MRUBY_BUILD_CMD) MRUBY_CONFIG=dreamcast_shelf $(DREAMSDK_USE_WRAPPERS)

# Copy final library file into the root directory
copylib: generatemruby
	@cp $(MRUBY_BUILD_KOS_ARCH_DIR)/lib/$(TARGET) $(CURDIR)

# Install mruby compiler executable (mrbc)
installmrbc: copylib
	@echo "Installing $(MRUBY_COMPILER) to $(MRUBY_INSTALL_DIR)..."
	@cp $(MRUBY_BUILD_DIR)/host/bin/$(MRUBY_COMPILER_BIN) $(MRUBY_INSTALL_DIR)
	@strip $(MRUBY_INSTALL_DIR)/$(MRUBY_COMPILER_BIN)
