include vendor/portalrom/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/portalrom/config/BoardConfigQcom.mk
endif

include vendor/portalrom/config/BoardConfigSoong.mk
