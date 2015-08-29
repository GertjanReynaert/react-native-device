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
    NSString *userInterfaceIdiom = self.userInterfaceIdiom;
    NSString *identifierForVendor = device.identifierForVendor.UUIDString;
    NSString *orientation = self.orientation;
    bool generatesDeviceOrientationNotifications = device.generatesDeviceOrientationNotifications;
    float batteryLevel = device.batteryLevel;
    bool batteryMonitoringEnabled = device.batteryMonitoringEnabled;
    NSString *batteryState = self.batteryState;
    bool proximityMonitoringEnabled = device.proximityMonitoringEnabled;
    bool proximityState = device.proximityState;

    return @{
             @"model" : (model),
             @"name" : (name),
             @"systemName" : (systemName),
             @"systemVersion" : (systemVersion),
             @"multitaskingSupported" : ([NSNumber numberWithBool:multitaskingSupported]),
             @"localizedModel" : (localizedModel),
             @"userInterfaceIdiom" : (userInterfaceIdiom),
             @"identifierForVendor" : (identifierForVendor),
             @"orientation" : (orientation),
             @"generatesDeviceOrientationNotifications" : ([NSNumber numberWithBool:generatesDeviceOrientationNotifications]),
             @"batteryLevel" : ([NSNumber numberWithFloat:batteryLevel]),
             @"batteryMonitoringEnabled" : ([NSNumber numberWithBool:batteryMonitoringEnabled]),
             @"batteryState" : (batteryState),
             @"proximityMonitoringEnabled" : ([NSNumber numberWithBool:proximityMonitoringEnabled]),
             @"proximityState" : ([NSNumber numberWithBool:proximityState]),
    };
}

- (NSString *)userInterfaceIdiom {
  UIDevice *device = [UIDevice currentDevice];

  switch (device.userInterfaceIdiom) {
    case UIUserInterfaceIdiomPad:
      return @"Pad";
      break;

    case UIUserInterfaceIdiomPhone:
      return @"Phone";
      break;

    default:
      return @"Unspecified";
      break;
  }
}

- (NSString *)batteryState {
  UIDevice *device = [UIDevice currentDevice];

  switch (device.batteryState) {
    case UIDeviceBatteryStateCharging:
      return @"Charging";
      break;

    case UIDeviceBatteryStateFull:
      return @"Full";
      break;

    case UIDeviceBatteryStateUnplugged:
      return @"Unplugged";
      break;

    default:
      return @"Unknown";
      break;
  }
}

- (NSString *)orientation {
  UIDevice *device = [UIDevice currentDevice];

  switch (device.orientation) {
    case UIDeviceOrientationFaceDown:
      return @"FaceDown";
      break;

    case UIDeviceOrientationFaceUp:
      return @"FaceUp";
      break;

    case UIDeviceOrientationLandscapeLeft:
      return @"LandscapeLeft";
      break;

    case UIDeviceOrientationLandscapeRight:
      return @"LandscapeRight";
      break;

    case UIDeviceOrientationPortrait:
      return @"Portrait";
      break;

    case UIDeviceOrientationPortraitUpsideDown:
      return @"UpsideDown";
      break;

    default:
      return @"Unknown";
      break;
  }
}

@end

