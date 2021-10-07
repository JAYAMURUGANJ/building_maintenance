import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class Constants {
  static const kPurpleColor = Color(0xFFB97DFE);
  static const kRedColor = Color(0xFFFE4067);
  static const kGreenColor = Color(0xFFADE9E3);

//for responsive device width
  static const int webmax = 2560;
  static const int webmid = 1440;
  static const int webmin = 1024;
  static const int tabmax = 768;
  static const int mobmax = 425;
  static const int mobmid = 375;
  static const int mobmin = 320;
}
