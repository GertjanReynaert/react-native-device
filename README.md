# UIDevice Wrapper for React Native

A wrapper for the native [UIDevice](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/index.html#//apple_ref/occ/cl/UIDevice) class allowing you to access device properties and screen dimensions.

## Installation

First install the package to your project from NPM...

```
npm install react-native-device --save
```

Then within the package folder just add both the `.h` and `.m` classes to your project...

<img src="http://i.imgur.com/GZeVPPd.png" width="400">

## Methods

```javascript
Device.isIpad()
```

The device model is of type iPad

```javascript
Device.isIphone()
```

The device model is of type iPhone

## Properties

```javascript
Device.model
```

The device model, such as `iPhone 5` or `iPad Air` - [All model options](https://github.com/InderKumarRathore/DeviceUtil/blob/master/DeviceUtil.m)

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

## Example

```
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
