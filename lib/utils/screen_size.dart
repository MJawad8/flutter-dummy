import 'package:flutter/material.dart';

class ScreenSize {
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeightPer(BuildContext context, double value) =>
      (value * MediaQuery.of(context).size.height) / 100;

  static double screenWidthPer(BuildContext context, double value) =>
      (value * MediaQuery.of(context).size.width) / 100;
}
