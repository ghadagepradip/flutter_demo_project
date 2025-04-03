import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static late bool isTablet;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
    widthMultiplier = blockSizeHorizontal;

    isTablet = screenWidth > 600; // Tablet check
  }
}

// Extensions for easy usage
extension SizeUtils on num {
  double get h => this * SizeConfig.heightMultiplier;
  double get w => this * SizeConfig.widthMultiplier;
  double get t => this * SizeConfig.textMultiplier;
}
