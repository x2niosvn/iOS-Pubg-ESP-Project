ARCHS = arm64 


THEOS = /var/theos

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = esp


esp_FRAMEWORKS =  UIKit Foundation Security QuartzCore CoreGraphics CoreText JRMemory
esp_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
esp_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
esp_FILES = Lvhuizhi.mm Lvzb.mm $(wildcard esp/*.m) $(wildcard TEXT/*.m)
#esp_LIBRARIES += substrate
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk


after-install::
   install.exec "killall -9 ShadowTrackerExtra || :"
