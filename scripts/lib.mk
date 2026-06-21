# KallistiOS ##version##
#
# Addons Makefile.prefab
# Copyright (C) 2003 Megan Potter
#

# KallistiOS addons Makefile include
#
# Define "TARGET", "SUBDIRS" and "OBJS", and then include this file;
# it will handle a lot of your build process. Everything in "OBJS" is
# built by the compiler. If you build everything in subdirs and want to
# just link at the end with this makefile, then define LIB_OBJS as
# something like build/*.o. You'll also want to define LOCAL_CLEAN to
# clean your build dir.

install: subdirs $(TARGET)

$(TARGET): $(OBJS)
	${KOS_AR} rcs $@ $^ $(LIB_OBJS)

clean:
	-rm -f $(OBJS) $(LIB_OBJS) $(TARGET)

include ${KOS_BASE}/Makefile.rules
