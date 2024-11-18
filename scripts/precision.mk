# kos-ports ##version##
#
# scripts/precision.mk
# Copyright (C) 2024 Eric Fradella
#

REQUIRES_ABI ?= any

abi-check:
ifeq (${CHECK_PRECISION},true)
    ifeq (${REQUIRES_ABI},any)
		@echo "${PORTNAME} is compatible with any floating-point ABI."
    else
		@case " $(REQUIRES_ABI) " in *" $(KOS_SH4_PRECISION) "*) \
			echo "${PORTNAME} is compatible with the ${KOS_SH4_PRECISION} floating-point ABI."; \
			;; \
		*) \
			echo "${PORTNAME} is not compatible with the ${KOS_SH4_PRECISION} floating-point ABI!"; \
			echo "Change the KOS_SH4_PRECISION setting in your environ.sh to one of the following: ${REQUIRES_ABI}"; \
			echo "Then rebuild KOS and try again."; \
			exit 1; \
			;; \
		esac
    endif
else ifeq (${CHECK_PRECISION},false)
	@echo "CHECK_PRECISION is disabled in config.mk. Skipping ABI compatibility check."
else
	@echo "CHECK_PRECISION is not set in config.mk. Please correct your configuration."
	exit 1
endif
