# kos-ports ##version##
#
# scripts/arch.mk
# Copyright (C) 2026 Eric Fradella
#

ARCHS_SUPPORTED ?= any

arch-check:
ifeq (${CHECK_ARCH},true)
    ifeq (${ARCHS_SUPPORTED},any)
		@echo "${PORTNAME} supports any arch."
    else
		@case " $(ARCHS_SUPPORTED) " in *" $(KOS_ARCH) "*) \
			echo "${PORTNAME} supports the ${KOS_ARCH} arch."; \
			;; \
		*) \
			echo "${PORTNAME} does not support the ${KOS_ARCH} arch. Quitting."; \
			exit 1; \
			;; \
		esac
    endif
else ifeq (${CHECK_ARCH},false)
	@echo "CHECK_ARCH is disabled in config.mk. Skipping arch support check."
else
	@echo "CHECK_ARCH is not set in config.mk. Please correct your configuration."
	exit 1
endif
