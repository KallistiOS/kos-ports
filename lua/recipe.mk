# Port Metadata
lua_PORTVERSION =       5.5.0

lua_MAINTAINER =        Falco Girgis (GyroVorbis)
lua_LICENSE =           MIT
lua_SHORT_DESC =        Lightweight, embeddable, extensible scripting language

# What files we need to download, and where from.
lua_DOWNLOAD_SITE =     https://www.lua.org/ftp
lua_DOWNLOAD_FILE =     lua-${lua_PORTVERSION}.tar.gz
lua_DOWNLOAD_SHA256 =   57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d

lua_TARGET =            liblua.a
lua_INSTALLED_HDRS =    src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h \
                    src/llimits.h src/lua.hpp
lua_HDR_INSTDIR =       lua
