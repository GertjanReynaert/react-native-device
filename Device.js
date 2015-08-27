var { NativeModules } = require('react-native');

var DeviceUtil = NativeModules.DeviceUtil;
var Dimensions = require('Dimensions');

class Device {

  constructor() {
    this.width = Dimensions.get("window").width;
    this.height = Dimensions.get("window").height;
    this.model = DeviceUtil.model;
    this.deviceName = DeviceUtil.name;
    this.systemName = DeviceUtil.systemName;
    this.systemVersion = DeviceUtil.systemVersion;
  }

  isIpad() {
  	if (this.model.indexOf("iPad") >= 0) {
  		return true;
  	}
  }

  isIphone() {
  	if (this.model.indexOf("iPhone") >= 0) {
  		return true;
  	}
  }
  
}

module.exports = new Device();