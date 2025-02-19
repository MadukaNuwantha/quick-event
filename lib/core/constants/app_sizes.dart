import 'package:flutter/material.dart';

class ScreenSize {
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
  static double textScaleFactor(BuildContext context, double textSize) =>
      MediaQuery.of(context).textScaler.scale(textSize);
  static EdgeInsets padding(BuildContext context) => MediaQuery.of(context).padding;
}
