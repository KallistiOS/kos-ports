cmake_minimum_required(VERSION 3.21)
project(bz2 VERSION ${BZIP2_VERSION} LANGUAGES C)

add_library(bz2 STATIC
	blocksort.c
	huffman.c
	crctable.c
	randtable.c
	compress.c
	decompress.c
	bzlib.c
)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set_target_properties(bz2 PROPERTIES
	PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/bzlib.h
)

include(GNUInstallDirs)

install(TARGETS bz2
	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

configure_file(bzip2.pc.in bzip2.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/bzip2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
