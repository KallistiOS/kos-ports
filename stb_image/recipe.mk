# Port Metadata
stb_image_PORTVERSION = 2.29

stb_image_MAINTAINER  = Jason Rost (OniEnzeru)
stb_image_LICENSE     = Public Domain
stb_image_SHORT_DESC  = Single header library for image loading supporting many common formats.

# What files we need to download, and where from.
stb_image_DOWNLOAD_SITE =   https://raw.githubusercontent.com/nothings/stb/master/
stb_image_DOWNLOAD_FILE =   stb_image.h

stb_image_TARGET          = libstb_image.a
stb_image_INSTALLED_HDRS  = stb_image.h
stb_image_HDR_INSTDIR     = stb_image

stb_image_UNPACK_CMD = install -m 0644 -D -t ${KOS_PORTS}/stb_image/build-${KOS_ARCH}/${stb_image_PORTVERSION}/stb_image-${stb_image_PORTVERSION}
