# Port Metadata
liboggvorbisplay_PORTVERSION =       2.0.0

liboggvorbisplay_MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
liboggvorbisplay_LICENSE =           KOS License
liboggvorbisplay_SHORT_DESC =        Ogg Vorbis audio streaming library

# No dependencies beyond the base system.
liboggvorbisplay_DEPENDENCIES =      libvorbis

# What files we need to download, and where from.
liboggvorbisplay_GIT_HASH =          51b7bc8d225c9ef4bbbc7f556fd40a5092c40d94
liboggvorbisplay_DOWNLOAD_SITE =     https://github.com/KallistiOS/liboggvorbisplay/archive/
liboggvorbisplay_DOWNLOAD_FILE =     ${liboggvorbisplay_GIT_HASH}.tar.gz

liboggvorbisplay_TARGET =            liboggvorbisplay.a
liboggvorbisplay_INSTALLED_HDRS =    include/oggvorbis/sndoggvorbis.h
liboggvorbisplay_HDR_INSTDIR =       oggvorbis
