import 'package:flutter/material.dart';

class MediaSize {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  void setMediaSize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
