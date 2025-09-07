import 'package:flutter/widgets.dart';

/// Size screen (width and height)
class SizeScreen {
  /// Get width screen
  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  /// Get sixty percent of width screen
  static double sixtyPercentWidth(BuildContext context) {
    return width(context) * 0.6;
  }

  /// Get sixty percent of width screen
  static double seventyPercentWidth(BuildContext context) {
    return width(context) * 0.7;
  }

  /// Get 60% of screen height
  static double eightyPercentWidth(BuildContext context) {
    return width(context) * 0.8;
  }

  /// Get 70% of screen height
  static double ninetyPercentWidth(BuildContext context) {
    return width(context) * 0.9;
  }

  /// Get width screen/2
  static double halfScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 2;
  }

  /// Get width screen/3
  static double thirdScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 3;
  }

  /// Get width screen/4
  static double quarterScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 4;
  }

  /// Get width screen/5
  static double fifthScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 5;
  }

  /// Get width screen/6
  static double sixthScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 6;
  }

  /// Get width screen/7
  static double seventhScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 7;
  }

  /// Get width screen/8
  static double eighthScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 8;
  }

  /// Get width screen/9
  static double ninthScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width / 9;
  }

  /// Get height screen
  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  /// Get height screen/2
  static double halfScreenHeight(BuildContext context) {
    return height(context) / 2;
  }

  /// Get 60% of width screen
  static double sixtyPercentHeight(BuildContext context) {
    return height(context) * 0.6;
  }

  /// Get 70% of width screen
  static double seventyPercentHeight(BuildContext context) {
    return height(context) * 0.7;
  }

  /// Get 80% of screen height
  static double eightyPercentHeight(BuildContext context) {
    return height(context) * 0.8;
  }

  /// Get 90% of screen height
  static double ninetyPercentHeight(BuildContext context) {
    return height(context) * 0.9;
  }

  /// Get height screen/3
  static double thirdScreenHeight(BuildContext context) {
    return height(context) / 3;
  }

  /// Get height screen/4
  static double quarterScreenHeight(BuildContext context) {
    return height(context) / 4;
  }

  /// Get height screen/5
  static double fifthScreenHeight(BuildContext context) {
    return height(context) / 5;
  }

  /// Get height screen/6
  static double sixthScreenHeight(BuildContext context) {
    return height(context) / 6;
  }

  /// Get height screen/7
  static double seventhScreenHeight(BuildContext context) {
    return height(context) / 7;
  }

  /// Get height screen/8
  static double eighthScreenHeight(BuildContext context) {
    return height(context) / 8;
  }

  /// Get height screen/9
  static double ninthScreenHeight(BuildContext context) {
    return height(context) / 9;
  }
}
