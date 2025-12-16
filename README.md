# kos-ports: KallistiOS Package Manager

## Introduction

**kos-ports** is a package manager and repository of libraries ported to the Dreamcast operating system [KallistiOS](https://github.com/KallistiOS/KallistiOS). It includes libraries for audio, video, compression, scripting, and game development. Each port is self-contained and builds against the current KallistiOS version. Dependencies are automatically fetched and built as needed.

## Prerequisites

### KallistiOS Setup

- You must have a working [KallistiOS](https://github.com/KallistiOS/KallistiOS) environment and SH4 toolchain.
- Build KallistiOS and source its `environ.sh` in your terminal **before** using kos-ports:
  ```sh
  source /opt/toolchains/dc/kos/environ.sh
  ```

### Required Tools

- `curl` (default) or `wget` for downloads (set in `config.mk`)
- GNU make and Bash (other shells/make tools are not supported)
- `git` and `cmake` (required for some ports)
- Python (for validating downloads; can be disabled in `config.mk`)

## Building and Installing Ports

To build and install a single port:
```sh
cd <portname>
make install clean
```
- This will fetch, unpack, patch, build, and install the port and its dependencies.
- Headers are installed to `kos-ports/include/`
- Libraries are installed to `kos-ports/lib/`
- If you use the KOS Makefile system, these paths are automatically included.

### Common Make Targets (per-port)

- `make install` – Build and install the port (and dependencies)
- `make update` – Update the port if a new version is available (for git-based ports)
- `make clean` – Remove build and dist files for the port
- `make uninstall` – Remove the port (does not check dependencies)
- `make portinfo` – Show port description and metadata

### Managing All Ports

Scripts in the `utils/` directory let you operate on all ports at once:
- `utils/build-all.sh` – Install all ports
- `utils/uninstall-all.sh` – Uninstall all ports
- `utils/clean-all.sh` – Clean all ports
- `utils/update-all.sh` – Update all installed ports

### Advanced/Developer Targets

- `make show-deps` – Show all dependencies and their status
- `make depends-check` – Check if all dependencies are installed
- `make abi-check` – Check KOS floating-point ABI compatibility
- `make fetch` – Download dist files from upstream
- `make validate-dist` – Validate downloaded distfiles (if enabled)
- `make unpack` – Unpack fetched packages
- `make build-stamp` – Build the port, but do not install
- `make clean-dist` – Remove only dist files
- `make clean-build` – Remove only build files

## Directory Structure

- `include/` – Installed headers
- `lib/` – Installed libraries
- `examples/` – Example code (if provided by the port)
- `dist/` – Downloaded source files and git checkouts (temporary)
- `build/` – Build directory (temporary)
- `inst/` – Temporary install directory for each port

## Porting a New Library

Porting a new library is straightforward:
1. Copy an existing port (e.g., `libpng`) as a template.
2. Fill in the Makefile metadata and download instructions.
3. **Follow the standard Makefile patterns**:
   - Use `INSTALLED_HDRS` for header files.
   - Avoid using both `NOCOPY_TARGET` and a custom `PREINSTALL` for installation.
   - Let the build system handle installation unless absolutely necessary.
4. Test with `make install clean` and ensure headers/libraries are installed correctly.
5. If you need help, reach out via the usual support channels.

## Troubleshooting

- **"No rule to make target 'store-hash'"**: Ensure your port's Makefile follows the standard patterns and you are using the latest scripts.
- **Build errors**: Make sure you have sourced `environ.sh` and have all prerequisites installed.
- **Dependency issues**: Run `make show-deps` to check for missing dependencies.

---

For more details, see the comments in each script and Makefile, or contact the maintainers.
