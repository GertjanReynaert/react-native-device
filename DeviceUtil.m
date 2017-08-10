#import "DeviceUtil.h"
// Support React Native headers both in the React namespace, where they are in RN version 0.40+,
// and no namespace, for older versions of React Native
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#else
#import "RCTBridge.h"
#endif
#if __has_include(<React/RCTUtils.h>)
#import <React/RCTUtils.h>
#else
#import "RCTUtils.h"
#endif
#import <sys/utsname.h>

@implementation DeviceUtil

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (NSDictionary *)constantsToExport {
    NSString *model = [[UIDevice currentDevice] model];
    NSString *name = [[UIDevice currentDevice] name];
    NSString *systemName = [[UIDevice currentDevice] systemName];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceVersion = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    return @{
             @"model" : (model),
             @"name" : (name),
             @"systemName" : (systemName),
             @"systemVersion" : (systemVersion),
             @"deviceVersion" : (deviceVersion)
             };
}

@end
