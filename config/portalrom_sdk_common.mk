# Permissions for portalrom sdk services
PRODUCT_COPY_FILES += \
    vendor/portalrom/config/permissions/org.portalrom.globalactions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.portalrom.globalactions.xml \
    vendor/portalrom/config/permissions/org.portalrom.hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.portalrom.hardware.xml \
    vendor/portalrom/config/permissions/org.portalrom.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.portalrom.livedisplay.xml \
    vendor/portalrom/config/permissions/org.portalrom.profiles.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.portalrom.profiles.xml \
    vendor/portalrom/config/permissions/org.portalrom.settings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.portalrom.settings.xml \
    vendor/portalrom/config/permissions/org.portalrom.trust.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.lineaportalromgeos.trust.xml

# PortalROm Platform Library
PRODUCT_PACKAGES += \
    org.portalrom.platform-res \
    org.portalrom.platform

# AOSP has no support of loading framework resources from /system_ext
# so the SDK has to stay in /system for now
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/%/org.portalrom.platform.odex \
    system/framework/oat/%/org.portalrom.platform.vdex \
    system/framework/org.portalrom.platform-res.apk \
    system/framework/org.portalrom.platform.jar

ifndef PORTALROM_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  PORTALROM_PLATFORM_SDK_VERSION := 9
endif

ifndef PORTALROM_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each PORTALROM_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  PORTALROM_PLATFORM_REV := 0
endif
