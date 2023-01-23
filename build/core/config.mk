# Copyright (C) 2023 The PortalRom Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PORTALROM_SRC_API_DIR := $(TOPDIR)prebuilts/portalrom-sdk/api
INTERNAL_PORTALROM_PLATFORM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/portalrom_public_api.txt
INTERNAL_PORTALROM_PLATFORM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/portalrom_removed.txt
FRAMEWORK_PORTALROM_PLATFORM_API_FILE := $(TOPDIR)portalrom-sdk/api/portalrom_current.txt
FRAMEWORK_PORTALROM_PLATFORM_REMOVED_API_FILE := $(TOPDIR)portalrom-sdk/api/portalrom_removed.txt
FRAMEWORK_PORTALROM_API_NEEDS_UPDATE_TEXT := $(TOPDIR)vendor/portalrom/build/core/apicheck_msg_current.txt

# Rules for QCOM targets
include $(TOPDIR)vendor/portalrom/build/core/qcom_target.mk
