# Makefile for PDCurses for SDL on KOS

PDCURSES_SRCDIR = .

O = o

include $(PDCURSES_SRCDIR)/common/libobjs.mif

osdir		= $(PDCURSES_SRCDIR)/sdl1

PDCURSES_SDL_H	= $(osdir)/pdcsdl.h

ifeq ($(DEBUG),Y)
	CFLAGS  = $(KOS_CFLAGS) -DPDCDEBUG
else
	CFLAGS  = $(KOS_CFLAGS)
endif

ifeq ($(UTF8),Y)
	CFLAGS	+= -DPDC_FORCE_UTF8
endif

BUILD		= kos-cc $(CFLAGS) -I$(KOS_PORTS)/include/SDL -I$(PDCURSES_SRCDIR)

LDFLAGS		= $(LIBCURSES) -lSDL
RANLIB		= ranlib
LIBCURSES	= libPDCurses.a

.PHONY: all clean

all:	$(LIBCURSES)

clean:
	-rm -rf *.o $(LIBCURSES)

$(LIBCURSES) : $(LIBOBJS) $(PDCOBJS)
	ar rv $@ $?
	-$(RANLIB) $@

$(LIBOBJS) $(PDCOBJS) : $(PDCURSES_HEADERS)
$(PDCOBJS) : $(PDCURSES_SDL_H)

$(LIBOBJS) : %.o: $(srcdir)/%.c
	$(BUILD) -c $<

$(PDCOBJS) : %.o: $(osdir)/%.c
	$(BUILD) -c $<

