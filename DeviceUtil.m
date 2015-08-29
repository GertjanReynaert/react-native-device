#import "DeviceUtil.h"
#import "RCTBridge.h"
#import "RCTUtils.h"

@implementation DeviceUtil

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (NSDictionary *)constantsToExport {
    UIDevice *device = [UIDevice currentDevice];

    NSString *model = device.model;
    NSString *name = device.name;
    NSString *systemName = device.systemName;
    NSString *systemVersion = device.systemVersion;
    NSString *localizedModel = device.localizedModel;
    bool multitaskingSupported = device.multitaskingSupported;
    UIUserInterfaceIdiom userInterfaceIdiom = device.userInterfaceIdiom;
    NSUUID *identifierForVendor = device.identifierForVendor;
    UIDeviceOrientation orientation = device.orientation;
    bool generatesDeviceOrientationNotifications = device.generatesDeviceOrientationNotifications;
    float batteryLevel = device.batteryLevel;
    bool batteryMonitoringEnabled = device.batteryMonitoringEnabled;
    UIDeviceBatteryState batteryState = device.batteryState;
    bool proximityMonitoringEnabled = device.proximityMonitoringEnabled;
    bool proximityState = device.proximityState;

    return @{
             @"model" : (model),
             @"name" : (name),
             @"systemName" : (systemName),
             @"systemVersion" : (systemVersion),
             @"multitaskingSupported" : ([NSNumber numberWithBool:multitaskingSupported]),
             @"localizedModel" : (localizedModel),
             @"userInterfaceIdiom" : ([NSNumber numberWithInt:userInterfaceIdiom]),
             @"identifierForVendor" : (identifierForVendor),
             @"orientation" : ([NSNumber numberWithInt:orientation]),
             @"generatesDeviceOrientationNotifications" : ([NSNumber numberWithBool:generatesDeviceOrientationNotifications]),
             @"batteryLevel" : ([NSNumber numberWithFloat:batteryLevel]),
             @"batteryMonitoringEnabled" : ([NSNumber numberWithBool:batteryMonitoringEnabled]),
             @"batteryState" : ([NSNumber numberWithInt:batteryState]),
             @"proximityMonitoringEnabled" : ([NSNumber numberWithBool:proximityMonitoringEnabled]),
             @"proximityState" : ([NSNumber numberWithBool:proximityState]),
    };
}

@end
