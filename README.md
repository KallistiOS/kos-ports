# kos-ports: KallistiOS Package Manager

## Introduction
**kos-ports** is a package manager and repository of various useful libraries that
have been ported to the Dreamcast operating system
[KallistiOS](https://github.com/KallistiOS/KallistiOS). These libraries include
common audiovisual formats (jpg, png, mp3, ogg, mpeg), compression formats (libbz2,
zlib), scripting languages (Lua, Tcl, MicroPython), gaming APIs (OpenGL, OpenAL,
SDL), and more.  Each port is meant to be as self-contained as possible and should
build on the current version of KallistiOS. Dependency libraries will be fetched and
built automatically, if necessary.

## Prerequisites
### KallistiOS
Users must have a [KallistiOS](https://github.com/KallistiOS/KallistiOS) environment
set up already. This means you must have an SH4 toolchain built and have already
compiled KallistiOS itself. Before attempting to build a port, make sure you have
sourced your KallistiOS `environ.sh` file in your current terminal.

### Environment
1. `curl` or `wget` are required to download packages. `curl` is used by default,
   but `wget` may be set as an alternative in `config.mk`.
2. GNU make and Bash. Other make tools and shells have not been tested and
   may not work properly.
3. Git and CMake may be required for some packages in the collection.
4. Python is required to validate packages. If you don't have Python and wish to
   skip validation, you can set this in `config.mk`.

### Building a port
kos-ports was modelled after the FreeBSD ports collection, so some users may
be familiar with the usage.

To build a port, simply enter its directory and type `make install clean`.

The package management scripts should fetch, unpack, patch, and build the package
as well as any dependencies, then clean up files after itself. Once built, the
package's headers will be available in `kos-ports/include` and the built library
in `kos-ports/lib`. These paths are automatically included in your build flags if
you are using the KOS Makefile system.

## Using the ports tree
There are a few available `make` targets that can be used in each port directory:

- **install**: Perform all steps to download, patch, build, and install the port in
               question.
- **clean**: Clean up any dist files and intermediate build results.
- **uninstall**: Uninstall the port. This does not make sure dependencies are still
                 fulfilled, so keep that in mind!
- **portinfo**: Print to the terminal a description and various metadata about the
                port in question.

### Managing all ports
The following helper scripts are provided in the `utils` directory to perform
the above operations on **all** ports in the tree:
- `build-all.sh` will **install** all ports.
- `uninstall-all.sh` will **uninstall** all ports.
- `clean-all.sh` will **clean** all ports.

#### Lesser used targets (mainly for internal use):
- **version-check**: Check the version of the port that is currently installed.
- **depends-check**: Check if all dependencies of the port are installed.
- **abi-check**: Check if the current KOS floating-point ABI is compatible.
- **fetch**: Download dist files from upstream.
- **validate-dist**: Check downloaded distfiles for validity, if enabled.
- **unpack**: Unpack any fetched packages for the port.
- **build-stamp**: Build the port, but do not install it.
- **clean-dist**: Clean up any dist files. Does not clean build files.
- **clean-build**: Cleans up build files, leaving dist files in place.

## Porting a new library
Porting a new library is meant to be a relatively simple task. Take a look at
an existing port, such as `libpng`, to get an idea how the package manager works.
If you need assistance, feel free to reach out using the usual support channels.
