var { NativeModules, Dimensions } = require('react-native');
var DeviceUtil = NativeModules.DeviceUtil;

class Device {
  constructor() {
    this.width = Dimensions.get('window').width;
    this.height = Dimensions.get('window').height;
    this.model = DeviceUtil.model;
    this.deviceName = DeviceUtil.name;
    this.systemName = DeviceUtil.systemName;
    this.systemVersion = DeviceUtil.systemVersion;
    this.multitaskingSupported = DeviceUtil.multitaskingSupported;
    this.localizedModel = DeviceUtil.localizedModel;
    this.userInterfaceIdiom = DeviceUtil.userInterfaceIdiom;
    this.identifierForVendor = DeviceUtil.identifierForVendor;
    this.orientation = DeviceUtil.orientation;
    this.generatesDeviceOrientationNotifications =
      DeviceUtil.generatesDeviceOrientationNotifications;
    this.batteryLevel = DeviceUtil.batteryLevel;
    this.batteryMonitoringEnabled = DeviceUtil.batteryMonitoringEnabled;
    this.batteryState = DeviceUtil.batteryState;
    this.proximityMonitoringEnabled = DeviceUtil.proximityMonitoringEnabled;
    this.proximityState = DeviceUtil.proximityState;
  }

  isIpad() {
    return this.userInterfaceIdiom === 'Pad';
  }

  isIphone() {
    return this.userInterfaceIdiom === 'Phone';
  }
}

module.exports = new Device();
