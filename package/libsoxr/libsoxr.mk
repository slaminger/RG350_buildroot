################################################################################
#
# libsoxr
#
################################################################################

LIBSOXR_VERSION = 0.1.1
LIBSOXR_SOURCE = soxr-$(LIBSOXR_VERSION)-Source.tar.xz
LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
LIBSOXR_LICENSE = LGPLv2.1+
LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
LIBSOXR_INSTALL_STAGING = YES
LIBSOXR_CONF_OPTS = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF

ifeq ($(BR2_STATIC_LIBS),y)
LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
endif

ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=1
else
LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=0
endif

$(eval $(cmake-package))
