# Basic
PRODUCT_PACKAGES += \
    messaging \
    Gallery2 \
    Contacts \
    Dialer \
    LatinIME \
    ThemePicker \
    SettingsIntelligenceGoogle \
    SoundPickerGoogleRelease \
    Launcher3QuickStep
    
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/cum/overlay-aosp

DEVICE_PACKAGE_OVERLAYS += \
    vendor/cum/overlay-aosp/common
    
# Build
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
