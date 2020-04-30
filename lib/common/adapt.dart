import 'package:flutter/material.dart';
import 'dart:ui';
// https://www.jianshu.com/p/f04dbec57343

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _statusBarHeight = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;
  static init(int number) {
    int uiwidth = number is int ? number : 750;
    _ratio = _width / uiwidth;
  }

  static num px(number) {
    if (!(_ratio is double || _ratio is int)) {
      Adapt.init(750);
    }

    return number * _ratio;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  static screenWidth() {
    return _width;
  }

  static screenHeight() {
    return _height;
  }

  static get w {
    return _width;
  }

  static get h {
    return _height;
  }

  static paddingTop() {
    return _topbarH;
  }

  static paddingBottom() {
    return _botbarH;
  }

  static origin(px) {
    return px * ratio;
  }

  static get ratio {
    return 1 / _ratio;
  }

  static get statusBarHeight {
    return _statusBarHeight;
  }

  static get navbarHeight {
    return kToolbarHeight;
  }

  static topHeight([bool hasTab = false]) {
    return navbarHeight + statusBarHeight + (hasTab ? kTextTabBarHeight : 0.0);
  }
}
