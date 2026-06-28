TARGET = libmicropython.a

MP_EMBED_DIR = $(CURDIR)/micropython_embed

MP_PORT_DIR = $(MP_EMBED_DIR)/port
MP_PY_DIR =   $(MP_EMBED_DIR)/py
MP_RT_DIR =   $(MP_EMBED_DIR)/shared/runtime

SOURCES = $(MP_PORT_DIR)/embed_util.c \
	$(MP_PORT_DIR)/mphalport.c \
	$(MP_PY_DIR)/argcheck.c \
	$(MP_PY_DIR)/asmbase.c \
	$(MP_PY_DIR)/bc.c \
	$(MP_PY_DIR)/binary.c \
	$(MP_PY_DIR)/builtinevex.c \
	$(MP_PY_DIR)/builtinhelp.c \
	$(MP_PY_DIR)/builtinimport.c \
	$(MP_PY_DIR)/compile.c \
	$(MP_PY_DIR)/emitbc.c \
	$(MP_PY_DIR)/emitcommon.c \
	$(MP_PY_DIR)/emitglue.c \
	$(MP_PY_DIR)/emitnative.c \
	$(MP_PY_DIR)/formatfloat.c \
	$(MP_PY_DIR)/frozenmod.c \
	$(MP_PY_DIR)/gc.c \
	$(MP_PY_DIR)/lexer.c \
	$(MP_PY_DIR)/malloc.c \
	$(MP_PY_DIR)/map.c \
	$(MP_PY_DIR)/modarray.c \
	$(MP_PY_DIR)/modbuiltins.c \
	$(MP_PY_DIR)/modcmath.c \
	$(MP_PY_DIR)/modcollections.c \
	$(MP_PY_DIR)/moderrno.c \
	$(MP_PY_DIR)/modgc.c \
	$(MP_PY_DIR)/modio.c \
	$(MP_PY_DIR)/modmath.c \
	$(MP_PY_DIR)/modmicropython.c \
	$(MP_PY_DIR)/modstruct.c \
	$(MP_PY_DIR)/modsys.c \
	$(MP_PY_DIR)/modthread.c \
	$(MP_PY_DIR)/mpprint.c \
	$(MP_PY_DIR)/mpstate.c \
	$(MP_PY_DIR)/mpz.c \
	$(MP_PY_DIR)/nativeglue.c \
	$(MP_PY_DIR)/nlr.c \
	$(MP_PY_DIR)/nlrsetjmp.c \
	$(MP_PY_DIR)/objarray.c \
	$(MP_PY_DIR)/objattrtuple.c \
	$(MP_PY_DIR)/objbool.c \
	$(MP_PY_DIR)/objboundmeth.c \
	$(MP_PY_DIR)/obj.c \
	$(MP_PY_DIR)/objcell.c \
	$(MP_PY_DIR)/objclosure.c \
	$(MP_PY_DIR)/objcomplex.c \
	$(MP_PY_DIR)/objdeque.c \
	$(MP_PY_DIR)/objdict.c \
	$(MP_PY_DIR)/objenumerate.c \
	$(MP_PY_DIR)/objexcept.c \
	$(MP_PY_DIR)/objfilter.c \
	$(MP_PY_DIR)/objfloat.c \
	$(MP_PY_DIR)/objfun.c \
	$(MP_PY_DIR)/objgenerator.c \
	$(MP_PY_DIR)/objgetitemiter.c \
	$(MP_PY_DIR)/objint.c \
	$(MP_PY_DIR)/objint_longlong.c \
	$(MP_PY_DIR)/objint_mpz.c \
	$(MP_PY_DIR)/objlist.c \
	$(MP_PY_DIR)/objmap.c \
	$(MP_PY_DIR)/objmodule.c \
	$(MP_PY_DIR)/objnamedtuple.c \
	$(MP_PY_DIR)/objnone.c \
	$(MP_PY_DIR)/objobject.c \
	$(MP_PY_DIR)/objpolyiter.c \
	$(MP_PY_DIR)/objproperty.c \
	$(MP_PY_DIR)/objrange.c \
	$(MP_PY_DIR)/objreversed.c \
	$(MP_PY_DIR)/objset.c \
	$(MP_PY_DIR)/objsingleton.c \
	$(MP_PY_DIR)/objslice.c \
	$(MP_PY_DIR)/objstr.c \
	$(MP_PY_DIR)/objstringio.c \
	$(MP_PY_DIR)/objstrunicode.c \
	$(MP_PY_DIR)/objtuple.c \
	$(MP_PY_DIR)/objtype.c \
	$(MP_PY_DIR)/objzip.c \
	$(MP_PY_DIR)/opmethods.c \
	$(MP_PY_DIR)/pairheap.c \
	$(MP_PY_DIR)/parse.c \
	$(MP_PY_DIR)/parsenumbase.c \
	$(MP_PY_DIR)/parsenum.c \
	$(MP_PY_DIR)/persistentcode.c \
	$(MP_PY_DIR)/profile.c \
	$(MP_PY_DIR)/pystack.c \
	$(MP_PY_DIR)/qstr.c \
	$(MP_PY_DIR)/reader.c \
	$(MP_PY_DIR)/repl.c \
	$(MP_PY_DIR)/ringbuf.c \
	$(MP_PY_DIR)/runtime.c \
	$(MP_PY_DIR)/runtime_utils.c \
	$(MP_PY_DIR)/scheduler.c \
	$(MP_PY_DIR)/scope.c \
	$(MP_PY_DIR)/sequence.c \
	$(MP_PY_DIR)/showbc.c \
	$(MP_PY_DIR)/smallint.c \
	$(MP_PY_DIR)/stackctrl.c \
	$(MP_PY_DIR)/stream.c \
	$(MP_PY_DIR)/unicode.c \
	$(MP_PY_DIR)/vm.c \
	$(MP_PY_DIR)/vstr.c \
	$(MP_PY_DIR)/warning.c \
	$(MP_RT_DIR)/gchelper_generic.c

OBJS = $(SOURCES:.c=.o)

$(OBJS): CPPFLAGS += -DMICROPY_GCREGS_SETJMP -DNDEBUG -I$(CURDIR) -I$(MP_EMBED_DIR) -I$(MP_PORT_DIR)

# Windows specific
ifeq ($(OS),Windows_NT)
	# On Windows, the "python3" binary can exist but sometime it could not be usable here
	# So we try if indeed, "python3" exists and returns something like "Python {version}".
	# If yes, then we will use "python3" indeed, if not, we will try to use "python".
	MP_PYTHON_CMD = python
	MP_PYTHON3_USABLE := $(shell $(SHELL) -c 'python3 --version || :' 2>&1)
	ifeq ($(shell echo $(MP_PYTHON3_USABLE) | cut -c-6),Python)
		MP_PYTHON_CMD = python3
	endif
	MP_EMBED_FLAGS = PYTHON=$(MP_PYTHON_CMD)
	
	# "sed" can display some useless warning related to "permission denied".
	# We will just hide this, as this is not relevant.
	SED_FLAGS = >/dev/null 2>&1
endif

include ${KOS_PORTS}/lib.mk

$(SOURCES): .stamp_generatemp

# Generate MicroPython (with verbose option set to "no")
.stamp_generatemp: export MICROPYTHON_TOP = $(CURDIR)
.stamp_generatemp:
	$(MAKE) -f ports/embed/embed.mk V=0 $(MP_EMBED_FLAGS)
	touch $@
