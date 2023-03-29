import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

/// MediaQuery Data'larına buradan erişilecek ve değişiklik yapmak gerekirse burdan yapılacak.
class MyMediaQuery {
  static late double width;
  static late double height;
  static late EdgeInsets padding;
  static late MediaQueryData _mediaQueryData;
  static late Brightness platformBrightness;
  static late Orientation orientation;
  static late List<DisplayFeature> displayFeatures;
  static late double textScaleFactor;

  static void setScreenSize() {
    _mediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    height = _mediaQueryData.size.height;
    width = _mediaQueryData.size.width;
    padding = _mediaQueryData.padding;
    platformBrightness = _mediaQueryData.platformBrightness;
    orientation = _mediaQueryData.orientation;
    displayFeatures = _mediaQueryData.displayFeatures;
    textScaleFactor = _mediaQueryData.textScaleFactor;

    log('$width x $height', name: 'Screen local pixel');
  }
}
