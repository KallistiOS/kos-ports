find_path(POLARSSL_INCLUDE_DIRS polarssl/ssl.h)

find_library(POLARSSL_LIBRARY polarssl)

set(POLARSSL_LIBRARIES "${POLARSSL_LIBRARY}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PolarSSL DEFAULT_MSG
    POLARSSL_INCLUDE_DIRS POLARSSL_LIBRARY)

mark_as_advanced(POLARSSL_INCLUDE_DIRS POLARSSL_LIBRARY)
