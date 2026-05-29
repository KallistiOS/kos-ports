TARGET = libpng.a
OBJS = png.o pngerror.o pngget.o pngmem.o pngpread.o \
	pngread.o pngrio.o pngrtran.o pngrutil.o pngset.o \
	pngtrans.o pngwio.o pngwrite.o pngwtran.o pngwutil.o \
	kos_img.o kos_texture.o readpng.o writepng.o

KOS_CFLAGS += -I. \
	-I$(KOS_PORTS)/include/zlib \
	-DPNG_NO_MNG_FEATURES \
	-DPNG_NO_READ_sCAL -DPNG_NO_WRITE_sCAL \
	-DPNG_NO_SETJMP_SUPPORTED \
	-DPNG_NO_WRITE_tIME \
	-DBUILD_LIBPNG

defaultall: pnglibconf.h fix-pngh $(OBJS) subdirs linklib

# Avoid ICE with some GCC versions
pngwrite.o: CFLAGS += -O2

# Force the configuration file to be generated.
pnglibconf.h: scripts/pnglibconf.h.prebuilt
	cp $< $@

fix-pngh:
	@echo "Patching png.h for compatibility with KOS..."
	@echo "/* Compatibility with previous KOS code... */" >> png.h
	@echo "#include \"kospng.h\"" >> png.h

include ${KOS_PORTS}/scripts/lib.mk
