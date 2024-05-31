TARGET = libSDL_ttf.a
OBJS = SDL_ttf.o

KOS_CFLAGS += -I. \
	-I${KOS_PORTS}/include/SDL -lSDL \
	-I${KOS_PORTS}/include/zlib -I${KOS_PORTS}/include/bzlib \
	-I${KOS_PORTS}/include/png -I${KOS_PORTS}/include/freetype2 \
	-lfreetype -lz -lbz2 -lpng

include ${KOS_PORTS}/scripts/lib.mk
