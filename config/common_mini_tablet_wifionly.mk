# Inherit mini common PortalRom stuff
$(call inherit-product, vendor/portalrom/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME
