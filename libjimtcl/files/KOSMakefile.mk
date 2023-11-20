PORTNAME =        libjimtcl
CONFIGURE_ARGS =     --without-ext="aio,zlib"
MAKE_TARGET =        libjim.a
HDR_INSTDIR =        jimtcl

AUTOTOOLS_HOST = sh-elf

all: build-libjim fix-jimh

build-libjim:
	CC=kos-cc ${CONFIGURE_DEFS} ./configure --prefix=${KOS_PORTS}/${PORTNAME}/inst --host=${AUTOTOOLS_HOST} ${CONFIGURE_ARGS} ; \
    	$(MAKE) ${MAKE_TARGET} 

fix-jimh:
	sed -i .bak "s@#include <jim-win32compat.h>@#include <${HDR_INSTDIR}/jim-win32compat.h>@g" jim.h
	sed -i .bak "s@#include <jim-config.h>@#include <${HDR_INSTDIR}/jim-config.h>@g" jim.h

include ${KOS_PORTS}/scripts/lib.mk
