ARCHS = arm64
TARGET = iphone:clang:latest:14.0

THEOS = /var/theos

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = esp

# PUBG Global ka Bundle ID yahan configure kiya hai
esp_APPLICATION_IDS = com.tencent.ig

esp_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText JRMemory
esp_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
esp_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
esp_FILES = Lvhuizhi.mm Lvzb.mm $(wildcard esp/*.cpp) $(wildcard esp/*.m) $(wildcard TEXT/*.m)
#esp_LIBRARIES = substrate
# GO_EASY_ON_ME = 1

include $(THEOS)/make_path)/tweak.mk

after-install::
	install.exec "killall -9 ShadowTrackerExtra || :"
