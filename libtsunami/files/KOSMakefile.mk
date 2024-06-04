TARGET = libtsunami.a
OBJS_MAIN := $(patsubst %.cpp,%.o,$(wildcard src/*.cpp))
OBJS_DRW := $(patsubst %.cpp,%.o,$(wildcard src/drawables/*.cpp))
OBJS_ANIMS := $(patsubst %.cpp,%.o,$(wildcard src/anims/*.cpp))
OBJS_TRIGS := $(patsubst %.cpp,%.o,$(wildcard src/triggers/*.cpp))
OBJS := $(OBJS_MAIN) $(OBJS_DRW) $(OBJS_ANIMS) $(OBJS_TRIGS)

# GCC versions prior to 11.0 have incomplete C++17 support and need 
# to be forced to use the GNU dialect for std::filesystem support
KOS_CPPFLAGS += -Iinclude -std=gnu++17

include ${KOS_PORTS}/scripts/lib.mk
