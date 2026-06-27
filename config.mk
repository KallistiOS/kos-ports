# Select how to download files inside the kos-ports tree. Examples are given for
# cURL and wget.
FETCH_CMD = curl --progress-bar -O -L
#FETCH_CMD = wget --progress=bar

# Set the command that will be used for extracting archive files. Currently this
# only must extract .tar.gz archives (although the default will handle more than
# that, most likely).
UNPACK_CMD = tar --strip-components=1 -xf
