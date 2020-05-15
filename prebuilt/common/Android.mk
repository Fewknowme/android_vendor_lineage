LOCAL_PATH := $(call my-dir)

# a wrapper for curl which provides wget syntax, for compatibility
include $(CLEAR_VARS)
LOCAL_MODULE := wget
LOCAL_SRC_FILES := bin/wget
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_PREBUILT)

################################
# Copies the APN list file into $(TARGET_COPY_OUT_PRODUCT)/etc for the product as apns-conf.xml.
# In the case where $(CUSTOM_APNS_FILE) is defined, the content of $(CUSTOM_APNS_FILE)
# is added or replaced to the $(DEFAULT_APNS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC

DEFAULT_APNS_FILE := vendor/lineage/prebuilt/common/etc/apns-conf.xml

ifdef CUSTOM_APNS_FILE
CUSTOM_APNS_SCRIPT := vendor/lineage/tools/custom_apns.py
FINAL_APNS_FILE := $(local-generated-sources-dir)/apns-conf.xml

$(FINAL_APNS_FILE): PRIVATE_SCRIPT := $(CUSTOM_APNS_SCRIPT)
$(FINAL_APNS_FILE): PRIVATE_CUSTOM_APNS_FILE := $(CUSTOM_APNS_FILE)
$(FINAL_APNS_FILE): $(CUSTOM_APNS_SCRIPT) $(DEFAULT_APNS_FILE)
	rm -f $@
	python $(PRIVATE_SCRIPT) $@ $(PRIVATE_CUSTOM_APNS_FILE)
else
FINAL_APNS_FILE := $(DEFAULT_APNS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(FINAL_APNS_FILE)

LOCAL_PRODUCT_MODULE := true

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := fonts_customization.xml
LOCAL_SRC_FILES := etc/fonts_customization.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

# Prebuilt Apps

# duckduckgo Browser | https://github.com/duckduckgo/Android
include $(CLEAR_VARS)
LOCAL_MODULE := duckduckgo
LOCAL_SRC_FILES := apk/$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

# Aurora Services | https://gitlab.com/AuroraOSS/AuroraServices
include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-auroraservices.xml
LOCAL_SRC_FILES := apk/permissions/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := AuroraServices
LOCAL_SRC_FILES := apk/AuroraServices.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := privapp-permissions-auroraservices.xml
include $(BUILD_PREBUILT)

# Aurora Store | https://gitlab.com/AuroraOSS/AuroraStore
include $(CLEAR_VARS)
LOCAL_MODULE := AuroraStore
LOCAL_SRC_FILES := apk/AuroraStore.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := AuroraServices
include $(BUILD_PREBUILT)

# MicroG | https://github.com/microg/android_packages_apps_GmsCore
include $(CLEAR_VARS)
LOCAL_MODULE := GmsCore
LOCAL_SRC_FILES := apk/GmsCore.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := FakeStore
include $(BUILD_PREBUILT)

# FakeStore | https://github.com/microg/android_packages_apps_FakeStore
include $(CLEAR_VARS)
LOCAL_MODULE := FakeStore
LOCAL_SRC_FILES := apk/FakeStore.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := GsfProxy
include $(BUILD_PREBUILT)

# GsfProxy | https://github.com/microg/android_packages_apps_GsfProxy
include $(CLEAR_VARS)
LOCAL_MODULE := GsfProxy
LOCAL_SRC_FILES := apk/GsfProxy.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := privapp-permissions-microg.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-microg.xml
LOCAL_SRC_FILES := apk/permissions/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permission
LOCAL_REQUIRED_MODULES := microg-power-whitelist.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := microg-power-whitelist.xml
LOCAL_SRC_FILES := apk/permissions/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/sysconfig
include $(BUILD_PREBUILT)

# Shuttle music player | https://github.com/timusus/Shuttle
include $(CLEAR_VARS)
LOCAL_MODULE := ShuttleFree
LOCAL_SRC_FILES := apk/$(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
