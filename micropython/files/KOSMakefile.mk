TARGET = libmicropython.a

MP_EMBED_DIR = $(CURDIR)/micropython_embed

MP_PORT_DIR = $(MP_EMBED_DIR)/port
MP_PY_DIR =   $(MP_EMBED_DIR)/py
MP_RT_DIR =   $(MP_EMBED_DIR)/shared/runtime

OBJS = $(MP_PORT_DIR)/embed_util.o \
	$(MP_PORT_DIR)/mphalport.o \
	$(MP_PY_DIR)/argcheck.o \
	$(MP_PY_DIR)/asmbase.o \
	$(MP_PY_DIR)/bc.o \
	$(MP_PY_DIR)/binary.o \
	$(MP_PY_DIR)/builtinevex.o \
	$(MP_PY_DIR)/builtinhelp.o \
	$(MP_PY_DIR)/builtinimport.o \
	$(MP_PY_DIR)/compile.o \
	$(MP_PY_DIR)/emitbc.o \
	$(MP_PY_DIR)/emitcommon.o \
	$(MP_PY_DIR)/emitglue.o \
	$(MP_PY_DIR)/emitnative.o \
	$(MP_PY_DIR)/formatfloat.o \
	$(MP_PY_DIR)/frozenmod.o \
	$(MP_PY_DIR)/gc.o \
	$(MP_PY_DIR)/lexer.o \
	$(MP_PY_DIR)/malloc.o \
	$(MP_PY_DIR)/map.o \
	$(MP_PY_DIR)/modarray.o \
	$(MP_PY_DIR)/modbuiltins.o \
	$(MP_PY_DIR)/modcmath.o \
	$(MP_PY_DIR)/modcollections.o \
	$(MP_PY_DIR)/moderrno.o \
	$(MP_PY_DIR)/modgc.o \
	$(MP_PY_DIR)/modio.o \
	$(MP_PY_DIR)/modmath.o \
	$(MP_PY_DIR)/modmicropython.o \
	$(MP_PY_DIR)/modstruct.o \
	$(MP_PY_DIR)/modsys.o \
	$(MP_PY_DIR)/modthread.o \
	$(MP_PY_DIR)/mpprint.o \
	$(MP_PY_DIR)/mpstate.o \
	$(MP_PY_DIR)/mpz.o \
	$(MP_PY_DIR)/nativeglue.o \
	$(MP_PY_DIR)/nlr.o \
	$(MP_PY_DIR)/nlrsetjmp.o \
	$(MP_PY_DIR)/objarray.o \
	$(MP_PY_DIR)/objattrtuple.o \
	$(MP_PY_DIR)/objbool.o \
	$(MP_PY_DIR)/objboundmeth.o \
	$(MP_PY_DIR)/obj.o \
	$(MP_PY_DIR)/objcell.o \
	$(MP_PY_DIR)/objclosure.o \
	$(MP_PY_DIR)/objcomplex.o \
	$(MP_PY_DIR)/objdeque.o \
	$(MP_PY_DIR)/objdict.o \
	$(MP_PY_DIR)/objenumerate.o \
	$(MP_PY_DIR)/objexcept.o \
	$(MP_PY_DIR)/objfilter.o \
	$(MP_PY_DIR)/objfloat.o \
	$(MP_PY_DIR)/objfun.o \
	$(MP_PY_DIR)/objgenerator.o \
	$(MP_PY_DIR)/objgetitemiter.o \
	$(MP_PY_DIR)/objint.o \
	$(MP_PY_DIR)/objint_longlong.o \
	$(MP_PY_DIR)/objint_mpz.o \
	$(MP_PY_DIR)/objlist.o \
	$(MP_PY_DIR)/objmap.o \
	$(MP_PY_DIR)/objmodule.o \
	$(MP_PY_DIR)/objnamedtuple.o \
	$(MP_PY_DIR)/objnone.o \
	$(MP_PY_DIR)/objobject.o \
	$(MP_PY_DIR)/objpolyiter.o \
	$(MP_PY_DIR)/objproperty.o \
	$(MP_PY_DIR)/objrange.o \
	$(MP_PY_DIR)/objreversed.o \
	$(MP_PY_DIR)/objset.o \
	$(MP_PY_DIR)/objsingleton.o \
	$(MP_PY_DIR)/objslice.o \
	$(MP_PY_DIR)/objstr.o \
	$(MP_PY_DIR)/objstringio.o \
	$(MP_PY_DIR)/objstrunicode.o \
	$(MP_PY_DIR)/objtuple.o \
	$(MP_PY_DIR)/objtype.o \
	$(MP_PY_DIR)/objzip.o \
	$(MP_PY_DIR)/opmethods.o \
	$(MP_PY_DIR)/pairheap.o \
	$(MP_PY_DIR)/parse.o \
	$(MP_PY_DIR)/parsenumbase.o \
	$(MP_PY_DIR)/parsenum.o \
	$(MP_PY_DIR)/persistentcode.o \
	$(MP_PY_DIR)/profile.o \
	$(MP_PY_DIR)/pystack.o \
	$(MP_PY_DIR)/qstr.o \
	$(MP_PY_DIR)/reader.o \
	$(MP_PY_DIR)/repl.o \
	$(MP_PY_DIR)/ringbuf.o \
	$(MP_PY_DIR)/runtime.o \
	$(MP_PY_DIR)/runtime_utils.o \
	$(MP_PY_DIR)/scheduler.o \
	$(MP_PY_DIR)/scope.o \
	$(MP_PY_DIR)/sequence.o \
	$(MP_PY_DIR)/showbc.o \
	$(MP_PY_DIR)/smallint.o \
	$(MP_PY_DIR)/stackctrl.o \
	$(MP_PY_DIR)/stream.o \
	$(MP_PY_DIR)/unicode.o \
	$(MP_PY_DIR)/vm.o \
	$(MP_PY_DIR)/vstr.o \
	$(MP_PY_DIR)/warning.o \
	$(MP_RT_DIR)/gchelper_generic.o

CFLAGS += -DMICROPY_GCREGS_SETJMP -DNDEBUG
CFLAGS += -I$(CURDIR)
CFLAGS += -I$(MP_EMBED_DIR)
CFLAGS += -I$(MP_PORT_DIR)

defaultall: | generatemp $(OBJS) subdirs linklib fixincludes

generatemp: export MICROPYTHON_TOP = $(CURDIR)
generatemp:
	$(MAKE) -f ports/embed/embed.mk

fixincludes:
	@for _file in $(MP_PORT_DIR)/*.h $(MP_PY_DIR)/*.h $(MP_RT_DIR)/*.h; do \
		sed -ri 's/#include "(\S+)"/#include <micropython\/\1>/g' $$_file; \
	done
	@sed -i 's/<port\/mpconfigport_common.h>/<micropython\/port\/mpconfigport_common.h>/' mpconfigport.h
	@sed -i 's/<mpconfigport.h>/<micropython\/mpconfigport.h>/' $(MP_PY_DIR)/mpconfig.h

include ${KOS_PORTS}/scripts/lib.mk
