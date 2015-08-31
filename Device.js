var { NativeModules, Dimensions } = require('react-native');
var DeviceUtil = NativeModules.DeviceUtil;

class Device {
  constructor() {
    //constants
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

    this.initialOrientation = DeviceUtil.initialOrientation;
    this.initialBatteryState = DeviceUtil.initialBatteryState;
    this.initialBatteryLevel = DeviceUtil.initialBatteryLevel;
    this.initialProximityState = DeviceUtil.initialProximityState;

    this.batteryMonitoringEnabled = DeviceUtil.batteryMonitoringEnabled;
    this.proximityMonitoringEnabled = DeviceUtil.proximityMonitoringEnabled;
    this.generatesDeviceOrientationNotifications = DeviceUtil.generatesDeviceOrientationNotifications;
  }

  isIpad() {
    return this.userInterfaceIdiom === 'Pad';
  }

  isIphone() {
    return this.userInterfaceIdiom === 'Phone';
  }

  getOrientation(callback) {
    DeviceUtil.getOrientation(callback);
  }

  getBatteryState(callback) {
    DeviceUtil.getBatteryState(callback);
  }

  getBatteryLevel(callback) {
    DeviceUtil.getBatteryLevel(callback);
  }

  getProximityState(callback) {
    DeviceUtil.getProximityState(callback);
  }
}

module.exports = new Device();
