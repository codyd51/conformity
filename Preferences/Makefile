ARCHS = armv7 arm64
include theos/makefiles/common.mk

BUNDLE_NAME = Conformity
Conformity_FILES = Conformity.mm
Conformity_INSTALL_PATH = /Library/PreferenceBundles
Conformity_FRAMEWORKS = UIKit
Conformity_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Conformity.plist$(ECHO_END)
