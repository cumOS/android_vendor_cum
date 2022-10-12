# Versioning System
CUM_BUILD_VARIANT ?= Gapps
CUM_BUILD_TYPE ?= UNOFFICIAL
CUM_CODENAME := Alpha

# CumOS Release
ifeq ($(CUM_BUILD_TYPE), OFFICIAL)

  OFFICIAL_DEVICES = $(shell cat vendor/cum/cum.devices)
  FOUND_DEVICE =  $(filter $(CUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(CUM_BUILD))
      CUM_BUILD_TYPE := OFFICIAL
    else
      CUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(CUM_BUILD)")
    endif
endif

# System version
TARGET_PRODUCT_SHORT := $(subst cum_,,$(CUM_BUILD_TYPE))

CUM_DATE_YEAR := $(shell date -u +%Y)
CUM_DATE_MONTH := $(shell date -u +%m)
CUM_DATE_DAY := $(shell date -u +%d)
CUM_DATE_HOUR := $(shell date -u +%H)
CUM_DATE_MINUTE := $(shell date -u +%M)
CUM_BUILD_DATE_UTC := $(shell date -d '$(CUM_DATE_YEAR)-$(CUM_DATE_MONTH)-$(CUM_DATE_DAY) $(CUM_DATE_HOUR):$(CUM_DATE_MINUTE) UTC' +%s)
CUM_BUILD_DATE := $(CUM_DATE_YEAR)$(CUM_DATE_MONTH)$(CUM_DATE_DAY)-$(CUM_DATE_HOUR)$(CUM_DATE_MINUTE)

CUM_PLATFORM_VERSION := 13.0
CUMVERSION := 1.0

ifeq ($(CUM_VANILLA), true)
CUM_VERSION := Cum-OS-v$(CUMVERSION)-$(CUM_BUILD_DATE)-$(CUM_BUILD)-$(CUM_BUILD_TYPE)-Vanilla
else
CUM_VERSION := Cum-OS-v$(CUMVERSION)-$(CUM_BUILD_DATE)-$(CUM_BUILD)-$(CUM_BUILD_TYPE)-GApps
endif
CUM_VERSION_PROP := $(PLATFORM_VERSION)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cum.version=$(CUMVERSION) \
    ro.cum.version.display=$(CUM_VERSION) \
    ro.cum.build_date=$(CUM_BUILD_DATE) \
    ro.cum.codename=$(CUM_CODENAME) \
    ro.cum.version.prop=$(CUM_VERSION_PROP) \
    ro.cum.build_date_utc=$(CUM_BUILD_DATE_UTC) \
    ro.cum.build_type=$(CUM_BUILD_TYPE)
