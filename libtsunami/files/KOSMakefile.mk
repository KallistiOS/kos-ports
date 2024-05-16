TARGET = libtsunami.a
OBJS_MAIN := $(patsubst %.cpp,%.o,$(wildcard src/*.cpp))
OBJS_DRW := $(patsubst %.cpp,%.o,$(wildcard src/drawables/*.cpp))
OBJS_ANIMS := $(patsubst %.cpp,%.o,$(wildcard src/anims/*.cpp))
OBJS_TRIGS := $(patsubst %.cpp,%.o,$(wildcard src/triggers/*.cpp))
OBJS := $(OBJS_MAIN) $(OBJS_DRW) $(OBJS_ANIMS) $(OBJS_TRIGS)

KOS_CFLAGS += -Iinclude -std=gnu++17

include ${KOS_PORTS}/scripts/lib.mk
