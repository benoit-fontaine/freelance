#import "FreelancePlugin.h"
#if __has_include(<freelance/freelance-Swift.h>)
#import <freelance/freelance-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "freelance-Swift.h"
#endif

@implementation FreelancePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFreelancePlugin registerWithRegistrar:registrar];
}
@end
