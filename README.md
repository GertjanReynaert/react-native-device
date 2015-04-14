Device detection for react-native
=================================

Detect device type and screen size.

Installation
------------

```
npm install react-native-device --save
```

API
---

- isIpad
  - boolean

- isIphone
  - boolean

- kind
  - "iPad"
  - "iPhone4"
  - "iPhone5"
  - "iPhone6"
  - "iPhone6plus"

- width

- height

Usage example
-------------

```
'use strict';

var React = require('react-native');
var Device = require('Device');
var {
  AppRegistry
} = React;

var ExampleApp = React.createClass({
  render: function() {
    if (Device.isIpad()) {
      // return iPad layout
    } else {
      // return iPhone layout
    }
  }
});

AppRegistry.registerComponent('ExampleApp', () => ExampleApp);
```
