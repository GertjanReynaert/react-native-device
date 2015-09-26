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
  }

  isIpad() {
    return this.model.indexOf('iPad') >= 0;
  }

  isIphone() {
    return this.model.indexOf('iPhone') >= 0;
  }
}

module.exports = new Device();
