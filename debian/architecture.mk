# This Makefile fragment defines FMOD_ARCH using DEB_HOST_ARCH.
# Existing values of variables are preserved.
# All variables are exported.#
#
# Note:
# - Only documented variables are considered public interfaces.
# - Expects to be included from the source tree root directory.

ifndef fmod_architecture_mk_included
fmod_architecture_mk_included = yes

include /usr/share/dpkg/architecture.mk

ifeq ($(DEB_HOST_ARCH),i386)
 export FMOD_ARCH?=x86
else ifeq ($(DEB_HOST_ARCH),amd64)
 export FMOD_ARCH?=x86_64
else ifeq ($(DEB_HOST_ARCH),armhf)
 export FMOD_ARCH?=arm
else ifeq ($(DEB_HOST_ARCH),arm64)
 export FMOD_ARCH?=arm64
else
 export FMOD_ARCH?=$(DEB_HOST_ARCH)
 $(warning Unsupported runtime architecture: $(FMOD_ARCH))
endif

endif # fmod_architecture_mk_included
