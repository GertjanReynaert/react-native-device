#import "DeviceUtil.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTUtils.h"
#import "RCTConvert.h"

@implementation RCTConvert (DeviceUtil)
RCT_ENUM_CONVERTER(UIDeviceOrientation, (@{
                                           @"FaceDown": @(UIDeviceOrientationFaceDown),
                                           @"FaceUp": @(UIDeviceOrientationFaceUp),
                                           @"LandscapeLeft": @(UIDeviceOrientationLandscapeLeft),
                                           @"LandscapeRight": @(UIDeviceOrientationLandscapeRight),
                                           @"Portrait": @(UIDeviceOrientationPortrait),
                                           @"PortraitUpsideDown": @(UIDeviceOrientationPortraitUpsideDown),
                                           @"Unknown": @(UIDeviceOrientationUnknown),
                                           }), UIDeviceOrientationUnknown, integerValue);

RCT_ENUM_CONVERTER(UIDeviceBatteryState, (@{
                                            @"Charging": @(UIDeviceBatteryStateCharging),
                                            @"Full": @(UIDeviceBatteryStateFull),
                                            @"Unplugged": @(UIDeviceBatteryStateUnplugged),
                                            @"Unknown": @(UIDeviceBatteryStateUnknown),
                                            }), UIDeviceBatteryStateUnknown, integerValue)

RCT_ENUM_CONVERTER(UIUserInterfaceIdiom, (@{
                                            @"Pad": @(UIUserInterfaceIdiomPad),
                                            @"Phone": @(UIUserInterfaceIdiomPhone),
                                            @"Unspecified": @(UIUserInterfaceIdiomUnspecified),
                                            }), UIUserInterfaceIdiomUnspecified, integerValue);
@end

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
           @"userInterfaceIdiom" : @(device.userInterfaceIdiom),
           @"identifierForVendor" : (device.identifierForVendor.UUIDString),

           @"initialOrientation" : @(device.orientation),
           @"initialBatteryLevel" : ([NSNumber numberWithFloat:device.batteryLevel]),
           @"initialBatteryState" : @(device.batteryState),
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
  UIDevice *device = [UIDevice currentDevice];
  callback(@[@(device.batteryState)]);
}

RCT_EXPORT_METHOD(getOrientation: (RCTResponseSenderBlock)callback) {
  UIDevice *device = [UIDevice currentDevice];
  callback(@[@(device.orientation)]);
}

RCT_EXPORT_METHOD(getProximityState: (RCTResponseSenderBlock)callback) {
  UIDevice *device = [UIDevice currentDevice];
  callback(@[[NSNumber numberWithBool:device.proximityState]]);
}

// Callbacks for event listeners

- (void)orientationChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"orientationChanged"
                                               body:@{@"orientation": @(device.orientation)}];
}

- (void)batteryLevelChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"batteryLevelChanged"
                                               body:@{@"batteryLevel":[NSNumber numberWithFloat: device.batteryLevel]}];
}

- (void)batteryStateChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"batteryStateChanged"
                                               body:@{@"batteryState": @(device.batteryState)}];
}

- (void)proximityChanged:(NSNotification *)notification
{
  UIDevice *device = [UIDevice currentDevice];
  [self.bridge.eventDispatcher sendAppEventWithName:@"proximityStateChanged"
                                               body:@{@"proximityState": [NSNumber numberWithBool: device.proximityState]}];
}
@end