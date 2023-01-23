PRODUCT_VERSION_MAJOR = 19
PRODUCT_VERSION_MINOR = 1

ifeq ($(PORTALROM_VERSION_APPEND_TIME_OF_DAY),true)
    PORTALROM_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    PORTALROM_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set PORTALROM_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef PORTALROM_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "PORTALROM_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^PORTALROM_||g')
        PORTALROM_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(PORTALROM_BUILDTYPE)),)
    PORTALROM_BUILDTYPE := UNOFFICIAL
    PORTALROM_EXTRAVERSION :=
endif

ifeq ($(PORTALROM_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        PORTALROM_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

PORTALROM_VERSION_SUFFIX := $(PORTALROM_BUILD_DATE)-$(PORTALROM_BUILDTYPE)$(PORTALROM_EXTRAVERSION)-$(PORTALROM_BUILD)

# Internal version
PORTALROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PORTALROM_VERSION_SUFFIX)

# Display version
PORTALROM_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(PORTALROM_VERSION_SUFFIX)
