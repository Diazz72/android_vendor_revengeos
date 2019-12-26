# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
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

# -----------------------------------------------------------------

# RevengeOS package
REVENGEOS_TARGET_PACKAGE := $(PRODUCT_OUT)/RevengeOS-$(REVENGEOS_BUILD_ID).zip

.PHONY: otapackage bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
bacon: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(REVENGEOS_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(REVENGEOS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(REVENGEOS_TARGET_PACKAGE).md5sum
	@echo "done"
	@echo "===============================-Package complete-============================================================="
	@echo "Zip: $(REVENGEOS_TARGET_PACKAGE)"
	@echo "MD5: `cat $(REVENGEOS_TARGET_PACKAGE).md5sum | awk '{print $$1}' `"
	@echo "Size: `du -sh $(REVENGEOS_TARGET_PACKAGE) | awk '{print $$1}' `"
@echo "=============================================================================================================="
