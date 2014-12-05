ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = Conformity
Conformity_FILES = Tweak.xm
Conformity_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore CoreTelephony CoreLocation AddressBook
Conformity_PRIAVTE_FRAMEWORKS = TelephonyUtilities ChatKit
Conformity_CFLAGS = -fobjc-arc
Conformity_LIBRARIES = objcipc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += Preferences
include $(THEOS_MAKE_PATH)/aggregate.mk
