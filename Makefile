ARCHS = arm64
TARGET = iphone:clang:latest:14.0

# Allow GitHub Actions to dynamically set this path
THEOS ?= /Users/runner/theos

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = esp

# PUBG Global Bundle ID configuration
esp_APPLICATION_IDS = com.tencent.ig

esp_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText
esp_EXTRA_FRAMEWORKS = JRMemory

# Flags for C, C++, and Obj-C++
COMMON_FLAGS = -F. -I. -I./JRMemory -F./JRMemory -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

esp_CFLAGS = -fobjc-arc $(COMMON_FLAGS)
esp_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG $(COMMON_FLAGS)
esp_OBJCCFLAGS = -fobjc-arc $(COMMON_FLAGS)
esp_LDFLAGS = -F. -F./JRMemory

# Only compile existing source files
esp_FILES = Lvhuizhi.mm $(wildcard esp/*.cpp) $(wildcard esp/*.m) $(wildcard TEXT/*.m)

include $(THEOS)/makefiles/tweak.mk

after-install::
	install.exec "killall -9 ShadowTrackerExtra || :"
