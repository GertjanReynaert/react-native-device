#import "DeviceUtil.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTUtils.h"
#import "RCTConvert.h"

@implementation DeviceUtil

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (instancetype)init
{
  if (self = [super init]) {
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    device.proximityMonitoringEnabled = YES;
    [device beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryLevelChanged:) name:UIDeviceBatteryLevelDidChangeNotification object:device];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStateChanged:) name:UIDeviceBatteryStateDidChangeNotification object:device];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:UIDeviceProximityStateDidChangeNotification object:device];
  }
  
  return self;
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSDictionary *)constantsToExport {
  UIDevice *device = [UIDevice currentDevice];
  
  return @{
           @"model" : (device.model),
           @"name" : (device.name),
           @"systemName" : (device.systemName),
           @"systemVersion" : (device.systemVersion),
           @"localizedModel" : (device.localizedModel),
           @"multitaskingSupported" : ([NSNumber numberWithBool:device.multitaskingSupported]),
           @"userInterfaceIdiom" : self.userInterfaceIdiom,
           @"identifierForVendor" : (device.identifierForVendor.UUIDString),

           @"initialOrientation" : self.orientation,
           @"initialBatteryLevel" : ([NSNumber numberWithFloat:device.batteryLevel]),
           @"initialBatteryState" : self.batteryState,
           @"initialProximityState" : ([NSNumber numberWithBool:device.proximityState]),

           @"generatesDeviceOrientationNotifications" : ([NSNumber numberWithBool:device.generatesDeviceOrientationNotifications]),
           @"batteryMonitoringEnabled" : ([NSNumber numberWithBool:device.batteryMonitoringEnabled]),
           @"proximityMonitoringEnabled" : ([NSNumber numberWithBool:device.proximityMonitoringEnabled]),
           };
}

// Getters

RCT_EXPORT_METHOD(getBatteryLevel: (RCTResponseSenderBlock)callback) {
  UIDevice *device = [UIDevice currentDevice];
  callback(@[[NSNumber numberWithFloat:device.batteryLevel]]);
}

RCT_EXPORT_METHOD(getBatteryState: (RCTResponseSenderBlock)callback) {
  callback(@[self.batteryState]);
}

RCT_EXPORT_METHOD(getOrientation: (RCTResponseSenderBlock)callback) {
  callback(@[self.orientation]);
}

RCT_EXPORT_METHOD(getProximityState: (RCTResponseSenderBlock)callback) {
  UIDevice *device = [UIDevice currentDevice];
  callback(@[[NSNumber numberWithBool:device.proximityState]]);
}

// Callbacks for event listeners

- (void)orientationChanged:(NSNotification *)notification
{
  [self.bridge.eventDispatcher sendAppEventWithName:@"orientationChanged"
                                               body:@{@"orientation": self.orientation}];
}

- (void)batteryLevelChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"batteryLevelChanged"
                                               body:@{@"batteryLevel":[NSNumber numberWithFloat: device.batteryLevel]}];
}

- (void)batteryStateChanged:(NSNotification *)notification
{
  [self.bridge.eventDispatcher sendAppEventWithName:@"batteryStateChanged"
                                               body:@{@"batteryState": self.batteryState}];
}

- (void)proximityChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"proximityStateChanged"
                                               body:@{@"proximityState": [NSNumber numberWithBool: device.proximityState]}];
}

// enum mappings

- (NSString *)orientation {
  switch ([[UIDevice currentDevice] orientation]) {
    case UIDeviceOrientationFaceDown: return @"FaceDown"; break;
    case UIDeviceOrientationFaceUp: return @"FaceUp"; break;
    case UIDeviceOrientationLandscapeLeft: return @"LandscapeLeft"; break;
    case UIDeviceOrientationLandscapeRight: return @"LandscapeRight"; break;
    case UIDeviceOrientationPortraitUpsideDown: return @"UpsideDown"; break;
    case UIDeviceOrientationPortrait: return @"Portrait"; break;
    default: return @"Unknown"; break;
  }
}

- (NSString *)batteryState {
  switch ([[UIDevice currentDevice] batteryState]) {
    case UIDeviceBatteryStateFull: return @"Full"; break;
    case UIDeviceBatteryStateCharging: return @"charging"; break;
    case UIDeviceBatteryStateUnplugged: return @"Unplugged"; break;
    default: return @"Unknown"; break;
  }
}

- (NSString *)userInterfaceIdiom {
  switch ([[UIDevice currentDevice] userInterfaceIdiom]) {
    case UIUserInterfaceIdiomPad: return @"Pad"; break;
    case UIUserInterfaceIdiomPhone: return @"Phone"; break;
    default: return @"Unspecified"; break;
  }
}

@end