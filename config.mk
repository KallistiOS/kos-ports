# Select how to download files inside the kos-ports tree. Examples are given for
# cURL and wget.
FETCH_CMD = curl --progress-bar -O -L
#FETCH_CMD = wget --progress=bar

# Set the command that will be used for extracting archive files. Currently this
# only must extract .tar.gz archives (although the default will handle more than
# that, most likely).
UNPACK_CMD = tar xf

# Select whether or not to automatically build library dependencies if they are
# not already installed. If this is set to false, then the build system will
# simply output an error message if a dependency is not met. If set to true,
# then the build system will automatically try to build any unmet dependencies
# recursively.
BUILD_DEPENDS = true

# Select whether or not to check if a port is compatible with KOS's current
# floating-point precision ABI setting (KOS_SH4_PRECISION) before building.
CHECK_PRECISION = true

# Select whether or not to validate each file downloaded before unpacking them.
# This requires Python to be installed.
VALIDATE_DISTFILES = true

# Autotools host triple. This should generally be the same as the KOS host.
AUTOTOOLS_HOST = $(KOS_CC_PREFIX)

# Command to run python
PYTHON_CMD = python3
