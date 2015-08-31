# React Native Device

![NPM Stats](https://nodei.co/npm/react-native-device.png?downloads=true)

A wrapper for the native [iOS UIDevice](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/cl/UIDevice) & [Android Build](http://developer.android.com/reference/android/os/Build.html) class allowing you to access device properties and screen dimensions. **Currently only for React Native iOS, [Android support](https://github.com/GertjanReynaert/react-native-device/issues/16) in progress.**

## Installation (iOS)

First install the package to your project from NPM...

```
npm install react-native-device --save
```

Then within the package folder just add both the `.h` and `.m` classes to your project...

<img src="http://i.imgur.com/GZeVPPd.png" width="400">

## Example Usage

```javascript
'use strict';

var Device = require('react-native-device');

var ExampleApp = React.createClass({
  render: function() {
    if (Device.isIpad()) {
      // return iPad layout
    } else {
      // return iPhone layout
    }
  }
});
```

## API

### Methods

```javascript
Device.isIpad()
```

The device model is of type iPad

```javascript
Device.isIphone()
```

The device model is of type iPhone or iPod touch

### Properties

Full documentation on the native properties: [Apple documentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html)

#### Device and Operating System
```javascript
Device.model
```

The device model, such as `iPhone 5` or `iPad Air` - [All model options](https://github.com/InderKumarRathore/DeviceUtil/blob/master/DeviceUtil.m)

```javascript
Device.localizedModel
```

Localized verion of `Device.model`

```javascript
Device.deviceName
```

The device name, such as `John Smith's iPhone`

```javascript
Device.systemName
```

The device OS name, such as `iPhone OS`

```javascript
Device.systemVersion
```

The device OS version, such as `8.4`

```javascript
Device.identifierForVendor
```

Device unique id (UUID)

```javascript
Device.multitaskingSupported
```

Whether the device supports multitasking or not

```javascript
Device.userInterfaceIdiom
```

What type of device it is. Possible values:

- Phone (includes iPod touch)
- Pad
- Unknown

#### Orientation

```javascript
Device.initialOrientation
```

Orientation of the device when the app is just started.
Possible values:

- FaceDown
- FaceUp
- LandscapeLeft
- LandscapeRight
- Portrait
- UpsideDown
- Unknown

```javascript
Device.generatesDeviceOrientationNotifications
```

Whether the device can change orientation or not. (Orientation lock)

#### Battery

```javascript
Device.initialBatteryLevel
```

Level of the battery when the app is just started.
Values between 0.0 and 1.0, if unknown -1.0

```javascript
Device.initialBatteryState
```

State of the battery when the app just started.
Possible values:

- Charging
- Full
- Unplugged
- Unknown

```javascript
Device.batteryMonitoringEnabled
```

Whether the app is monitoring the battery or not.

#### Proximity

```javascript
Device.initialProximityState
```

Whether the device is close to the user (true) or not (false)

```javascript
Device.proximityMonitoringEnabled
```

Whether the app is monitoring the proximity or not
