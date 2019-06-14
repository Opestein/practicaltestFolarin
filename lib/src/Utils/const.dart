import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

final themeColor = Colors.orange.shade800;
final primaryColor = Colors.orange.shade800;
//final secondaryColor = Color(0xFFF60410);
//final lightWhite = Color(0xFFB6B4B4);
final white = Color(0xFFFFFFFF);
final black = Color(0xFF000000);
final dark = Color.fromRGBO(0, 0, 0, 0.9);
//final green = Color(0xFF06702C);

final nairaString = "₦";

//100% — FF
//95% — F2
//90% — E6
//85% — D9
//80% — CC
//75% — BF
//70% — B3
//65% — A6
//60% — 99
//55% — 8C
//50% — 80
//45% — 73
//40% — 66
//35% — 59
//30% — 4D
//25% — 40
//20% — 33
//15% — 26
//10% — 1A
//5% — 0D
//0% — 00

//OrientationBuilder(
//builder: (context, orientation) {
//return orientation == Orientation.portrait
//? _buildVerticalLayout()
//    : _buildHorizontalLayout();
//},
//),

//SystemChrome.setPreferredOrientations(DeviceOrientation.portraitUp);

//width: 100.0 * MediaQuery.of(context).devicPixelRatio

//double responsiveWidth(context, double width) {
//  double actualWidth = width * MediaQuery.of(context).devicePixelRatio;
//
//  return actualWidth;
//}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

double responsiveWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockHorizontal = _mediaQueryData.size.width / 100;
  double actualWidth = width * blockHorizontal;

  return actualWidth;
}

double responsiveHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockVertical = _mediaQueryData.size.height / 100;
  double actualHeight = height * blockVertical;

  return actualHeight;
}

double safeAreaWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;

  double safeAreaBlockHorizontal =
      (_mediaQueryData.size.width - safeAreaHorizontal) / 100;
  double actualWidth = width * safeAreaBlockHorizontal;

  return actualWidth;
}

double safeAreaHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

  double safeAreaBlockVertical =
      (_mediaQueryData.size.height - safeAreaVertical) / 100;
  double actualHeight = height * safeAreaBlockVertical;

  return actualHeight;
}
