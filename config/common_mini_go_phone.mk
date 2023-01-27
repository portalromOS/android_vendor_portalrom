# Set PortalRom specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common PortalRom stuff
$(call inherit-product, vendor/portalrom/config/common_mini_phone.mk)
