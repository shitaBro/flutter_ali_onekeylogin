#import "FlutterAliOnekeyloginPlugin.h"
#if __has_include(<flutter_ali_onekeylogin/flutter_ali_onekeylogin-Swift.h>)
#import <flutter_ali_onekeylogin/flutter_ali_onekeylogin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_ali_onekeylogin-Swift.h"
#endif

@implementation FlutterAliOnekeyloginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAliOnekeyloginPlugin registerWithRegistrar:registrar];
}
@end
