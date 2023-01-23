# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# PortalRom System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.portalrom.version=$(PORTALROM_VERSION) \
    ro.portalrom.releasetype=$(PORTALROM_BUILDTYPE) \
    ro.portalrom.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(PORTALROM_VERSION) 

# PortalRom Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.portalrom.display.version=$(PORTALROM_DISPLAY_VERSION)

# PortalRom Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.portalrom.build.version.plat.sdk=$(PORTALROM_PLATFORM_SDK_VERSION)

# PortalRom Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.portalrom.build.version.plat.rev=$(PORTALROM_PLATFORM_REV)
