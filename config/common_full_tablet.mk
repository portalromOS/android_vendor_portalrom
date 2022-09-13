# Inherit full common Lineage stuff
$(call inherit-product, vendor/portalrom/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/portalrom/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/portalrom/overlay/dictionaries

$(call inherit-product, vendor/portalrom/config/telephony.mk)
