# Inherit common PortalRom stuff
$(call inherit-product, vendor/portalrom/config/common.mk)

# Inherit PortalRom atv device tree
$(call inherit-product, device/portalrom/atv/portalrom_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# PortalRom packages
PRODUCT_PACKAGES += \
    PortalRomCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/portalrom/overlay/tv
