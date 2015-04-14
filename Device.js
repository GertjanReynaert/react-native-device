var Dimensions = require('Dimensions');

class Device {
  constructor() {
    this.width = this._width();
    this.height = this._height();
    this.kind = this._kind();
  }

  isIpad() {
    return this.kind.indexOf("iPad") === 0;
  }

  isIphone() {
    return this.kind.indexOf("iPhone") === 0;
  }

  _kind() {
    var iPad = [768, 1024];
    var iPhone4 = [320, 480];
    var iPhone5 = [320, 568];
    var iPhone6 = [375, 667];
    var iPhone6plus = [414, 736];

    if (iPad.indexOf(this.width) > -1 && iPad.indexOf(this.height) > -1) {
      return "iPad";
    }

    if (iPhone4.indexOf(this.width) > -1 && iPhone4.indexOf(this.height) > -1) {
      return "iPhone4";
    }

    if (iPhone5.indexOf(this.width) > -1 && iPhone5.indexOf(this.height) > -1) {
      return "iPhone5";
    }

    if (iPhone6.indexOf(this.width) > -1 && iPhone6.indexOf(this.height) > -1) {
      return "iPhone6";
    }

    if (iPhone6plus.indexOf(this.width) > -1 && iPhone6plus.indexOf(this.height) > -1) {
      return "iPhone6plus";
    }
  }

  _width() {
    return Dimensions.get("window").width;
  }

  _height() {
    return Dimensions.get("window").height;
  }
}

module.exports = new Device();
