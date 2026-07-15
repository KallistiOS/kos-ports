# Port Metadata
libtremor_PORTVERSION =       19480

libtremor_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
libtremor_LICENSE =           3-clause BSD (see COPYING in the source distribution)
libtremor_SHORT_DESC =        Vorbis audio decoder library (integer version)

# What files we need to download, and where from.
libtremor_GIT_REPO =          https://gitlab.xiph.org/xiph/tremor
libtremor_GIT_BRANCH =        lowmem
libtremor_GIT_HASH =          89a7534bf2e70112e0354452b17a78675ca92dbf
libtremor_DOWNLOAD_URL =      ${libtremor_GIT_REPO}/-/archive/${libtremor_GIT_HASH}/tremor-${libtremor_GIT_HASH}.tar.gz

libtremor_TARGET =            libtremor.a
libtremor_INSTALLED_HDRS =    ivorbiscodec.h ivorbisfile.h sndoggvorbis.h
libtremor_HDR_INSTDIR =       vorbis
