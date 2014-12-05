#import <Preferences/Preferences.h>

@interface ConformityListController: PSListController {
}
@end

@implementation ConformityListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Conformity" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
