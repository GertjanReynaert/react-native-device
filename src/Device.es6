import Dimensions from 'Dimensions';

class Device {
  isIpad() {
    return this.kind.indexOf("iPad") === 0;
  }

  isIphone() {
    return this.kind.indexOf("iPhone") === 0;
  }

  get kind() {
    const iPad = [768, 1024];
    const iPhone4 = [320, 480];
    const iPhone5 = [320, 568];
    const iPhone6 = [375, 667];
    const iPhone6plus = [414, 736];

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

  get width() {
    return Dimensions.get("window").width;
  }

  get height() {
    return Dimensions.get("window").height;
  }
}

export var device = new Device();
