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
  
  NSString *initialOrientation = self.orientation;
  float initialBatteryLevel = self.batteryLevel;
  NSString *initialBatteryState = self.batteryState;
  bool initialProximityState = self.proximityState;
  
  bool generatesDeviceOrientationNotifications = device.generatesDeviceOrientationNotifications;
  bool batteryMonitoringEnabled = device.batteryMonitoringEnabled;
  bool proximityMonitoringEnabled = device.proximityMonitoringEnabled;
  
  return @{
           @"model" : (model),
           @"name" : (name),
           @"systemName" : (systemName),
           @"systemVersion" : (systemVersion),
           @"localizedModel" : (localizedModel),
           @"multitaskingSupported" : ([NSNumber numberWithBool:multitaskingSupported]),
           @"userInterfaceIdiom" : (userInterfaceIdiom),
           @"identifierForVendor" : (identifierForVendor),
           
           @"initialOrientation" : (initialOrientation),
           @"initialBatteryLevel" : ([NSNumber numberWithFloat:initialBatteryLevel]),
           @"initialBatteryState" : (initialBatteryState),
           @"initialProximityState" : ([NSNumber numberWithBool:initialProximityState]),
           
           @"generatesDeviceOrientationNotifications" : ([NSNumber numberWithBool:generatesDeviceOrientationNotifications]),
           @"batteryMonitoringEnabled" : ([NSNumber numberWithBool:batteryMonitoringEnabled]),
           @"proximityMonitoringEnabled" : ([NSNumber numberWithBool:proximityMonitoringEnabled]),
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

RCT_EXPORT_METHOD(getBatteryLevel: (RCTResponseSenderBlock)callback) {
  callback(@[[NSNumber numberWithFloat:self.batteryLevel]]);
}

- (float)batteryLevel {
  UIDevice *device = [UIDevice currentDevice];
  
  return device.batteryLevel;
}

RCT_EXPORT_METHOD(getBatteryState: (RCTResponseSenderBlock)callback) {
  callback(@[self.batteryState]);
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

RCT_EXPORT_METHOD(getOrientation: (RCTResponseSenderBlock)callback) {
  callback(@[self.orientation]);
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

RCT_EXPORT_METHOD(getProximityState: (RCTResponseSenderBlock)callback) {
  callback(@[[NSNumber numberWithBool:self.proximityState]]);
}

- (bool)proximityState {
  UIDevice *device = [UIDevice currentDevice];
  
  return device.proximityState;
}

@end