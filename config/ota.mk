ifneq ($(filter OFFICIAL CI,$(CUM_BUILD_TYPE)),)
PRODUCT_PACKAGES += \
    Updater
endif