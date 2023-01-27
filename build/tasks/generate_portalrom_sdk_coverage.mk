#
# Copyright (C) 2023 The Portal Project
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
#

# Makefile for producing portalrom sdk coverage reports.
# Run "make portalrom-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

portalrom_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/portalrom-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/portalrom-sdk-api-coverage

api_text_description := portalrom-sdk/api/portalrom_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

portalrom-sdk-test-coverage-report := $(coverage_out)/portalrom-sdk-test-coverage.html

portalrom_sdk_tests_apk := $(call intermediates-dir-for,APPS,PortalRomPlatformTests)/package.apk
portalromsettingsprovider_tests_apk := $(call intermediates-dir-for,APPS,PortalRomSettingsProviderTests)/package.apk
portalrom_sdk_api_coverage_dependencies := $(portalrom_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(portalrom-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(portalrom_sdk_tests_apk) $(portalromsettingsprovider_tests_apk)
$(portalrom-sdk-test-coverage-report): PRIVATE_PORTALROM_SDK_API_COVERAGE_EXE := $(portalrom_sdk_api_coverage_exe)
$(portalrom-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(portalrom-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(portalrom-sdk-test-coverage-report): $(portalrom_sdk_tests_apk) $(portalromsettingsprovider_tests_apk) $(portalrom_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-portalrom-coverage-report,"PORTALROM-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: portalrom-sdk-test-coverage
portalrom-sdk-test-coverage : $(portalrom-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "portalrom-sdk" is among the build goals.
ifneq ($(filter portalrom-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, portalrom-sdk, $(portalrom-sdk-test-coverage-report):portalrom-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-portalrom-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_PORTALROM_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -cm
	@ echo $(1): file://$@
endef

# Reset temp vars
portalrom_sdk_api_coverage_dependencies :=
portalrom-sdk-combined-coverage-report :=
portalrom-sdk-combined-xml-coverage-report :=
portalrom-sdk-verifier-coverage-report :=
portalrom-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
portalrom_sdk_api_coverage_exe :=
portalrom_sdk_verifier_apk :=
android_portalrom_sdk_zip :=
