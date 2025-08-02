TARGET = libmruby.a

# Definition of build directories
MRUBY_BUILD_DIR = $(CURDIR)/build
MRUBY_BUILD_KOS_ARCH_DIR = $(MRUBY_BUILD_DIR)/$(KOS_ARCH)

# Definition of headers directory (as we will need to alter the relations)
MRUBY_INCLUDE_DIR = $(MRUBY_BUILD_KOS_ARCH_DIR)/include
MRUBY_INCLUDE_MRUBY_DIR = $(MRUBY_INCLUDE_DIR)/mruby
MRUBY_INCLUDE_PRESYM_DIR = $(MRUBY_INCLUDE_MRUBY_DIR)/presym

# Handling mruby compiler executable (mrbc)
# This compiler is necessary to transpile Ruby sources into a C source file
MRUBY_COMPILER = mrbc
MRUBY_INSTALL_DIR = $(DC_TOOLS_BASE)

# Check rake availability and define mruby build command
export RAKE_AVAILABLE := $(shell command -v rake >/dev/null 2>&1 && echo "1" || echo "0")

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

defaultall: | prepare generatemruby fixincludes copylib installmrbc

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
generatemruby:
	@echo "Generating mruby..."
	$(MRUBY_BUILD_CMD) MRUBY_CONFIG=dreamcast_shelf $(DREAMSDK_USE_WRAPPERS)

# Copy final library file into the root directory
copylib:
	@cp $(MRUBY_BUILD_KOS_ARCH_DIR)/lib/$(TARGET) $(CURDIR)

# Install mruby compiler executable (mrbc)
installmrbc:
	@echo "Installing $(MRUBY_COMPILER) to $(MRUBY_INSTALL_DIR)..."
	@cp $(MRUBY_BUILD_DIR)/host/bin/$(MRUBY_COMPILER_BIN) $(MRUBY_INSTALL_DIR)
	@strip $(MRUBY_INSTALL_DIR)/$(MRUBY_COMPILER_BIN)

# Alter header files and alter #include directives
#	#include "{variable}" => #include <mruby/{variable}>
#	#include "<mruby/{variable}>" => #include <mruby/mruby/{variable}>
#	#include "mrbconf.h" => #include <mruby/mrbconf.h> (in "mruby.h")
fixincludes:
	@echo "Updating includes before installation..."
	@for _file in $(MRUBY_INCLUDE_DIR)/*.h $(MRUBY_INCLUDE_MRUBY_DIR)/*.h $(MRUBY_INCLUDE_PRESYM_DIR)/*.h; do \
		sed -ri -e 's/#include "([^[:space:]]+)"/#include <mruby\/\1>/g;s/#include <(mruby[^[:space:]]+)>/#include <mruby\/\1>/g' $$_file $(SED_FLAGS); \
	done
	@for _file in $(MRUBY_INCLUDE_DIR)/*.h; do \
		sed -i -e 's/#include <mruby\/mruby\/mrbconf.h>/#include <mruby\/mrbconf.h>/g' $$_file $(SED_FLAGS); \
	done
	@for _file in $(MRUBY_INCLUDE_DIR)/*.h $(MRUBY_INCLUDE_MRUBY_DIR)/*.h $(MRUBY_INCLUDE_PRESYM_DIR)/*.h; do \
		sed -i -e 's/#include <mruby\/mruby\/mruby\//#include <mruby\/mruby\//g' $$_file $(SED_FLAGS); \
	done
