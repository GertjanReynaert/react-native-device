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

RCTResponseSenderBlock orientationChangedCallback;
RCTResponseSenderBlock batteryChangedCallback;
RCTResponseSenderBlock proximityChangedCallback;

//OrientationChange
RCT_EXPORT_METHOD(watchOrientationChange: (RCTResponseSenderBlock)callback) {
  orientationChangedCallback = callback;

  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification
{
  orientationChangedCallback(@[self.orientation]);
}

RCT_EXPORT_METHOD(stopWatchingOrientationChange) {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

//BatterChange
RCT_EXPORT_METHOD(watchBatteryChange: (RCTResponseSenderBlock)callback) {
  batteryChangedCallback = callback;

  UIDevice *device = [UIDevice currentDevice];
  device.batteryMonitoringEnabled = YES;

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:UIDeviceBatteryLevelDidChangeNotification object:device];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:UIDeviceBatteryStateDidChangeNotification object:device];
}

- (void)batteryChanged:(NSNotification *)notification
{
  batteryChangedCallback(@[[NSNumber numberWithFloat:self.batteryLevel], self.batteryState]);
}

RCT_EXPORT_METHOD(stopWatchingBatteryChange) {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceBatteryLevelDidChangeNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceBatteryStateDidChangeNotification object:nil];
}

//ProximityChange
RCT_EXPORT_METHOD(watchProximityChange: (RCTResponseSenderBlock)callback) {
  proximityChangedCallback = callback;

  UIDevice *device = [UIDevice currentDevice];
  device.proximityMonitoringEnabled = YES;

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:UIDeviceProximityStateDidChangeNotification object:device];
}

- (void)proximityChanged:(NSNotification *)notification
{
  proximityChangedCallback(@[[NSNumber numberWithBool: self.proximityState]]);
}

RCT_EXPORT_METHOD(stopWatchingProximityChange) {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
}

@end
