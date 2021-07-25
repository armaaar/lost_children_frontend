import 'package:flutter/material.dart';

abstract class ThemeSettings {
  // Screen
  static const double screenMaxWidth = 1100;

  // Colors
  static const MaterialColor colorSwatch = Colors.blue;
  static const Color colorText = Color(0xff000000);
  static const Color colorTextInvert = Color(0xffffffff);
  static const Color colorNavigation = Color(0xffffffff);
  static const Color colorError = Color(0xffff3548);
  static const Color colorSuccess = Color(0xff01c851);

  // Font sizes
  static const double fontSizeNormal = 16;
  static const double fontSizeHeadline = 32;

  // spacing
  static const double spaceNotch = 5;
  static const double spaceText = 10;
  static const double spaceButton = 20;
  static const double spaceSection = 20;

  // radius
  static const double radiusButton = 8;
  static const double radiusTile = 16;

  // Icons sizes
  static const double iconSizeLarge = 100;
}
