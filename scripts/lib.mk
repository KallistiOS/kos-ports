# KallistiOS ##version##
#
# Addons Makefile.prefab
# Copyright (C) 2003 Megan Potter
#

# KallistiOS addons Makefile include
#
# Define "TARGET", "SUBDIRS" and "OBJS", and then include this file;
# it will handle a lot of your build process. Everything in "OBJS" is
# built by the compiler.

install: $(TARGET)

$(TARGET): $(OBJS)
	${KOS_AR} rcs $@ $^

$(OBJS): subdirs

clean:
	-rm -f $(OBJS) $(TARGET)

include ${KOS_BASE}/Makefile.rules
