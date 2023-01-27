# Inherit common PortalRom stuff
$(call inherit-product, vendor/portalrom/config/common.mk)

# Inherit PortalRom car device tree
$(call inherit-product, device/portalrom/car/portalrom_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
