/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	"use strict";

	var _interopRequireWildcard = function (obj) { return obj && obj.__esModule ? obj : { "default": obj }; };

	var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

	var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

	Object.defineProperty(exports, "__esModule", {
	  value: true
	});

	var _Dimensions = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"Dimensions\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

	var _Dimensions2 = _interopRequireWildcard(_Dimensions);

	var Device = (function () {
	  function Device() {
	    _classCallCheck(this, Device);

	    this.width = this._width();
	    this.height = this._height();
	    this.kind = this._kind();
	  }

	  _createClass(Device, [{
	    key: "isIpad",
	    value: function isIpad() {
	      return this.kind.indexOf("iPad") === 0;
	    }
	  }, {
	    key: "isIphone",
	    value: function isIphone() {
	      return this.kind.indexOf("iPhone") === 0;
	    }
	  }, {
	    key: "_kind",
	    value: function _kind() {
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
	  }, {
	    key: "_width",
	    value: function _width() {
	      return _Dimensions2["default"].get("window").width;
	    }
	  }, {
	    key: "_height",
	    value: function _height() {
	      return _Dimensions2["default"].get("window").height;
	    }
	  }]);

	  return Device;
	})();

	var device = new Device();
	exports.device = device;

/***/ }
/******/ ]);